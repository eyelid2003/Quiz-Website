import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class AddSession extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        HttpSession htps=req.getSession();
        try
        {
            String subject =req.getParameter("subject");
            String level =req.getParameter("level");
            
            htps.setAttribute("subject",subject);
            htps.setAttribute("level",level);
            res.sendRedirect("admin/addqus2.jsp");
            return;
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("admin/addqus2.jsp");
            return;
            //p.print(e);
        }
        
    }
}