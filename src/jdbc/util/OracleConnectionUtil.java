package jdbc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OracleConnectionUtil {
// 웹 애플리케이션의 파일은 ojbdbc11.jar 파일을 WEB_INF 폴더 아래 lib 폴더에 복사하여 라이브러리를 사용한다.
	public static Connection connect() {
		
		Connection conn = null;

		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String user = "C##IDEV";
		String password = "1234";

		
		try {
			Class.forName(driver);

			conn = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			System.out.println("데이터베이스 드라이버 로드에 문제가 생겼습니다. : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 및 사용에 문제가 생겼습니다. : " + e.getMessage());
		} 
		
		return conn;
	}
	
	public static void close(Connection conn, PreparedStatement pstmt) {

			try {
				if(conn != null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}	
			} catch (SQLException e) {
				System.out.println("데이터베이스 연결 종료에 오류 발생 ! : " + e.getMessage());
			}
	}

}
