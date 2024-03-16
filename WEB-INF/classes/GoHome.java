import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class GoHome extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doGet(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        HttpSession htps=req.getSession();
        try
        {
            htps.removeAttribute("subject");
            htps.removeAttribute("level");
            htps.removeAttribute("qid");
            htps.removeAttribute("result");
            htps.removeAttribute("tname");
            htps.removeAttribute("tid");
           
            htps.removeAttribute("mark");
            res.sendRedirect("setting.jsp");
            return;
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("result.jsp");
            return;
            //p.print(e);
        }
    }
}