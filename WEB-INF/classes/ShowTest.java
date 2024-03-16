import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class ShowTest extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doGet(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        HttpSession htps=req.getSession();
        PrintWriter out=res.getWriter();
        try
        {
                String tid=req.getParameter("id");         
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");

                String query="delete from textsub where testid='"+tid+"' ";
                PreparedStatement ps=con.prepareStatement(query);
                int i=ps.executeUpdate();

                String query1="delete from exam where tid='"+tid+"' ";
                ps=con.prepareStatement(query1);
                int i1=ps.executeUpdate();
                if(i!=0 && i1!=0)
                {
                    htps.setAttribute("error","Test Deleted");
                    res.sendRedirect("admin/upTest.jsp");
                    return;
                }
                else
                {
                    htps.setAttribute("error","Something 1 is Wrong");
                    res.sendRedirect("admin/upTest.jsp");
                    return;
                }
            
        }
        catch(Exception e)
        {
            //htps.setAttribute("error","sothing is wrong");
            //res.sendRedirect("upTest.jsp");
            //return;
            out.print(e);
        }
        
    }
}