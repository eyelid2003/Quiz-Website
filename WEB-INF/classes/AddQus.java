import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class AddQus extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {

        PrintWriter p=res.getWriter();
        String subject =req.getParameter("subject");
        String level =req.getParameter("level");
        String qus =req.getParameter("qus");
        String first =req.getParameter("first");
        String second =req.getParameter("second");
        String third =req.getParameter("third");
        String forth =req.getParameter("forth");
        String rightt =req.getParameter("rightt");
       
       
        HttpSession htps=req.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
            String query=" insert into question (subject,level,qus,first,second,third,forth,rightt) values ('"+subject+"','"+level+"','"+qus+"','"+first+"','"+second+"','"+third+"','"+forth+"','"+rightt+"') ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            
            if(i==1)
            {
                htps.setAttribute("sucess","New Quesiton Added Sucessfully :)");
                res.sendRedirect("admin/addqus2.jsp");
                return;
            }
            else
            {
                //htps.setAttribute("failed","sothing iss wrong");
                //res.sendRedirect("admin/addqus2.jsp");
                //return;
            }
        }
        catch(Exception e)
        {
            //htps.setAttribute("error","sothing is wrong");
            //res.sendRedirect("admin/addqus2.jsp");
            //return;
            p.print(e);
        }
    }
}