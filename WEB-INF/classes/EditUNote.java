import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class EditUNote extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {

        PrintWriter p=res.getWriter();
        String nid=req.getParameter("nid");
        String email =req.getParameter("email");
        String nheading =req.getParameter("nheading");
        String ndesc =req.getParameter("ndesc");
        String nstatus =req.getParameter("nstatus");
        HttpSession htps=req.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
            String query="update note set nheading='"+nheading+"',ndesc='"+ndesc+"',status='"+nstatus+"' where nid='"+nid+"' ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            
            if(i==1)
            {
                htps.setAttribute("sucess","Note Update Sucessfully :)");
                res.sendRedirect("viewunote.jsp");
                return;
            }
            else
            {
                htps.setAttribute("failed","sothing iss wrong");
                res.sendRedirect("viewunote.jsp");
                return;
            }
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("viewunote.jsp");
            return;
            //p.print(e);
        }
    }
}