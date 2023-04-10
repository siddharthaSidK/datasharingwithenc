package hider.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hider.dao.SecurityDAO;


@WebServlet("/AcceptMessageServlet_DH")
public class AcceptMessageServlet_DH extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String t="";
		int fid = Integer.parseInt(request.getParameter("fid"));
		if(fid!=0) 
		{
			try {
			int i = new SecurityDAO().dhAcceptMessage(fid);
			if(i!=0) 
			{
				t="AcceptMessages_DH.jsp?status=Accepted Successful";
			}
			else 
			{
				t="AcceptMessages_DH.jsp?status=Not Accepted";
			}
			}catch (Exception e) {
				t="AcceptMessages_DH.jsp?status=Some Internal Error";
			}
		}else 
		{
			t="AcceptMessages_DH.jsp?status=Uid Not Selected";
		}
		response.sendRedirect(t);
	}
}
