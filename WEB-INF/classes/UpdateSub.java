import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class UpdateSub extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {

        PrintWriter p=res.getWriter();
        String subject=req.getParameter("subject");
      
        
        String status =req.getParameter("status");
     
        HttpSession htps=req.getSession();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
            String query="update subject set status='"+status+"' where subject='"+subject+"' ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            
            if(i==1)
            {
                htps.setAttribute("sucess","Updated Sucessfully :)");
                res.sendRedirect("admin/ausub.jsp");
                return;
            }
            else
            {
                htps.setAttribute("failed","sothing iss wrong");
                res.sendRedirect("admin/ausub.jsp");
                return;

            }
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("admin/ausub.jsp");
            return;
            //p.print(e);
        }

        
    }
}