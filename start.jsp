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
            margin-top: 10%;
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
                            
                            String username=(String)session.getAttribute("username");
                            String contact=(String) session.getAttribute("contact");
                        %>
                        <h4 class="text-center">Fill Some info Required for start Quiz</h4><br><br>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="name">Student Name</label>
                                    <input type="text" class="form-control" id="name" value="<%= username %>" name="name" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="contact">Contact</label>
                                    <input type="text" class="form-control" id="contact" value="<%= contact %>" name="contact" readonly >
                                </div>
                            </div>
                        
                            <div class="form-group">
                                <label class="my-1 mr-2" for="subject">All Subject </label>
                                <select class="custom-select my-1 mr-sm-2" id="subject" name="subject">
                                    <option value="select">....select....</option>
                    <% 
                    try 
                    { 

                        Class.forName("com.mysql.jdbc.Driver"); 
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root"); String
                        query="select * from subject  where status='active'";
                     
                        PreparedStatement ps=con.prepareStatement(query);
                       
                        ResultSet rs=ps.executeQuery(query); 
                        while(rs.next()) 
                        {
                    %>
                                    
                                    <option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
                    <% } 
                    
                } catch(Exception e) { } %>
                                </select>
                            </div>
                        
              
                            <div class="form-row">
                                <div class="form-group col-md-6" >
                                    <label class="my-1 mr-2" for="level">Subject Level</label>
                                    <select class="custom-select my-1 mr-sm-2" id="level" name="level">
                                        <option value="select">....select....</option>
                                        <option value="easy">easy</option>
                                        <option value="normal">normal</option>
                                        <option value="high">high</option>
                                        <option value="mix">mix</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <br><button type="submit"  class="btn btn-primary " name="button" id="loadButton" >show test</button>
                                </div>
                                
                            </div>
                            
                        <form action="SesstionCreate" method="post">
                            <div id="output">
                            </div>
                            
                            <div class="form-group">
                                <br><button type="submit" class="btn btn-primary btn-lg" onclick="return p2()">Start Now</button>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			
			$("#loadButton").click(function() {
				subject=$("#subject").val();
				level=$("#level").val();
                if(subject=="select")
                {
                    alert("Chose subject")
                    return false
                }
                if(level=="select")
                {
                    alert("Select subject level")
                    return false
                }

				$.ajax({
					url: "data.jsp",
					data: {subject:subject,level:level},
					success: function(result) {
						$("#output").html(result);
					}
				});
			});
		});
	</script>
    <script>
        
        function p2()
        {
            c=document.getElementById("tid").value
            if(c=="select")
            {
                alert("Select test name")
                return false
            }
        }
       </script>
</body>
</html>