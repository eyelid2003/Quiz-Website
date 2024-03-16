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
        <table class="table table-striped bg-light">
            <thead class="bg-dark text-white">
              <tr>
                <th scope="col" >ID</th>
                <th scope="col" >Subject</th>
                <th scope="col">Level</th>
                <th scope="col">Question</th>
                <th scope="col">Action</th>

              </tr>
            </thead>
            <tbody>
            <%
            try
            {
                String subject=(String)session.getAttribute("subject");
                String level=(String)session.getAttribute("level");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
                String query="select * from question where subject='"+subject+"' and level='"+level+"' ";
                PreparedStatement ps=con.prepareStatement(query);
                ResultSet rs=ps.executeQuery(query);
                while(rs.next())
                {
            %>
           
              <tr>
                <th class="text-info"><%= rs.getString(1) %></th>
                <td><%= subject %></td>
                <td><%= level %></td>
                <td><%= rs.getString(4) %></td>
                <td>
                    <a href="editqus.jsp?id=<%= rs.getString(1) %>" class="btn btn-sm btn-success"><i class="fa-solid fa-pen"></i> Edit</a>
                  <!--   <a href="../DeleteQus?id=<%= rs.getString(1) %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>  -->
                </td>
              </tr>
            
            <%
                }
            }
            catch(Exception e){ }
            %>
          </tbody>
          </table>
          <a href="../Exit" class="btn btn-primary btn-lg">Exit</a>
    </div>
  
</body>
</html>