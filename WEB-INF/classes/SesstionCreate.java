import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class SesstionCreate extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        HttpSession htps=req.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
            String tid=req.getParameter("tname");
            htps.setAttribute("tid",tid);

            String query="select * from textsub where testid='"+tid+"' ";
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery(query);
            while(rs.next())
            {
                htps.setAttribute("mark",rs.getString(5));
                htps.setAttribute("tname",rs.getString(2));
            }   res.sendRedirect("quiz.jsp");
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