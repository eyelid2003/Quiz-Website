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
			.back-img 
			{
                background: url("images/bg.jpeg");
                height: 50vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
			.plk
			{
                width: 170px;
                height: 170px;
			}
			.crd-ho:hover 
			{
                background-color: #fcf7f7;
            }
        </style>
    </head>
	<body class="bg-color">
        <%@include file="all_component/navbar2.jsp" %>
        <hr>
        <div class="container p-2">
            <%@include file="msg.jsp" %>
            <h3 class="text-center">Your Note</h3>
            <div class="row">
                <% 
                    try 
                    { 
                        Class.forName("com.mysql.jdbc.Driver"); 
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root"); 
                        String query="select * from note where email='Admin' " ; 
                        PreparedStatement ps=con.prepareStatement(query); 
                        ResultSet rs=ps.executeQuery(query); 
                        while(rs.next()) 
                        {
                %>
                <div class="col-md-3 p-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <p>Note Heading:<b><%= rs.getString(2) %></b></p>
                            <p>Status: "<%= rs.getString(6) %>"</p>
                            <img alt="" src="../images/<%= rs.getString(4) %>" class="img-thumbnail plk">
                            
                            <p>"<%= rs.getString(3) %>"</p>
                            <p>Written By:<b><%= rs.getString(5) %> </b></p>
                            <div class="row ">
                                <div class="col-12">
                                    <a href="../DeleteNote?id=<%= rs.getString(1) %>" class="btn btn-danger btn-sm "><i class="fa-solid fa-trash"></i> Delete </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% 
                        }
                        
                    } 
                    catch(Exception e) 
                    { 
                    } 
                %>
            </div>
        </div>
    </hr>
    


    <hr>
    <div class="container p-2">
        <h3 class="text-center">Public Note's</h3>
        <div class="row">
            <% 
                try 
                { 
                    Class.forName("com.mysql.jdbc.Driver"); 
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root"); 
                    String query="select * from note where status='public' " ; 
                    PreparedStatement ps=con.prepareStatement(query); 
                    ResultSet rs=ps.executeQuery(query); 
                    while(rs.next()) 
                    {
            %>
            <div class="col-md-3 p-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <p>Note Heading:<b><%= rs.getString(2) %></b></p>
                        <img alt="" src="../images/<%= rs.getString(4) %>" class="img-thumbnail plk">
                        
                        <p>"<%= rs.getString(3) %>"</p>
                        <p>Written By:<b><%= rs.getString(5) %> </b></p>
                    </div>
                </div>
            </div>
            <% 
                    }
                    
                } 
                catch(Exception e) 
                { 
                } 
            %>
        </div>
    </div>
</hr>



    

    <%@include file="all_component/footer.jsp" %>
    </body>
</html>