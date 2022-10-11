package hrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hrd.vo.MoneyVo;
import jdbc.util.OracleConnectionUtil;

public class MoneyDao {
	private static MoneyDao dao = new MoneyDao();
	
	private MoneyDao() {
		
	}
	
	public static MoneyDao getInstance() {
		return dao;
	}
	
	// SELECT
	public List<MoneyVo> getList() {
		Connection conn = OracleConnectionUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT MET.CUSTNO, CUSTNAME, " +
				"DECODE(MET.GRADE, 'A', 'VIP', 'B', '일반', 'C','직원') AS GRADE, " +
				"SALE.ASUM FROM MEMBER_TBL_02 MET JOIN " +
				"(SELECT CUSTNO, SUM(PRICE) ASUM FROM MONEY_TBL_02 MOT " +
				"GROUP BY CUSTNO ORDER BY ASUM DESC) SALE " +
				"ON MET.CUSTNO = SALE.CUSTNO "
				+ "ORDER BY SALE.ASUM DESC";
		
		MoneyVo vo;
		List<MoneyVo> mnlist = new ArrayList<>(); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new MoneyVo(rs.getInt(1), rs.getString(2), 
						rs.getString(3), rs.getInt(4));
				
				mnlist.add(vo);
			}
			return mnlist;
			
		} catch (SQLException e) {
			System.out.println("moneyList 조회 오류 : " + e.getMessage());
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

	
}
