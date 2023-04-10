package hider.dao;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import com.sun.org.apache.xml.internal.security.utils.Base64;

import hider.bean.Bean;
import hider.dbconn.DBConnection;
import sun.misc.BASE64Encoder;

public class SecurityDAO extends DBConnection {
	Connection con= null;
	public SecurityDAO() {
		con=getConnection();
	}
	
	public int reg(Bean b) throws Exception
	{
		int i = 0;
		PreparedStatement ps = con.prepareStatement("insert into userdetails(uname,email,password,mobile,dob,status,address,utype)values(?,?,?,?,?,'inactive',?,'user')");
		ps.setString(1, b.getUname());
		ps.setString(2, b.getEmail());
		ps.setString(3, b.getPassword());
		ps.setString(4, b.getMobile());
		String da = b.getDob();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new  Date(sd.parse(da).getTime());
		ps.setDate(5, date);
		ps.setString(6, b.getAddress());
		i=ps.executeUpdate();
		return i;
	}
	
	public int adminAcceptNewUser(int uid) throws Exception
	{
		int i = 0;
		PreparedStatement ps = con.prepareStatement("update userdetails set status='active' where uid=?");
		ps.setInt(1, uid);
		i=ps.executeUpdate();
		return i;
	}
	
	public ArrayList<Bean> login(Bean b) throws Exception
	{
		ArrayList<Bean> al = new ArrayList<Bean>();
		PreparedStatement ps = con.prepareStatement("select uid,email,utype,uname from userdetails where email=? and password=? and status='active'");
		ps.setString(1, b.getEmail());
		ps.setString(2, b.getPassword());
		ResultSet rs = ps.executeQuery();
		while(rs.next()) 
		{
			Bean login = new Bean();
			login.setUid(rs.getInt(1));
			login.setEmail(rs.getString(2));
			login.setStatus(rs.getString(3));
			login.setUname(rs.getString(4));
			al.add(login);
		}
		return al;
	}
	
	public int uploadImage(Bean b) throws Exception
	{
		int i = 0;
		PreparedStatement ps = con.prepareStatement("insert into files(fname,senderid,sendermail,receivermail,originalfile,file1,file2,file3,message,ciphertext,pkey,skey,status,time)values(?,?,?,?,?,?,?,?,?,?,?,?,'File waiting at Data Hider',CURRENT_TIMESTAMP)");
		ps.setString(1, b.getFname());
		ps.setInt(2, b.getUid());
		ps.setString(3, b.getEmail());
		ps.setString(4, b.getRmail());
		ps.setBytes(5, b.getFile());
		
		String filetxt = new String(b.getFile());
		String message = b.getMessage();
		byte[] msg =  message.getBytes();
		Random rd = new Random();
		Long lo =  (long) rd.nextInt(1000000000);
		String key = lo.toString();
		
		KeyGenerator keyGen = KeyGenerator.getInstance("AES");
		keyGen.init(128);
		SecretKey secretkey = keyGen.generateKey();
		String skey = secretkey.toString();
		String stringKey = Base64.encode(secretkey.getEncoded());
		System.out.println("scretkey " + stringKey);
		
		Cipher aescipher = Cipher.getInstance("AES");
		aescipher.init(Cipher.ENCRYPT_MODE, secretkey);
		
		byte[] byteDataToEncrypt = filetxt.getBytes();
		
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream( );
		outputStream.write( byteDataToEncrypt );
		outputStream.write( msg );

		byte combine[] = outputStream.toByteArray( );
		
		
		byte[] byteCipherText = aescipher.doFinal(byteDataToEncrypt);
		String cipherText = new BASE64Encoder().encode(byteCipherText);
		ps.setBytes(6, byteDataToEncrypt);
		ps.setBytes(7, combine);
		ps.setBytes(8, combine);
		ps.setString(9, message);
		ps.setString(10, cipherText);
		ps.setString(11, key);
		ps.setString(12, skey);
		i=ps.executeUpdate();
		return i;
	}
	
	public int dhAcceptMessage(int fid) throws Exception
	{
		int i = 0;
		PreparedStatement ps = con.prepareStatement("update files set status='Received' where fid=?");
		ps.setInt(1, fid);
		i=ps.executeUpdate();
		return i;
	}
	
	public int feedBack(Bean b) throws Exception
	{
		int i = 0;
		PreparedStatement ps = con.prepareStatement("insert into feedback(name,email,message)values(?,?,?)");
		ps.setString(1, b.getUname());
		ps.setString(2, b.getEmail());
		ps.setString(3, b.getMessage());
		i=ps.executeUpdate();
		return i;
	}
}