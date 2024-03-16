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
            background-image: url("../images/bg1.jpeg");
            background-repeat: no-repeat;
            height: 100%;
            background-attachment: fixed;
           background-position: center;
           background-size: cover;
        }

    </style>
</head>
<body class="bg-color">
        <section class="d-flex flex-column m-4 justify-content-center align-item-center">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto rounded-5 shadow bg-white">
                    <div class="contect-form">
                        <div class="row"> 
                         
                            <div class="col-md-12 text-center m-3">
                                <form action="../QusValueForShow" method="post">
                                    <% 
                                        try 
                                        { 
                                            String tid=(String) session.getAttribute("tid");
                                            Class.forName("com.mysql.jdbc.Driver"); 
                                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root"); 
                                            
                                            String query1="select * from exam where tid='"+tid+"' ";
                                            PreparedStatement ps=con.prepareStatement(query1);
                                            ResultSet rs=ps.executeQuery(query1);
                                            int i=0;
                                            while(rs.next()) 
                                            {
                                               i=i+1; 
                                    %>
                                    <button class="btn btn-outline-success m-2"  name="qid" value="<%= rs.getString(2) %>"><%= i %></button>
                                    <% 
                                            }
                                        } 
                                        catch(Exception e) { } 
                                    %>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8 offset-md-2 ">
                                <div class="card m-2 border-0">
                                    <div class="card-body" id="dynamicqus">
                                      
                                            <%
                                                String qid=(String)session.getAttribute("qid");
                                                if(qid != null)
                                                {
                                                    try
                                                    {
                                                        Class.forName("com.mysql.jdbc.Driver"); 
                                                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root"); 
                                                        String sql="select * from question where qid='"+qid+"'" ;
                                                        PreparedStatement ps=con.prepareStatement(sql);
                                                        ResultSet rs=ps.executeQuery(sql); 
                                                        while(rs.next()) 
                                                        {
                                                           
                                            %>
                                                        <input type="hidden" value="<%= rs.getString(9) %>" name="rightt">
                                                        <input type="hidden" value="<%= qid %>" name="qid">
                                                        <h2>Qus) <%= rs.getString(4) %></h2><br>
                                                        1) <input type="radio" value="<%= rs.getString(5) %>" name="ans" id="first"> <%= rs.getString(5) %><br><br>
                                                        2) <input type="radio" value="<%= rs.getString(6) %>" name="ans" id="second"> <%= rs.getString(6) %><br><br>
                                                        3) <input type="radio" value="<%= rs.getString(7) %>" name="ans" id="third"> <%= rs.getString(7) %><br><br>
                                                        4) <input type="radio" value="<%= rs.getString(8) %>" name="ans" id="forth"> <%= rs.getString(8) %><br><br>
                                            <% 
                                                        } 
                                                    }           
                                                    catch(Exception e) { } 
                                                }
                                                session.removeAttribute("qid");
                                            %>
                                    </div>
                                    <a href="setting.jsp" class="btn btn-outline-info">Back</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
 
</body>
</html>