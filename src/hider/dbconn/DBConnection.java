package hider.dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public Connection getConnection(){
		Connection con=null;
        try{
        	Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/MJDM09_2022";
            con=DriverManager.getConnection(url,"root","root");
            System.out.println("Data base---->"+con);
        }catch(Exception e)
         {
             e.printStackTrace();
         }
        return con;
    }
}
