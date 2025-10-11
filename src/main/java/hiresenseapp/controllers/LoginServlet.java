package hiresenseapp.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hiresenseapp.dao.UserDao;
import hiresenseapp.pojo.UserPojo;



public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String passward=request.getParameter("password");
		try {
			UserPojo user=UserDao.getUserByEmail(email);
			if(user!=null && passward.equals(user.getPassword()) && "active".equals(user.getStatus())) {
				HttpSession session=request.getSession();
				session.setAttribute("userId",user.getId());
				session.setAttribute("userName",user.getName());
				session.setAttribute("userRole",user.getRole());
				
				switch (user.getRole()) {
					case "admin":
						response.sendRedirect("AdminPanelServlet");
						break;
					case "employer":
						response.sendRedirect("EmployeDashboardServlet");
						break;
					default:
						response.sendRedirect("UserDashboardServlet");
						break;
				}
			}
			else {
				request.setAttribute("error","Invalid credentials or account is blocked");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		}
		catch (Exception e) {
			throw new ServletException("Login Failed:"+e.getMessage());
		}
	}

}
