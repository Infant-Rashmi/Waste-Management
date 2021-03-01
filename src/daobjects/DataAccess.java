package daobjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DataAccess
{
    private static ArrayList products;

    public static  ArrayList getProductName()
    {
         products=new ArrayList();
        products.clear();
         try
         {
           Connection con=DBConnect.getCon();
           PreparedStatement pst=con.prepareStatement("select productname from product");

           ResultSet rst=pst.executeQuery();

           while(rst.next())
           {
               products.add(rst.getString("productname"));
           }
         }
         catch(Exception ex)
         {
             System.out.println(ex);
         }
        return products;
    }

    /**
     * @return the con
     */
}
