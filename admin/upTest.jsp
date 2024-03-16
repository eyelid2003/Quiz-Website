<%@ page import="java.sql.* " %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="all_component/allCSS.jsp" %>
    <style>
        .bg-color
        {
            background-color: #f0f2f2;
        }
        .f
        {
            margin-top: 50px;
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
                <th scope="col" >Test ID</th>
                <th scope="col">Subject Name</th>
                <th scope="col">Subject Level</th>
                <th scope="col">Test Name</th>
                <th scope="col">Mark's</th>
                <th scope="col">Action</th>
                
              </tr>
            </thead>
            <tbody>
            <%
            try
            {
              String email=(String)session.getAttribute("email");
              Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
              String query="select * from textsub";
              PreparedStatement ps=con.prepareStatement(query);
              ResultSet rs=ps.executeQuery(query);
              while(rs.next())
              {
            %>
           
              <tr>
                <th class="text-info"><%= rs.getString(1) %></th>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(5) %></td>
               
                <td>
                    <a href="../ShowTest?id=<%= rs.getString(1) %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
                </td>
               
              </tr>
            
            <%
              }
            }
            catch(Exception e)
            {

            }
            %>
          </tbody>
          </table>



    </div>
      
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        $('#button').click(function(){
        level=$("#level").val();
        subject=$("#subject").val();
        alert(level)
        alert(subject)
        $.ajax({
                url: 'showTest.jsp',
                type: 'get',
                data: {level:level,subject:subject},
                
                success: function(responsedata){
                    $('#idhai').html(responsedata);
                }
               
                
            });
        
        });
    
    </script> 
    <script>
        function p1()
        {
            a=document.getElementById("subject").value
            if(a=="select")
            {
                alert("Chose subject")
                return false
            }
            b=document.getElementById("level").value
            if(b=="select")
            {
                alert("Select subject level")
                return false
            }
            c=document.getElementById("tname").value
            if(c=="select")
            {
                alert("Select test name")
                return false
            }
        }
       </script>
</body>
</html>