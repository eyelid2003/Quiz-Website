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
    .f
    {
        margin-top: 12%;
    }
    </style>
</head>
<body class="bg-color">
    <%@include file="all_component/navbar2.jsp" %>
    <div class="container p-3">
        <div class="row">
            <%
                String email=(String)session.getAttribute("email");
                String contact=(String)session.getAttribute("contact");
                String name=(String)session.getAttribute("username");
            %>
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <%@include file="msg.jsp" %>
                    <div class="card-body">
                        <h3 class="text-center">Update Your Account Info.</h3>
                        <form action="EditPF" method="post">
                            <div class="form-group">
                               <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" value="<%= name %>"  readonly>
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="contact">Phone number</label>
                                <input type="text" class="form-control" id="contact" name="contact" value="<%= contact %>" readonly>
                            </div>


                            <div class="form-group">    
                                <label class="form-label" for="email">Email</label>
                                <input type="text" class="form-control" id="email" name="email" value="<%= email %>" required>
                            </div>

                           <div class="form-group">
                                <label class="form-label" for="pass">Password</label>
                                <input type="password" class="form-control" id="pass" name="pass" required>
                            </div> 
                            
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-success">Submit</button>
            
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
    
</body>
</html>