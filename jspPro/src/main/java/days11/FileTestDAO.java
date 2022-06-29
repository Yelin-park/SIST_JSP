package days11;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.JdbcUtil;

public class FileTestDAO {

	// 싱글톤
	private static FileTestDAO dao = null;
	private FileTestDAO() {}
	public static FileTestDAO getInstance() {
		if( dao == null ) {
			dao = new FileTestDAO();
		}
		return dao;
	}

	public int insert(Connection conn, FileTestDTO dto){
		
		int result = 0;
		
		String sql = "insert into filetest "
				+" (num, subject, filesystemname, originalfilename, filelength ) "
				+" values "
				+" ( seq_filetest.nextval , ?, ? ,? , ?) ";
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getFilesystemname());
			pstmt.setString(3, dto.getOriginalfilename());
			pstmt.setLong(4, dto.getFilelength());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("> dao.insert()  : " + e.toString());
		}finally {
			try { pstmt.close(); } catch (SQLException e) {e.printStackTrace(); }
		}
		return result;
	} // insert

	public ArrayList<FileTestDTO> selectFileList(Connection conn) {

		ArrayList<FileTestDTO> list =  null;

		String sql = 
				" select num, subject, filesystemname, originalfilename, filelength  "
						+" from filetest "
						+" order by num desc ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			FileTestDTO dto = null;
			if (rs.next()) {
				list = new ArrayList<FileTestDTO>();
				do {
					dto = new FileTestDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject( rs.getString("subject"));
					dto.setFilesystemname(rs.getString("filesystemname"));
					dto.setOriginalfilename(rs.getString("originalfilename"));
					dto.setFilelength(rs.getLong("filelength"));
					list.add(dto);
				} while (rs.next());
			} // 
		}catch(Exception e) {
			System.out.println("> dao.insert()  : " + e.toString());
		}finally {
			try { pstmt.close(); } catch (SQLException e) {e.printStackTrace();         }
		}

		return list;

	} // selectFileList

	public int delete(Connection conn, int num) {
		
		int result = 0;
		
		String sql = "delete from filetest where num = ?";
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return result;
	} // delete

	public FileTestDTO selectOne(Connection con, int num) {
		
		String sql = " select num, subject, filesystemname, originalfilename, filelength  "
					+" from filetest "
					+" where num = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FileTestDTO dto = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if( rs.next()) {
				dto = new FileTestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject( rs.getString("subject"));
				dto.setFilesystemname(rs.getString("filesystemname"));
				dto.setOriginalfilename(rs.getString("originalfilename"));
				dto.setFilelength(rs.getLong("filelength"));
			}
		}catch(Exception e) {
			System.out.println("> dao.insert()  : " + e.toString());
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return dto;
	} // selectOne

	public int update(Connection conn, FileTestDTO dto) {
		int result = 0;

		String sql = " update filetest "
				+ " set subject=?,filesystemname=?,originalfilename=?,filelength=?   "
				+ " where num = ?";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getFilesystemname());
			pstmt.setString(3, dto.getOriginalfilename() );
			pstmt.setLong(4, dto.getFilelength());
			pstmt.setInt(5, dto.getNum() );

			result = pstmt.executeUpdate();

		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}

		return result;

	} // update

} // class