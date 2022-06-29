package days11;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

@WebServlet("*.ss")
public class FileTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileTestServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		Connection con = null;

		try {
			// 원래는 어떤 요청인지 구분을 해야하는데 예제는 구분을 하지 않음
			// ㄱ.
			con = ConnectionProvider.getConnection();
			String saveDirectory = request.getRealPath("/days11/upload"); // ㄱ
			System.out.println(saveDirectory);
			File saveDir = new File(saveDirectory);
			if(!saveDir.exists()) saveDir.mkdirs(); // if

			// dao
			FileTestDAO dao = FileTestDAO.getInstance();

			// 요청url에 따라 달라짐..
			if(uri.indexOf("list.ss") != -1) { // 목록 보는 요청
				ArrayList<FileTestDTO> list = dao.selectFileList(con);
				request.setAttribute("list", list);

				String path = "/days11/ex05_list.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			} else if(uri.indexOf("write.ss") != -1) { // GET 방식
				
				String path = "/days11/ex05_write.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			} else if(uri.indexOf("write_ok.ss") != -1) { // POST 방식
				
				int maxPostSize = 5 * 1024 * 1024 ;  // 5MB
				String encoding = "UTF-8"; 
				FileRenamePolicy policy = new DefaultFileRenamePolicy();
				// cos.jar
				MultipartRequest mrequest = new MultipartRequest(
						request
						,  saveDirectory       
						,  maxPostSize
						, encoding
						, policy
						);
				//             -> 벌써 업로드한  파일은  저장 완료!!!
				// ㄴ. dto
				FileTestDTO dto = new FileTestDTO();
				String subject = mrequest.getParameter("subject");
				dto.setSubject(subject);
				// 첨부 파일 유무 확인
				File uploadFile = mrequest.getFile("attachFile");
				if ( uploadFile != null ) {  // 첨부 파일 존재할 경우

					String fileName = uploadFile.getName(); 
					long fileLength = uploadFile.length(); 
					String originalFileName = mrequest.getOriginalFileName("attachFile"); // DB에 저장되는 실제 파일명
					String filesystemName = mrequest.getFilesystemName("attachFile"); // 경로에 저장되는 파일명(중복된 값에는 index가 붙음)

					dto.setFilesystemname(filesystemName);
					dto.setOriginalfilename(originalFileName);
					dto.setFilelength(fileLength);
				} // if

				int rowCount = dao.insert(con, dto);
				response.sendRedirect("list.ss"); // 리다이렉트

			} else if(uri.indexOf("delete.ss") != -1) { // 글삭제 요청
				// http://localhost/jspPro/days11/delete.ss?num=3&filesystemname=ojdbc61.jar
				// http://localhost/jspPro/days11/delete.ss?num=3&filesystemname=

				int num = Integer.parseInt(request.getParameter("num"));
				String filesystemname = request.getParameter("filesystemname");

				// 1. 테이블 삭제 작업
				int rowCount = dao.delete(con, num);

				// 2. 첨부된 파일이 있다면 해당 파일도 삭제
				String pathname = String.format("%s%s%s", saveDirectory, File.separator, filesystemname);
				File deleteFile = new File(pathname);
				if (deleteFile.exists()) {               deleteFile.delete();            }

				// 1+2 완료
				String location = "/jspPro/days11/ex05_list.ss";
				response.sendRedirect(location);

			} else if(uri.indexOf("update.ss") != -1) { // 업데이트 요청
				// update.ss?num=1&filesystemname=Setup.log
				int num = Integer.parseInt( request.getParameter("num") );
				FileTestDTO dto = dao.selectOne(con, num);
				request.setAttribute("dto", dto);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/days11/ex05_update.jsp");
				dispatcher.forward(request, response);

			} else if(uri.indexOf("update_ok.ss") != -1) { // 업데이트 완료시
				// http://localhost/jspPro/days11/update.ss?num=4&filesystemname=	없는 경우
				// http://localhost/jspPro/days11/update.ss?num=4&filesystemname=ojdbc6.jar 파일 잇는 경우
				// ㄱ. write_ok.ss  코딩을 복사 -> 붙이기
				int maxPostSize = 5 * 1024 * 1024 ;  // 5MB
				String encoding = "UTF-8"; 
				FileRenamePolicy policy = new DefaultFileRenamePolicy();
				MultipartRequest mrequest = new MultipartRequest(
						request
						,  saveDirectory       
						,  maxPostSize
						, encoding
						, policy
						);
				//      -> 벌써 업로드한  파일은  저장 완료!!! 

				// ㄴ. dto
				FileTestDTO dto = new FileTestDTO();

				int num = Integer.parseInt( mrequest.getParameter("num") );
				String subject = mrequest.getParameter("subject");
				dto.setNum( num );    
				dto.setSubject(subject);

				File uploadFile = mrequest.getFile("attachFile");

				// 새로 첨부된          첨부파일이 있을 경우
				// 1. 테이블의 레코드 update
				// 2. 이전 첨부파일 있으면 삭제
				if ( uploadFile != null ) {   //  a.txt파일 삭제                         b.txt 파일 추가

					String fileName = uploadFile.getName(); 
					long fileLength = uploadFile.length(); 
					String originalFileName = mrequest.getOriginalFileName("attachFile");
					String filesystemName = mrequest.getFilesystemName("attachFile");

					dto.setFilesystemname(filesystemName);
					dto.setOriginalfilename(originalFileName);
					dto.setFilelength(fileLength);

					// 첨부된 파일이 있다면 이전 첨부파일은 삭제 코딩 추가...
					String delete_filesystemname = mrequest.getParameter("filesystemname");
					String deleteFilePath = String.format("%s%s%s",   saveDirectory, File.separator,delete_filesystemname);   

					File deleteFile = new File(deleteFilePath);
					if( deleteFile.exists() ) deleteFile.delete(); 
				}// if
				
				// 
				dao.update(con, dto);
				// list.ss 이동
				String location = "/jspPro/days11/ex05_list.ss";
				response.sendRedirect(location);

			} // if

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	} // doPost

} // class
