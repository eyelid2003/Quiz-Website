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
        .bg-color
        {
            background-color: #f0f2f2;
        }
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
        <%@include file="msg.jsp" %>
        <form action="../CreateTest" method="post">
        <table class="table table-striped bg-light">
            <thead class="bg-dark text-white">
              <tr>
                <th scope="col" >ID</th>
                <th scope="col" >Subject</th>
                <th scope="col">Level</th>
                <th scope="col">Question</th>
                <th scope="col">Select</th>

              </tr>
            </thead>
            <tbody>
            <%
            try
            {
              String subject=(String)session.getAttribute("subject");
              String level=(String)session.getAttribute("level");
              String tname=request.getParameter("tname");
              
                
                %>
                <input type="hidden" value="<%= tname %>" name="tid">
            <p align="center">Test ID is:<%= tname %></p> 
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
                String query1;
                if(level.contains("mix"))
                {
                  query1="select * from question where subject='"+subject+"' ";
                }
                else
                {
                  query1="select * from question where subject='"+subject+"' and level='"+level+"' ";
                }
               
                PreparedStatement ps=con.prepareStatement(query1);
                ResultSet rs=ps.executeQuery(query1);
                while(rs.next())
                {
            %>
            
              <tr>
                <th class="text-info"><%= rs.getString(1) %></th>
                <td><%= subject %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td>
                  <div class="form-check">
                    <input type="checkbox" name="check" id="check" class="form-check-input" value="<%= rs.getString(1) %>">
                </div>
                </td>
              </tr>
            
            <%
                }
            }
            catch(Exception e){ }
            %>
          </tbody>
          </table>
          <button type="submit" class="btn btn-primary btn-lg" onclick="return p1()">Create Test</button>
          <form>
    </div>
  
</body>
</html>