package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import vo.Buy;
import jdbc.util.OracleConnectionUtil;

public class BuyDao {

	private static BuyDao dao2 = new BuyDao();
	
	private BuyDao() {
		
	}
	
	public static BuyDao getInstance() {
		return dao2;
	}
	
	public int insert(Buy buy) {
		Connection conn = OracleConnectionUtil.connect();
		String sql = "INSERT INTO TBL_BUY (BUYNO, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE) " 
				+ "VALUES(TBLBUY_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)";
		PreparedStatement pstmt = null;
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, buy.getCustom_id());
			pstmt.setString(2, buy.getPcode());
			pstmt.setInt(3, buy.getQuantity());

			cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				System.out.println("구매 완료!");
			} else {
				System.out.println("구매 실패!");
			}
			
		} catch (SQLException e) {
			System.out.println("tbl_buy insert 오류! : " + e.getMessage());
		} finally {
			OracleConnectionUtil.close(conn, pstmt);
		}
		return cnt;
	}
}
