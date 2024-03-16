import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class QusValue extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        HttpSession htps=req.getSession();
       
        try
        {
          
            String qid =req.getParameter("qid");
        
            htps.setAttribute("qid",qid);
           
            res.sendRedirect("quiz.jsp");
            return;
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("quiz.jsp");
            return;
            //p.print(e);
        }
        
    }
}