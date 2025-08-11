package hiersenseapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hiersenseapp.dbutil.DBConnection;
import hiersenseapp.pojo.ApplicationPojo;

public class ApplicationDao {

	public static boolean apply(ApplicationPojo app) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement("insert into applications (user_id,job_id,resume_path,score) values (?,?,?,?)");
			ps.setInt(1, app.getUserId());
			ps.setInt(2, app.getJobId());
			ps.setString(3, app.getResumePath());
			ps.setDouble(4, app.getScore());
			int ans = ps.executeUpdate();
			return ans > 0;
		} finally {
			if (ps != null) {
				ps.close();
			}
		}
	}

	public static List<ApplicationPojo> getApplicationByUser(int userid) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ApplicationPojo> appList = new ArrayList<>();
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement("select * from applications where user_id=?");
			ps.setInt(1, userid);
			rs = ps.executeQuery();
			while (rs.next()) {
				ApplicationPojo app = new ApplicationPojo();
				app.setId(rs.getInt("id"));
				app.setJobId(rs.getInt("job_id"));
				app.setUserId(rs.getInt("user_id"));
				app.setResumePath(rs.getString("resume_path"));
				app.setScore(rs.getDouble("score"));
				app.setStatus(rs.getString("status"));
				app.setAppliedAt(rs.getString("applied_at"));
				appList.add(app);
			}
			return appList;
		} finally {
			if (rs!=null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
		}
	}
	
	
	
	
	
	
	

}
