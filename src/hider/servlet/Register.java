package hider.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hider.bean.Bean;
import hider.dao.SecurityDAO;


@WebServlet("/Register")
public class Register extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String t="";
		Bean b = new Bean();
		b.setUname(request.getParameter("name"));
		b.setEmail(request.getParameter("email"));
		b.setPassword(request.getParameter("password"));
		b.setMobile(request.getParameter("phone"));
		b.setDob(request.getParameter("dob"));
		b.setAddress(request.getParameter("address"));
		
		try {
		int i = new SecurityDAO().reg(b);
		if(i!=0) 
		{
			t="index.jsp?status=Successfully Registred";
		}
		else 
		{
			t="index.jsp?s=Not Registred";
		}
		}catch (Exception e) {
			t="index.jsp?s=Some Internal Error";
		}
		response.sendRedirect(t);
	}
}