package hiresenseapp.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hiresenseapp.dao.JobDao;
import hiresenseapp.pojo.JobPojo;



public class EmployerDashboardServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		if(session==null || session.getAttribute("userId")==null || !"emplyer".equals((String)session.getAttribute("userRole"))) {
			response.sendRedirect("login.jsp");
			return;
		}
		int employerId=(Integer)session.getAttribute("userId");
		String search=request.getParameter("search");
		String sort=request.getParameter("sort");
		String status=request.getParameter("status");
		
		try {
			List<JobPojo>jobList=JobDao.getJobsByEmployer(employerId, search, status, sort);
			request.setAttribute("jobList", jobList);
			request.setAttribute("search", search);
			request.setAttribute("sort", sort);
			request.setAttribute("status", status);
			
			RequestDispatcher rd=request.getRequestDispatcher("employeDashboard.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");			
		}
	}

	

}
