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
            background-image: url("images/bg1.jpeg");
            background-repeat: no-repeat;
            height: 100%;
            background-attachment: fixed;
           background-position: center;
           background-size: cover;
        }
    .f
        {
            margin-top: 33%;
        }
    </style>
    
</head>
<body class="bg-color">
   
    <% 
        String name=(String)session.getAttribute("username");
        String contact=(String)session.getAttribute("contact");
    
       String result=(String)session.getAttribute("result");
        String subject=(String)session.getAttribute("subject");
        String mark=(String)session.getAttribute("mark");
    %>
    <div class="container text-center mt-5">
        <i class="fa-solid fa-heart fa-5x text-danger"></i>
        <h1>Thank You <%= name %></h1>
        
        <h2 class="text-success">"Keep try for improve Your self" </h2>
            <h2> Your marks out of <%= result %> / <%= mark %> </h2>

        <a class="btn btn-warning mt-3" href="GoHome">Exit Game & Go to Home Page</a>
     
    </div>
    
    <div class="f">
        <%@include file="all_component/footer.jsp" %>
    </div>
    
</body>
</html>