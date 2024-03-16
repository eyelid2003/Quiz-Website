import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class AddSub extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        
        PrintWriter out=res.getWriter();
        String subject =req.getParameter("subject");
        
        HttpSession htps=req.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
            String query=" insert into subject (subject,status) values ('"+subject+"','active') ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            if(i==1)
            {
                    htps.setAttribute("sucess","New subject Added");
                    res.sendRedirect("admin/ausub.jsp");
                    return;
                
            }
            else
            {
                    htps.setAttribute("failed","something iss wrong");
                    res.sendRedirect("admin/ausub.jsp");
                    return;
                
            }
        
            

        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("admin/ausub.jsp");
            return;
        }
    }
}
