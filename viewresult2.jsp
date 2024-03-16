<%@  page import="java.sql.* "%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="/all_component/allCSS.jsp" %>
    <style>
        .plk
        {
          width: 50px;
          height: 50px;
        }
    </style>
</head>
<body class="bg-color">
    <%@include file="all_component/navbar2.jsp" %>
    <div class="container p-3">
        <table class="table table-striped bg-light">
            <thead class="bg-dark text-white">
              <tr>
                <th scope="col" >Name</th>
                <th scope="col">Contact</th>
                <th scope="col">Subject Name</th>
                <th scope="col">Test Name Name</th>
                <th scope="col">Level</th>
                <th scope="col">Your Mark</th>
                <th scope="col">Total Mark</th>
                <th scope="col">Time</th>
              </tr>
            </thead>
            <tbody>
            <%
            try
            {
                String name =request.getParameter("name");
                String contact =request.getParameter("contact");
                String subject =request.getParameter("subject");
                String level =request.getParameter("level");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
                String query="select * from result where contact='"+contact+"' and sub='"+subject+"' and level='"+level+"' ORDER BY result desc";
                PreparedStatement ps=con.prepareStatement(query);
                ResultSet rs=ps.executeQuery(query);
                while(rs.next())
                {
            %>
           
              <tr>
                <th class="text-info"><%= name %></th>
                <td><%= contact %></td>
                <td><%= subject %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= level %></td>
                <td><%= rs.getString(5) %></td>
                
                <td><%= rs.getString(8) %></td>
                <td><%= rs.getString(9) %></td>
              </tr>
            
            <%
                }
            }
            catch(Exception e){ }
            %>
          </tbody>
          </table>
    </div>
  
</body>
</html>