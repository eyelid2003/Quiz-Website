<%@  page import="java.sql.* "%>
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
            margin-top: 4%;
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
                        try
                        {
                            String qid=request.getParameter("id");
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
                            String query="select * from question where qid='"+qid+"' ";
                            PreparedStatement ps=con.prepareStatement(query);
                            ResultSet rs=ps.executeQuery(query);
                            while(rs.next())
                            {
                        %>
                        <h4 class="text-center">Update Question's</h4>
                        <form action="../EditQus" method="post">
                            <input name="qid" type="hidden" value="<%= request.getParameter("id") %>">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="subject">Subject Name</label>
                                    <input type="text" class="form-control" id="subject" value="<%= rs.getString(2) %>" name="subject" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="level">Subject Level</label>
                                    <input type="text" class="form-control" id="level" value="<%= rs.getString(3) %>" name="level" readonly >
                                </div>
                            </div>
                        
                            <div class="form-group">
                              <label for="qus">Question</label>
                              <input type="text" class="form-control" name="qus" id="qus" value="<%= rs.getString(4) %>" placeholder="Question" required>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="first">1st Option</label>
                                    <input type="text" class="form-control" id="first" value="<%= rs.getString(5) %>" name="first" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="second">2nd Option</label>
                                    <input type="text" class="form-control" id="second" value="<%= rs.getString(6) %>" name="second" required >
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="third">3rd Option</label>
                                    <input type="text" class="form-control" id="third" value="<%= rs.getString(7) %>" name="third" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="forth">4th Option</label>
                                    <input type="text" class="form-control" id="forth" value="<%= rs.getString(8) %>" name="forth"  required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="rightt">Right Option</label>
                              <input type="text" class="form-control" name="rightt" value="<%= rs.getString(9) %>" id="rightt" required >
                            </div>


                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg" onclick="return p1()">Update</button>
                            </div>
                        </form>
                    </div>
                    <% } 
                    
                } catch(Exception e) { } %>
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

            
            b = document.getElementById("first").value
            
            c= document.getElementById("second").value
           
            x = document.getElementById("third").value
            
            y= document.getElementById("forth").value
            
            d= document.getElementById("rightt").value
            
            if(d !=b && d !=c && d !=x && d !=y){
                alert("Enter right option")
                return false
            }
        }
    </script>
</body>
</html>