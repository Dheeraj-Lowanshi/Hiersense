package hiresenseapp.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hiresenseapp.dao.UserDao;
import hiresenseapp.pojo.UserPojo;


public class VerifyRegisterOTPServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputOtp=request.getParameter("otp");
		HttpSession session=request.getSession();
		String actualOtp=(String)session.getAttribute("regOTP");
		if(inputOtp.equals(actualOtp)) {
			String name=(String)session.getAttribute("regName");
			String email=(String)session.getAttribute("regEmail");
			String password=(String)session.getAttribute("regPassword");
			String role=(String)session.getAttribute("regRole");
			
			UserPojo user=new UserPojo(0,name,email,password,role,"active",null);
			try {
				UserDao.registerUser(user);
				session.removeAttribute("regOTP");
				response.sendRedirect("login.jsp?registered=true");
			} catch (Exception ex) {
				throw new ServletException("Error in OTP verification/registration:"+ex.getMessage());
			}
		}
		else {
			response.sendRedirect("login.jsp?showOtp=true&error=invalid");
		}
	}

}
