package daobjects;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DBProcess {


    public String savecustomer(String name,String phno,String address,String area,String email,String password)
    {
        try
        {
           Connection con=DBConnect.getCon();
           PreparedStatement pst=con.prepareStatement("insert into customers values(?,?,?,?,?,?,?)");

          
           pst.setString(1,name);
           pst.setString(2,phno);
           pst.setString(3,address);
           pst.setString(4, area);
           pst.setString(5,email);
           pst.setString(6,password);
           pst.setString(7, "0");
           pst.executeUpdate();
           con.close();
           return "success";
         }
         catch(Exception e)
         {
           return e.toString();
         }
    }
}
