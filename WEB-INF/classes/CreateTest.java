import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class CreateTest extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        
        PrintWriter out=res.getWriter();
     
        
        HttpSession htps=req.getSession();
        try
        {
                String tid=req.getParameter("tid");
                String qid="";
                String check[]=req.getParameterValues("check");
                int i=0;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");

                String query="insert into exam (tid,qid) values (?,?) ";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setString(1,tid);
                for(int j=0;j<check.length;j++)
                {
                    qid=check[j];
                    ps.setString(2,qid);
                    i= ps.executeUpdate();
                    out.println(qid);
                }
                
              
                
            if(i==1)
            {
                    htps.setAttribute("sucess","New text Created");
                    res.sendRedirect("admin/addtest.jsp");
                    return;
                
            }
            else
            {
                    htps.setAttribute("failed","something iss wrong");
                    res.sendRedirect("admin/addtest.jsp");
                    return;
                
            }
        
            

        }
        catch(Exception e)
        {

            //htps.setAttribute("error","sothing is wrong");
            //res.sendRedirect("admin/addtest.jsp");
            //return;
           out.print(e);
        }
    }
}
