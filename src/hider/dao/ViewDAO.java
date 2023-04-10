package hider.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import hider.bean.Bean;
import hider.dbconn.DBConnection;

public class ViewDAO extends DBConnection{
	Connection con = null;
	public ViewDAO() {
		con=getConnection();
	}
	
	public ArrayList<Bean> adminViewNewUserRequest()throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select uid,uname,email,mobile,dob,address from userdetails where status='inactive'");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setUid(rs.getInt(1));
			b.setUname(rs.getString(2));
			b.setEmail(rs.getString(3));
			b.setMobile(rs.getString(4));
			Date da = rs.getDate(5);
			SimpleDateFormat sd = new SimpleDateFormat("dd-MM-yyyy");
			b.setDob(sd.format(da));
			b.setAddress(rs.getString(6));
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> adminViewUsers()throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select uid,uname,email,mobile,dob,address from userdetails where status='active'");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setUid(rs.getInt(1));
			b.setUname(rs.getString(2));
			b.setEmail(rs.getString(3));
			b.setMobile(rs.getString(4));
			Date da = rs.getDate(5);
			SimpleDateFormat sd = new SimpleDateFormat("dd-MM-yyyy");
			b.setDob(sd.format(da));
			b.setAddress(rs.getString(6));
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> userViewUsers(int uid)throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select email from userdetails where status='active' and not uid=?");
		ps.setInt(1, uid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setEmail(rs.getString(1));			
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> dhViewFilesForAccept()throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select fid,fname,sendermail,receivermail from files where status='File waiting at Data Hider'");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setFid(rs.getInt(1));
			b.setFname(rs.getString(2));
			b.setEmail(rs.getString(3));
			b.setRmail(rs.getString(4));
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> dhViewFilesForAccept(int fid)throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select originalfile,file1,file2,file3 from files where status='File waiting at Data Hider' and fid=?");
		ps.setInt(1, fid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setFile(rs.getBytes(1));
			b.setFile1(rs.getBytes(2));
			b.setFile2(rs.getBytes(3));
			b.setFile3(rs.getBytes(4));
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> userViewInboxFiles(String email)throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select fid,fname,sendermail,pkey from files where status='Received' and receivermail=?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setFid(rs.getInt(1));
			b.setFname(rs.getString(2));
			b.setEmail(rs.getString(3));
			b.setPassword(rs.getString(4));
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> userViewInboxFile(int fid, String email)throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select file1,file2,file3,pkey from files where status='Received' and fid=? and receivermail=?");
		ps.setInt(1, fid);
		ps.setString(2, email);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setFile1(rs.getBytes(1));
			b.setFile2(rs.getBytes(2));
			b.setFile3(rs.getBytes(3));
			b.setPassword(rs.getString(4));
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> userViewOriginalFile(int fid, String email)throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select originalfile,message from files where status='Received' and fid=? and receivermail=?");
		ps.setInt(1, fid);
		ps.setString(2, email);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setFile(rs.getBytes(1));
			b.setMessage(rs.getString(2));
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> userViewOutBoxFile(int fid, String email)throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select originalfile,message from files where fid=? and sendermail=?");
		ps.setInt(1, fid);
		ps.setString(2, email);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setFile(rs.getBytes(1));
			b.setMessage(rs.getString(2));
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> userViewOutBoxFiles(String email)throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select fid,fname,receivermail,status from files where sendermail=?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setFid(rs.getInt(1));
			b.setFname(rs.getString(2));
			b.setRmail(rs.getString(3));
			b.setStatus(rs.getString(4));
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> adminViewMessagesStatus()throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select fid,sendermail,receivermail,status,time from files");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setFid(rs.getInt(1));
			b.setEmail(rs.getString(2));
			b.setRmail(rs.getString(3));
			b.setStatus(rs.getString(4));
			b.setMobile(rs.getTimestamp(5).toString());
			al.add(b);
		}
		return al;
	}
	
	public ArrayList<Bean> adminViewFeedBack()throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select fid,name,email,message from feedback");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean b = new Bean();
			b.setFid(rs.getInt(1));
			b.setUname(rs.getString(2));
			b.setEmail(rs.getString(3));
			b.setMessage(rs.getString(4));
			al.add(b);
		}
		return al;
	}
}