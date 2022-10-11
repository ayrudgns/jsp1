package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdbc.util.OracleConnectionUtil;
import vo.CustomVo;


public class CustomDao {
	private static CustomDao dao = new CustomDao();

	private CustomDao() {
	}

	public static CustomDao getInstance() {
		return dao;
	}

	public List<CustomVo> getList() { // SELECT *
		Connection conn = OracleConnectionUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM TBL_CUSTOM ORDER BY custom_id";

		CustomVo vo;
		List<CustomVo> list = new ArrayList<CustomVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new CustomVo(rs.getString(1),
							rs.getString(2),
							rs.getString(3),
							rs.getInt(4), rs.getDate(5));
				list.add(vo);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("custom List 조회에 문제가 있습니다. : " + e.getMessage());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("close 오류 : " + e.getMessage());
			}
			OracleConnectionUtil.close(conn, pstmt);
		}
		return null;
	}
	

	public int insert(CustomVo vo) {	// INSERT
		Connection conn = OracleConnectionUtil.connect();
		String sql = "INSERT INTO TBL_CUSTOM (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE) "
				+ "VALUES(?, ?, ?, ?, SYSDATE)";
		PreparedStatement pstmt = null;
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getCustom_id());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setInt(4, vo.getAge()); 

			cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				System.out.println("회원 등록 완료!");
			} else {
				System.out.println("회원 등록 실패!");
			}
			
		} catch (SQLException e) {
			System.out.println("insert SQL 실행 오류 : "  + e.getMessage());
		} finally {
			OracleConnectionUtil.close(conn, pstmt);
		}
		return cnt;
	}

	public int update(CustomVo vo) {			// UPDATE
		Connection conn = OracleConnectionUtil.connect();
		String sql = "UPDATE TBL_CUSTOM SET EMAIL = ?, AGE = ? " + 
				" WHERE CUSTOM_ID = ?";   
		PreparedStatement pstmt = null;
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getCustom_id());
			
			cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				System.out.println("회원정보 수정 완료!");
			} else {
				System.out.println("회원정보 수정 실패!");
			}
			
		} catch (SQLException e) {
			System.out.println("update SQL 실행 오류 : " + e.getMessage());
		} finally {
			OracleConnectionUtil.close(conn, pstmt);
		}
		return cnt;
		
	}
	
//	�޼ҵ� 4 **************
	public CustomVo selectById(String customId) {	
		Connection conn = OracleConnectionUtil.connect();
		String sql = "SELECT * FROM TBL_CUSTOM WHERE CUSTOM_ID = ?";	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CustomVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, customId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new CustomVo(rs.getNString(1),
							rs.getNString(2),
							rs.getNString(3),
							rs.getInt(4), rs.getDate(5));
			}
		} catch (SQLException e) {
			System.out.println("select one SQL 실행 오류 : " + e.getMessage());
		}
		
		return vo;
	}
	
	public int delete(String id) {				// DELETE

		Connection conn = OracleConnectionUtil.connect();
		String sql = "DELETE FROM TBL_CUSTOM WHERE CUSTOM_ID = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, id);
			rs = pstmt.executeQuery();
			result = pstmt.executeUpdate();
			
			rs.close();
			
		} catch (SQLException e) {
			System.out.println("delete SQL 실행 오류 : " + e.getMessage());
		} finally {
			OracleConnectionUtil.close(conn, pstmt);
		}
		
		return result;
	}

}