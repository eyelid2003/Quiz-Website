<%@ page import="java.sql.* " %>
    <%@ page import="java.util.* " %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <%@include file="all_component/allCSS.jsp" %>
                <style>
                    .f {
                        margin-top: 6%;
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
                                    <h4 class="text-center">Fill Some info Required for View Result</h4><br><br>
                                    <form action="viewresult2.jsp" method="post">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="name">Student Name</label>
                                                <input type="text" class="form-control" id="name" value="<%= username %>" name="name" readonly>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="form-label" for="contact">Contact</label>
                                                <input type="text" class="form-control" id="contact" value="<%= contact %>" name="contact" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="my-1 mr-2" for="subject">Chose Subject </label>
                                            <select class="custom-select my-1 mr-sm-2" id="subject" name="subject">
                                                <option value="select">....select....</option>
                                                    <% 
                                                        try 
                                                        { 
                                                            Class.forName("com.mysql.jdbc.Driver"); 
                                                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz","root","root");
                                                            String query="select * from subject  where status='active'"; 
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
                                            <label class="my-1 mr-2" for="level">Subject Level</label>
                                            <select class="custom-select my-1 mr-sm-2" id="level" name="level">
                                                <option value="select">....select....</option>
                                                <option value="easy">easy</option>
                                                <option value="normal">normal</option>
                                                <option value="high">high</option>
                                                <option value="mix">mix</option>
                                            </select>
                                        </div>
                                                    <% 
                                                        int c=(int)(Math.random()*10); 
                                                        int c2=(int)(Math.random()*10); int
                                                        c3=c+c2;
                                                    %>
                                        <input type="hidden" value="<%= c3 %>" name="rc" id="c1">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <h5>Captcha : <%= c %> + <%= c2 %> =></h5>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <input type="text" class="form-control" id="c2" name="c" placeholder="Fill Captcha" required>
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary btn-lg" onclick="return p1()">View Result</button>
                                            </div>
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
                    function p1() {
                        a = document.getElementById("c1").value
                        b = document.getElementById("c2").value
                        if (a != b) {
                            alert("fill wiright captcha")
                            return false;
                        }

                        c = document.getElementById("subject").value
                        if (c == "select") {
                            alert("Chose subject")
                            return false
                        }
                        d = document.getElementById("level").value
                        if (d == "select") {
                            alert("Select subject level")
                            return false
                        }
                    }
                </script>
        </body>

        </html>