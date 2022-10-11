package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vo.MoneySum;
import vo.QuanSum;
import jdbc.util.OracleConnectionUtil;

public class AggrDao {
// �ۼ��� : �̰���
	private static AggrDao dao = new AggrDao();
	private AggrDao() {}
	public static AggrDao getInstance() {
		return dao;
	}
	
	public List<QuanSum> quanSum() {
		
		List<QuanSum> qlist = new ArrayList<>();
		Connection conn = OracleConnectionUtil.connect();
		String sql = "SELECT PCODE, SUM(QUANTITY) FROM TBL_BUY tb " + 
				"GROUP BY PCODE " + 
				"ORDER BY PCODE";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				qlist.add(new QuanSum(rs.getString(1), rs.getInt(2)));
			}
			
		} catch (SQLException e) {
			System.out.println("quanSum 실행 오류 : " + e.getMessage());
		} finally {
			OracleConnectionUtil.close(conn, pstmt);
		}
		
		return qlist;
	}
	
	public List<MoneySum> moneySum() {
		
		List<MoneySum> list = new ArrayList<>();
		Connection conn = OracleConnectionUtil.connect();
		String sql = "SELECT BUY_DATE2, SUM(MONEY) DAYSUM " +
				"FROM (SELECT TO_CHAR(BUY_DATE,'YYYY-MM-DD') BUY_DATE2, (QUANTITY * PRICE) MONEY " +
				"FROM TBL_BUY tb, TBL_PRODUCT tp " + 
				"WHERE tb.PCODE = tp.PCODE) " + 
				"GROUP BY BUY_DATE2 " +
				"ORDER BY BUY_DATE2";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				list.add(new MoneySum(rs.getDate(1), rs.getInt(2)));
			}
			
		} catch (SQLException e) {
			System.out.println("moneySum 실행 오류 : " + e.getMessage());
		} finally {
			OracleConnectionUtil.close(conn, pstmt);
		}
		
		return list;
	}

}
