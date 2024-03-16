<%@ page import="java.sql.*"%>
<%
String subject=request.getParameter("subject");
String level=request.getParameter("level");
session.setAttribute("subject",subject);
session.setAttribute("level",level);
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
    String query="select * from textsub where sub='"+subject+"' and level='"+level+"' ";
    PreparedStatement ps=con.prepareStatement(query);
    ResultSet rs=ps.executeQuery(query);
    %>
        <select class="custom-select my-1 mr-sm-2" id="tid" name="tname">
            <option value="select">----select----</option>
    <%
    while(rs.next())
    {
        String tid=rs.getString(1);
        %>
        
			<option value="<%= rs.getString(1)%>"><%= rs.getString(2)%></option>
		
        
        <%
    } 
    %>
    </select>
    <%
}
catch(Exception e)
{
    out.print(e);
}

%>
