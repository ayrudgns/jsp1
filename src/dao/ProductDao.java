package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Product;
import jdbc.util.OracleConnectionUtil;

public class ProductDao {

	private static ProductDao dao3 = new ProductDao();
	
	private ProductDao() {
		
	}
	
	public static ProductDao getInstance() {
		return dao3;
	}
	
	// 카테고리를 인자로 전달 받아서 SELECT 하는  메소드 작성하기
	public List<Product> getByCategory(String category) {
		List<Product> clist = new ArrayList<>();
		Connection conn = OracleConnectionUtil.connect();
		String sql = "SELECT * FROM TBL_PRODUCT WHERE CATEGORY = ? "
				+ "ORDER BY PCODE";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);	// 인자로 전달받은 값
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				clist.add(new Product(rs.getNString(1), rs.getNString(2), rs.getNString(3), rs.getInt(4)));
			}
			rs.close();
			
		} catch (SQLException e) {
			System.out.println("카테고리 기준 조회 오류 : " + e.getMessage());
		} finally {
			OracleConnectionUtil.close(conn, pstmt);
		}
		
		return clist;
	}
	
	
	public List<Product> getProducts() {
		List<Product> plist = new ArrayList<>();
		Connection conn = OracleConnectionUtil.connect();
		String sql = "SELECT * FROM TBL_PRODUCT ORDER BY PCODE";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				plist.add(new Product(rs.getNString(1), rs.getNString(2), rs.getNString(3), rs.getInt(4)));
			}
			
		} catch (SQLException e) {
			System.out.println("Product 조회 오류 : " + e.getMessage());
		}
		
		return plist;
	}
	 
	
	
	public int insert(Product product) {
		Connection conn = OracleConnectionUtil.connect();
		String sql = "INSERT INTO TBL_PRODUCT (PCODE, CATEGORY, PNAME, PRICE) " 
				+ "VALUES(?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, product.getPcode());
			pstmt.setString(2, product.getCategory());
			pstmt.setString(3, product.getPname());
			pstmt.setInt(4, product.getPrice());
			
//			pstmt.execute();
			cnt = pstmt.executeUpdate();		// insert 성공한 행의 개수를 리턴한다.
			System.out.println("tbl_product insert 정상 완료!");
			
		} catch (SQLException e) {
			System.out.println("tbl_product insert 오류!" + e.getMessage());
		} finally {
			OracleConnectionUtil.close(conn, pstmt);
		}
		return cnt;
	}
}
