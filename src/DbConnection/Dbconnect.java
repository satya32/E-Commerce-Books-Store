package DbConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconnect {
	private static Connection conn=null;

	public static Connection getCon() {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2.create connection....
			String user = "root";
			String password = "satya1395";
			String url = "jdbc:mysql://localhost:3306/e-book";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
