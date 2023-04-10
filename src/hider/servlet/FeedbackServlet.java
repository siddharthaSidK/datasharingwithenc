package hider.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hider.bean.Bean;
import hider.dao.SecurityDAO;


@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String t="";
		Bean b = new Bean();
		b.setUname(request.getParameter("name"));
		b.setEmail(request.getParameter("email"));
		b.setMessage(request.getParameter("message"));
		
			try {
			int i = new SecurityDAO().feedBack(b);
			if(i!=0) 
			{
				t="index.jsp?status=Submited Successful";
			}
			else 
			{
				t="index.jsp?status=Not Submited";
			}
			}catch (Exception e) {
				t="index.jsp?status=Some Internal Error";
			}
		response.sendRedirect(t);
	}

}
