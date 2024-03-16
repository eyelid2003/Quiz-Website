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
        a
        {
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
        .f
        {
            margin-top: 16%;
        }
     </style>
</head >
<body class="bg-color">
    <%@include file="all_component/navbar2.jsp" %>
   
        <%
        String name=(String)session.getAttribute("username");
        %>
    <div class="container mt-5">

            <div class="row p-3">
                <div class="col-md-4 p-2">
                    <a href="rule.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-brands fa-quinscape fa-3x text-primary"></i>
                                
                                <h4>Start Quiz</h4>
                                ...............
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 p-2">
                    <a href="viewresult.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-registered fa-3x text-warning"></i>
                
                            <h4>View Result</h4>
                            ...............
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 p-2">
                    <a href="editpf.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-id-card-clip fa-3x text-info"></i>
                            <h4>Edit Profile</h4>
                            ...............
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="row p-3">
           
                <div class="col-md-4 p-2">
                    <a href="addunote.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book fa-3x text-success"></i>
                                <h4>Make Note's</h4>
                            ...............
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 p-2">
                    <a href="viewunote.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book-open fa-3x text-dark"></i>
                                <h4>View Note's</h4>
                            ...............
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 p-2">
                    <a href="quites.html">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-quote-left fa-3x text-danger"></i>
                                <h4>Quotation</h4>
                            ...............
                            </div>
                        </div>
                    </a>
                </div>
            </div>
      
        
    </div >
    <div class="f">
        <%@include file="all_component/footer.jsp" %>
    </div>
    
</body>
</html>