package hider.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hider.dao.SecurityDAO;


@WebServlet("/AcceptNewUserServlet_admin")
public class AcceptNewUserServlet_admin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String t="";
		int uid = Integer.parseInt(request.getParameter("uid"));
		if(uid!=0) 
		{
			try {
			int i = new SecurityDAO().adminAcceptNewUser(uid);
			if(i!=0) 
			{
				t="NewUsers_Admin.jsp?status=Accepted Successful";
			}
			else 
			{
				t="NewUsers_Admin.jsp?status=Not Accepted";
			}
			}catch (Exception e) {
				t="NewUsers_Admin.jsp?status=Some Internal Error";
			}
		}else 
		{
			t="NewUsers_Admin.jsp?status=Uid Not Selected";
		}
		response.sendRedirect(t);
	}
}