<%@  page import="java.sql.* "%>
<%
public class Conn
{
Conn()
{
    Connection con;
	Statement s;
	
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
	        
		}
		catch(Exception ex)
		{
			
		}
}
}
	
		
	
%>