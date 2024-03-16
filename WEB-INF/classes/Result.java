import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class Result extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        
        PrintWriter p=res.getWriter();
        HttpSession htps=req.getSession();
        int r=0;
        String ans =req.getParameter("ans");
        String rightt =req.getParameter("rightt");
        boolean a=ans.equals(rightt);
        if(a==true)
        {
            String resul=(String)htps.getAttribute("result");
            if(resul != null)
            {
                int ar=Integer.parseInt(resul);
                r=ar+1;
            }
            else
            {
                r=r+1;
            }
        }
        String result=Integer.toString(r);
        htps.setAttribute("result",result);
        htps.setAttribute("sucess","Answer Submited");
        res.sendRedirect("quiz.jsp");
        return;
          
    }
}
