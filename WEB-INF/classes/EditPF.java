import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class EditPF extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {

        PrintWriter p=res.getWriter();
        String email=req.getParameter("email");
        String pass =req.getParameter("pass");
        String contact =req.getParameter("contact");
        HttpSession htps=req.getSession();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
            String query="update account set pass='"+pass+"',email='"+email+"' where contact='"+contact+"' ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            
            if(i==1)
            {
                htps.setAttribute("sucess","Profile Update Sucessfully :)");
                res.sendRedirect("editpf.jsp");
                return;
            }
            else
            {
                htps.setAttribute("failed","sothing iss wrong");
                res.sendRedirect("editpf.jsp");
                return;
            }
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("editpf.jsp");
            return;
            //p.print(e);
        }

        
    }
}