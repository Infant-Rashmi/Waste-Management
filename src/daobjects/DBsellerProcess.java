package daobjects;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DBsellerProcess {


    public String savecustomer(String name,String phno,String area,String address,double amount,String date,boolean paid_or_not)
    {
        try
        {
           Connection con=DBConnect.getCon();
           PreparedStatement pst=con.prepareStatement("insert into customers values(?,?,?,?,?,?,?)");

          
           pst.setString(1,name);
           pst.setString(2,phno);
           pst.setString(3,area);
           pst.setString(4, address);
           pst.setDouble(5,amount);
           pst.setString(6,date);
           pst.setBoolean(7,paid_or_not);
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
