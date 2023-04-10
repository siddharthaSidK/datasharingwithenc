package hider.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hider.bean.Bean;
import hider.dao.SecurityDAO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String t = "";
			Bean b = new Bean();
			String mail =  request.getParameter("email");
			String password = request.getParameter("password");
			
			int uid=0;
			String email=null;
			String utype=null;
			String name=null;
			
			if(mail.equalsIgnoreCase("admin@gmail.com")&&password.equalsIgnoreCase("admin")) 
			{
				t="adminHome.jsp?status=Welcome Admin";
			}
			else if(mail.equalsIgnoreCase("dh@gmail.com")&&password.equalsIgnoreCase("dh")) 
			{
				t="dhHome.jsp?status=Welcome Data Hider";
			}
			else 
			{
				b.setEmail(mail);
				b.setPassword(password);
				try {
				ArrayList<Bean> al = new SecurityDAO().login(b);
				for(Bean login:al) 
				{
					uid = login.getUid();
					email = login.getEmail();
					utype = login.getStatus();
					name = login.getUname();
				}
				if(!al.isEmpty()) 
				{
					if(utype.equals("user")) 
					{
						HttpSession ses = request.getSession();
						ses.setAttribute("email", email);
						ses.setAttribute("uid", uid);
						ses.setAttribute("name", name);
						t="userHome.jsp?status=Welcome "+name;
					}
				}else 
				{
					t="index.jsp?s=Invalid Email and Password";
				}
				}catch (Exception e) {
					e.printStackTrace();
					t="index.jsp?s=Some Internal Error";
				}
			}
			response.sendRedirect(t);
	}
}