import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import javax.servlet.annotation.*;
import javax.servlet.http.Part;
@MultipartConfig
public class AddUNote extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        res.setContentType("text/html");
        PrintWriter p=res.getWriter();
        String email =req.getParameter("email");
        String nheading =req.getParameter("nheading");
        String ndesc =req.getParameter("ndesc");
        String nstatus =req.getParameter("nstatus");
        Part photo=req.getPart("photo");
        String pname=photo.getSubmittedFileName();
        String path=getServletContext().getRealPath("") +"images";
        File f=new File(path);
        photo.write(path+File.separator+pname);
        HttpSession htps=req.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
            String query=" insert into note (nheading,ndesc,nimg,email,status) values ('"+nheading+"','"+ndesc+"','"+pname+"','"+email+"','"+nstatus+"') ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            
            if(i==1)
            {
                htps.setAttribute("sucess","New Note Added Sucessfully :)");
                res.sendRedirect("addunote.jsp");
                return;
            }
            else
            {
                htps.setAttribute("failed","sothing iss wrong");
                res.sendRedirect("addunote.jsp");
                return;
            }
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("addunote.jsp");
            return;
            //p.print(e);
        }
    }
}