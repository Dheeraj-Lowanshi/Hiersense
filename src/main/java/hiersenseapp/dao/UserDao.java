package hiersenseapp.dao;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hiersenseapp.dbutil.DBConnection;
import hiersenseapp.pojo.UserPojo;

public class UserDao {

	// Register User
	public static int registerUser(UserPojo user) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement("Insert into users(name,email,password,role) values(?,?,?,?)");
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getRole());
			count = ps.executeUpdate();

		} finally {
			if (ps != null) {
				ps.close();
			}
			return count;
		}

	}

	// Find User by Email
	public static UserPojo getUserByEmail(String email) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		UserPojo user = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement("Select * from users where email=?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				user = new UserPojo();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("password"));
				user.setPassword(rs.getString("password"));
				user.setStatus(rs.getString("status"));
				user.setCreatedAt(rs.getDate("created_at"));
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			return user;
		}

	}

	// Find User by Id
	public static UserPojo getUserById(int id) throws Exception {

		Connection conn = null;
		PreparedStatement ps = null;
		UserPojo user = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement("Select * from users where id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				user = new UserPojo();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("password"));
				user.setPassword(rs.getString("password"));
				user.setStatus(rs.getString("status"));
				user.setCreatedAt(rs.getDate("created_at"));
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			return user;
		}

	}

	// Get All Users List
	public static List<UserPojo> getAllUsers() throws Exception {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		List<UserPojo> userList = new ArrayList<>();
		try {
			conn = DBConnection.getConnection();
			st = conn.createStatement();
			rs = st.executeQuery("Select * from users order by id desc");
			while (rs.next()) {
				UserPojo user = new UserPojo();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				user.setStatus(rs.getString("status"));
				user.setCreatedAt(rs.getDate("created_at"));
				userList.add(user);
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (st != null) {
				st.close();
			}
			return userList;
		}

	}

	public static int updateStatus(int userId, String status) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement("update users set status=? where id=?");
			ps.setString(1, status);
			ps.setInt(2, userId);
			count = ps.executeUpdate();
		} finally {
			if (ps != null) {
				ps.close();
			}
			return count;
		}

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
