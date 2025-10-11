package hiresenseapp.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static Connection conn;
	public static void openConnection(String dbUrl,String username,String password) {
		try {
			conn=DriverManager.getConnection(dbUrl,username,password);
			System.out.println("Connected successfully to the Database");
		}catch(SQLException ex) {
			System.out.println("Cannot open the connection in DBConnection");
			ex.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		if(conn==null) {
			throw new SQLException("Connection not open");
		}
		return conn;
	}
	
	public static void closeConnection() {
		if(conn!=null) {
			try {
				conn.close();
				System.out.println("Connection clodes successfully");
			}catch(SQLException ex) {
				System.out.println("Cannot close the connection in DBConnection");
				ex.printStackTrace();
			}
		}
	}

}
