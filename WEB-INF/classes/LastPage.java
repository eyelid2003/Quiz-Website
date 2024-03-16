import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
public class LastPage extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doGet(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        
        PrintWriter out=res.getWriter();

        HttpSession htps=req.getSession();
        Date thisDate= new Date();
        SimpleDateFormat dateForm= new SimpleDateFormat("MM/dd/Y h:mm");
        String timee=dateForm.format(thisDate);
        String name=(String)htps.getAttribute("username");
        String contact=(String)htps.getAttribute("contact");
    
        String result=(String)htps.getAttribute("result");
        String subject=(String)htps.getAttribute("subject");
        String level=(String)htps.getAttribute("level");
        String tname=(String)htps.getAttribute("tname");
        String mark=(String)htps.getAttribute("mark");
        //RequestDispatcher dis=null;
        ;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
            String query=" insert into result (contact,name,sub,result,level,tname,mark,timee) values ('"+contact+"','"+name+"','"+subject+"','"+result+"','"+level+"','"+tname+"','"+mark+"','"+timee+"') ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            if(i==1)
            {
                res.sendRedirect("result.jsp");
                return;
            }
            else
            {
                htps.setAttribute("failed","something iss wrong");
                res.sendRedirect("quiz.jsp");
                return;
                
            }
        
        }

        
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("quiz.jsp");
            return;
        }
    }
}
