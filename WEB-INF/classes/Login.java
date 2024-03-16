import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class Login extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        PrintWriter p=res.getWriter();
        String name =req.getParameter("name");
        String pass =req.getParameter("pass");
        String email =req.getParameter("email");
        RequestDispatcher dis=null;
        HttpSession htps=req.getSession();
        try
        {
            Conn con=new Conn();
            String query="select * from account where pass='"+pass+"' and email='"+email+"'";
            ResultSet rs=con.ps.executeQuery(query);
            
            if(rs.next())
            {
                htps.setAttribute("username",name);
                htps.setAttribute("email",email);
                String contact=rs.getString(4);
                htps.setAttribute("contact",contact);
                res.sendRedirect("setting.jsp");
                return;
            }
            else
            {
                htps.setAttribute("failed","sothing iss wrong");
                res.sendRedirect("index.jsp");
                return;
            }
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("index.jsp");
            return;
        }
    }
}