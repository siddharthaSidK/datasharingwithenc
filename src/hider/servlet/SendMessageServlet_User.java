package hider.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import hider.bean.Bean;
import hider.dao.SecurityDAO;


@WebServlet("/SendMessageServlet_User")
public class SendMessageServlet_User extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Bean b = new Bean();
		
		String extension = null;
		
		HttpSession ses = request.getSession();
		int uid = (Integer)ses.getAttribute("uid");
		String name = (String)ses.getAttribute("name");
		String mail = (String)ses.getAttribute("email");
		try {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		List li = fileUpload.parseRequest(request);
		
		FileItem user=(FileItem) li.get(0);
		
		String receiveremail = user.getString();
		
		FileItem image=(FileItem) li.get(1);
		FileItem message=(FileItem) li.get(2);
		
		String receivermessage = message.getString();
		
		 byte[] imagebyte = image.get();
		 String fname = image.getName();
		 extension = fname.substring(fname.lastIndexOf("."));
		 if(extension.equals(".jpg")||extension.equals(".png")||extension.equals(".jpeg")) 
		 {
			 b.setUid(uid);
			 b.setEmail(mail);
			 b.setRmail(receiveremail);
			 b.setFile(imagebyte);
			 b.setMessage(receivermessage);
			 b.setFname(fname);
			 
			 int i = new SecurityDAO(). uploadImage(b);
			 
			 if(i!=0) {
			 RequestDispatcher rd = request.getRequestDispatcher("SendMessage_User.jsp?status=File send to Data Hider for accept");
			 rd.include(request, response);
			 }
			 else 
			 {
				 RequestDispatcher rd = request.getRequestDispatcher("SendMessage_User.jsp?status=Faild to Upload");
				 rd.include(request, response);
			 }
			 
		 }else 
		 {
			 RequestDispatcher rd = request.getRequestDispatcher("UploadImageFile_DO.jsp?status=Image Should be in .jpg or .png or .jpeg format");
			 rd.include(request, response);
		 }
		}catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("UploadImageFile_DO.jsp?status=Some Internal Error");
			 rd.include(request, response);
		}
	}

}
