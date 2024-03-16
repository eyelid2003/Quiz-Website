import java.sql.*;
public class Conn {
	Connection c;
	Statement ps;
	Conn()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
	        c=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
	        ps=c.createStatement();
		}
		catch(Exception ex)
		{
			
		}
		
	}
}