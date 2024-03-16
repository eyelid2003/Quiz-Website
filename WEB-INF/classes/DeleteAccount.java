import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class DeleteAccount extends HttpServlet
{
    
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        HttpSession htps=req.getSession();
        String email =req.getParameter("email");
        String pass =req.getParameter("pass");
        try
        {
            
           
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
            String query="select * from account where pass='"+pass+"' and email='"+email+"'";
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery(query);
            
            if(rs.next())
            {
                String sql=" delete from account where email='"+email+"' ";
                ps=con.prepareStatement(sql);
                int i=ps.executeUpdate();
                if(i==1)
                {
                    htps.removeAttribute("username");
                    htps.removeAttribute("email");
                    htps.setAttribute("sucess","account deleted Sucessfully :)");
                    res.sendRedirect("deleteaccount.jsp");
                    return;
                }
                else
                {
                    htps.setAttribute("failed","sothing iss wrong");
                    res.sendRedirect("deleteaccount.jsp");
                    return;
                }
            }
            
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("deleteaccount.jsp");
            return;
            //p.print(e);
        }
    }
}

