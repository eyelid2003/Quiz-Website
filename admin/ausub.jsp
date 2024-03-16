<%@ page import="java.sql.* " %>
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
        .f
        {
            margin-top: 13%;
        }
    </style>
</head>
<body class="bg-color">
    <%@include file="all_component/navbar2.jsp" %>
    <div class="container p-3 mt-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <%@include file="msg.jsp" %>
                        <h4 class="text-center">Edit & Add Subject</h4><br>
                        <form action="../AddSub" method="post">
                            <div class="form-group">
                                <label for="sub">Add new Subject </label>  <button class="btn btn-outline-success" >Add</button>
                                <input type="text" class="form-control" id="sub" name="subject" placeholder="New Subject" required>
                            </div>
                        </form>
                               
                        
                        <form action="../UpdateSub" method="post">
                            <div class="form-group">
                                <label class="my-1 mr-2" for="subject">All Subject </label>
                                <select class="custom-select my-1 mr-sm-2" id="subject" name="subject">
                                    <option value="select">....select....</option>
                    <% 
                    try 
                    { 

                        Class.forName("com.mysql.jdbc.Driver"); 
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root"); String
                        query="select * from subject " ;
                     
                        PreparedStatement ps=con.prepareStatement(query);
                       
                        ResultSet rs=ps.executeQuery(query); 
                        while(rs.next()) 
                        {
                    %>
                                    
                                    <option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
                    <% } } catch(Exception e) { } %>
                                </select>
                            </div>
                        
              
                            <div class="form-group">
                                <label class="my-1 mr-2" for="status">Subject Status</label>
                                <select class="custom-select my-1 mr-sm-2" id="status" name="status">
                                    <option value="select">........select.......</option>
                                    <option value="active">Active</option>
                                    <option value="inactive">Inactive</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg" onclick="return p1()">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="f">
        <%@include file="all_component/footer.jsp" %>
    </div>
    
    <script>
        function p1()
        {
            a=document.getElementById("subject").value
            if(a=="select")
            {
                alert("Chose subject")
                return false
            }
            b=document.getElementById("status").value
            if(b=="select")
            {
                alert("Select subject status")
                return false
            }
        }
       </script>
</body>
</html>