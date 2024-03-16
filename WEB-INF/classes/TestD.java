import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class TestD extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        
        PrintWriter out=res.getWriter();
     
        
        HttpSession htps=req.getSession();
        try
        {
                String mark=req.getParameter("mark");
                String tname=req.getParameter("tname");
              
                String subject=req.getParameter("subject");
                String level=req.getParameter("level");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");

                String query="insert into textsub (tname,sub,level,tmark) values ('"+tname+"','"+subject+"','"+level+"','"+mark+"') ";
                PreparedStatement ps=con.prepareStatement(query);
                int i=ps.executeUpdate();
                
            if(i==1)
            {
                    htps.setAttribute("sucess","New text Created");
                    res.sendRedirect("admin/text.jsp");
                    return;
                
            }
            else
            {
                    htps.setAttribute("failed","something iss wrong");
                    res.sendRedirect("admin/text.jsp");
                    return;
                
            }
        
            

        }
        catch(Exception e)
        {

            //htps.setAttribute("error","sothing is wrong");
            //res.sendRedirect("admin/text.jsp");
            //return;
            out.print(e);
        }
    }
}
