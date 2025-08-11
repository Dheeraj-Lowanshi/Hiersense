package hiersenseapp.dbutil;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AppInitializer implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		ServletContext ctxt = sce.getServletContext();
		String dbUrl = ctxt.getInitParameter("dbUrl");
		String username = ctxt.getInitParameter("username");
		String password = ctxt.getInitParameter("password");
		DBConnection.openConnection(dbUrl, username, password);
		String appName = ctxt.getInitParameter("appName");
		ctxt.setAttribute("appName", appName);
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		DBConnection.closeConnection();
	}

}
