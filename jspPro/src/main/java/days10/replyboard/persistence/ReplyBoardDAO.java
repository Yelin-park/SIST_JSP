package days10.replyboard.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import days10.replyboard.domain.ReplyBoardDTO;

public class ReplyBoardDAO implements IReplyBoard{

	// 1. 싱글톤
	private ReplyBoardDAO() {}
	private static ReplyBoardDAO instance = new ReplyBoardDAO();
	public static ReplyBoardDAO getInstance() {
		return instance;
	}

	@Override
	public List<ReplyBoardDTO> selectList(Connection con) throws SQLException {

		String sql =
				" select rownum rnum, num,writer,email,subject,pass, regdate,readcount,ref,step,depth,content,ip "
						+  ", case       when ( sysdate - regdate ) < 0.041667  then  'true'      else 'false'      end  new "
						+ " from replyboard "
						+" order by ref desc, step asc";

		ArrayList<ReplyBoardDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<ReplyBoardDTO>();
				ReplyBoardDTO dto = null;
				do {
					dto =  new ReplyBoardDTO();

					dto.setNum( rs.getInt("num") );
					dto.setWriter( rs.getString("writer"));
					dto.setEmail( rs.getString("email"));
					dto.setSubject( rs.getString("subject"));   
					dto.setReadcount( rs.getInt("readcount"));
					dto.setRegdate(rs.getDate("regdate"));
					dto.setIp( rs.getString("ip"));               
					dto.setRef( rs.getInt("ref"));         // X
					dto.setStep( rs.getInt("step"));     // X
					dto.setDepth(rs.getInt("depth"));
					dto.setNewImg( new Boolean(rs.getString("new")) );

					list.add(dto);
				} while ( rs.next() );
			} // 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally

		return list;
	} // selectList

	@Override
	public int insert(Connection con, ReplyBoardDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		int rowCount = 0;

		if( dto.getRef() == 0 ) {// 새글   
			String sql = "insert into replyboard ( "
					+" num, writer, email, subject, pass"
					+ ", ref, step, depth, content, ip )"
					+ " values "
					+" ( seq_replyboard.nextval,  ?,?,?,? "
					+ " , seq_replyboard.currval, ?,?,?,?  )";

			try {
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getSubject());
				pstmt.setString(4, dto.getPass());
				pstmt.setInt(5, dto.getStep());          // 새글일 때는  STEP     1
				pstmt.setInt(6, dto.getDepth());         // 새글일 때는  DEPTH 0
				pstmt.setString(7, dto.getContent());
				pstmt.setString(8, dto.getIp()); 

				rowCount = pstmt.executeUpdate();
			}finally {
				JdbcUtil.close(pstmt);
			} 
		}else{                             // 답글 + 부모의 REF 
			String sql = "insert into replyboard ( "
					+" num, writer, email, subject, pass"
					+ ", ref, step, depth, content, ip )"
					+ " values "
					+" ( seq_replyboard.nextval,  ?,?,?,? "
					+ " , ?,?,?,?,?  )";


			try {
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getSubject());
				pstmt.setString(4, dto.getPass());

				pstmt.setInt(5, dto.getRef()); // 부모 그룹            
				pstmt.setInt(6, dto.getStep());           
				pstmt.setInt(7, dto.getDepth());          

				pstmt.setString(8, dto.getContent());
				pstmt.setString(9, dto.getIp()); 

				rowCount = pstmt.executeUpdate();
			}finally {
				JdbcUtil.close(pstmt);
			} 			
		}
		return rowCount;
	} // insert

	@Override
	public int updateReadCount(Connection con, int num) throws SQLException {
		String sql = "update replyboard "
				+" set readcount = readcount +1 "
				+" where num = ?";

		PreparedStatement pstmt = null;      
		int rowCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rowCount = pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return rowCount;      
	} // updateReadCount

	@Override
	public ReplyBoardDTO selectOne(Connection con, int num) throws SQLException {
		String sql = "select * from replyboard "
				+" where num = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;      
		ReplyBoardDTO dto = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				dto =  new ReplyBoardDTO();

				dto.setNum( rs.getInt("num") );
				dto.setWriter( rs.getString("writer"));
				dto.setEmail( rs.getString("email"));
				dto.setSubject( rs.getString("subject"));   
				dto.setReadcount( rs.getInt("readcount"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setIp( rs.getString("ip"));
				dto.setStep( rs.getInt("step"));
				dto.setDepth(rs.getInt("depth"));

				dto.setRef(rs.getInt("ref"));
				dto.setPass(rs.getString("pass"));
				dto.setContent(rs.getString("content"));  
			}
		}  finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}

		return dto;
	} // selectOne

	// 동일한 ref(그룹)인 경우에는 step 1증가 시키는 메서드
	// 동일한 글그룹(REF)에서 부모순번(STEP) 보다 큰 것들의 STEP을 1증가
	@Override
	public int updateRefStep(Connection con, int parentRef, int parentStep) throws SQLException {
		String sql = "update replyboard "
				+ " set step = step + 1 "
				+ " where ref=? and step > ?";  

		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, parentRef);
			pstmt.setInt(2, parentStep);

			rowCount = pstmt.executeUpdate();

		}  finally {
			JdbcUtil.close(pstmt); 
		}

		return rowCount;
	}

	@Override
	public int delete(Connection con, int num) throws SQLException {

		return 0;
	}

}