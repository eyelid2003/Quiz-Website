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
            margin-top: 5%;
        }
    </style>
</head>
<body class="bg-color">
    <%@include file="all_component/navbar2.jsp" %>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <%@include file="msg.jsp" %>
                        <% 
                            
                            String email=(String)session.getAttribute("email");
                        %>
                        <h4 class="text-center">Upaate Notes</h4>
                        <p class="text-center">Note ID is:<b><%= request.getParameter("id") %></b></p>
                        <form action="EditUNote" method="post" >
                            <% 
                            try
                            {
                                String nid=request.getParameter("id");
                                Class.forName("com.mysql.jdbc.Driver"); 
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root"); 
                                String sql="select * from note where nid='"+nid+"'" ;
                                PreparedStatement ps=con.prepareStatement(sql);
                                ResultSet rs=ps.executeQuery(sql);
                                rs.next();
                                
                            
                            %>
                            <input name="nid" type="hidden" value="<%= request.getParameter("id") %>">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" id="email" name="email" value="<%= email %>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="nheading">Note Heading</label>
                                <input type="text" class="form-control" id="nheading" name="nheading" value="<%= rs.getString(2)%>" placeholder="Note Heading" required>
                            </div>
            
                            <div class="form-group">
                                <label for="ndesc">Note Description</label>
                                <textarea rows="3" placeholder="Description of Note" class="form-control form-lg fs-6 shadow-sm" name="ndesc" value="<%= rs.getString(3)%>" id="ndesc" required></textarea>
                            </div>
                        

                            <div class="form-group">
                                <label class="my-1 mr-2" for="nstatus">Note Status</label>
                                <select class="custom-select my-1 mr-sm-2" id="nstatus" name="nstatus">
                                    <option value="select">....select....</option>
                                    <option value="public">Public</option>
                                    <option value="private">Private</option>
                                </select>
                            </div>

    
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg" onclick="return p1()">Add Note</button>
                            </div>
                            <%
                            
                                }
                                catch(Exception ex){}
                            %>
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
            a=document.getElementById("nstatus").value
            if(a=="select")
            {
                alert("select status ")
                return false
            }
        }
    </script>
</body>
</html>