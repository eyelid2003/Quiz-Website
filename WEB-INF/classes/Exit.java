import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class Exit extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doGet(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        HttpSession htps=req.getSession();
        try
        {
            htps.removeAttribute("subject");
            htps.removeAttribute("level");
           
            res.sendRedirect("admin/setting.jsp");
            return;
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("admin/setting.jsp");
            return;
            //p.print(e);
        }
    }
}