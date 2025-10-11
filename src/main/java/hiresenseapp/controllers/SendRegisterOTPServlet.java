package hiresenseapp.controllers;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hiresenseapp.utils.MailUtil;



public class SendRegisterOTPServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String role=request.getParameter("role");
		
		String otp=String.valueOf((int)Math.random()*900000+100000);
		
		session.setAttribute("regOTP", otp);
		session.setAttribute("regName", name);
		session.setAttribute("regEmail", email);
		session.setAttribute("regPassword", password);
		session.setAttribute("regRole", role);
		
		String appName=(String)super.getServletContext().getAttribute("appName");
		
		try {
			MailUtil.sendTextEmail(email, "Your OTP for "+appName+" Registration", "Hii "+name+"\n\n Your OTP to complete the registration process");
			response.sendRedirect("register.jsp?showOtp=true");
		} catch (MessagingException e) {
			throw new ServletException("Error in sending mail:"+e.getMessage());
		}
		
		
		
		
	}

}
