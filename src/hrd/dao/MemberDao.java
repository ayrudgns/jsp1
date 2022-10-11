package hrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hrd.vo.MemberVo;
import jdbc.util.OracleConnectionUtil;

public class MemberDao {
	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {
		
	}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	// INSERT
	public int insert(MemberVo vo) {
		Connection conn = OracleConnectionUtil.connect();
		String sql = "INSERT INTO MEMBER_TBL_02 (CUSTNO, CUSTNAME, PHONE, ADDRESS, "
				+ "JOINDATE, GRADE, CITY) VALUES "
				+  "(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getCustno());
			pstmt.setString(2, vo.getCustname());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getJoindate());
			pstmt.setString(6, vo.getGrade());
			pstmt.setString(7, vo.getCity());
			
			cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				System.out.println("회원 등록 완료!");
			} else {
				System.out.println("회원 등록 실패!");
			}
			
		} catch (SQLException e) {
			System.out.println("member insert 오류 : " + e.getMessage());
		} finally {
			OracleConnectionUtil.close(conn, pstmt);
		}
		return cnt;
	}
	
	// SELECT
	public List<MemberVo> getList() {
		Connection conn = OracleConnectionUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, "
				+ "DECODE(GRADE, 'A', 'VIP', 'B', '일반', 'C', '직원') AS GRADE, CITY " 
				+ "FROM MEMBER_TBL_02 ORDER BY CUSTNO";
		
		MemberVo vo;
		List<MemberVo> mlist = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new MemberVo(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
				mlist.add(vo);
			}
			return mlist;
			
		} catch (SQLException e) {
			System.out.println("memeberList 조회 오류 : " + e.getMessage());
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
	
	// SELECT WHERE = 'ID'
	public MemberVo selectByCustno(int custno) {
		Connection conn = OracleConnectionUtil.connect();
		String sql = "SELECT * FROM MEMBER_TBL_02 WHERE CUSTNO = ?";	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new MemberVo(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}
		} catch (SQLException e) {
			System.out.println("selectByCustno 실행 오류 : " + e.getMessage());
		}
		return vo;
	}
	
	
	// UPDATE
	public int update(MemberVo vo) {
		Connection conn = OracleConnectionUtil.connect();
		String sql = "UPDATE MEMBER_TBL_02 SET " +
				"CUSTNAME = ?, PHONE = ?, ADDRESS = ?, JOINDATE = ?, GRADE = ?, CITY = ? " + 
				" WHERE CUSTNO = ?";
		PreparedStatement pstmt = null;
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(sql);	
			
			pstmt.setString(1, vo.getCustname());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getJoindate());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.setInt(7, vo.getCustno());
			
			cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				System.out.println("회원정보 수정 완료!");
			} else {
				System.out.println("회원정보 수정 실패!");
			}
		} catch (SQLException e){
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		} finally {
			OracleConnectionUtil.close(conn, pstmt);
		}
		return cnt;
	}

	
}
