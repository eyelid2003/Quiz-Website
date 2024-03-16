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
            margin-top: 100px;
        }
        .card:hover 
	{
        background-color: #fcf7f7;
    }
     </style>
</head >
<body class="bg-color">
    <%@include file="all_component/navbar2.jsp" %>
   
       
    <div class="container mt-5">

            <div class="row p-3">
                <div class="col-md-4 p-2">
                    <a href="ausub.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-plus fa-3x text-primary"></i>
                                
                                <h4>Add & Update Subject</h4>
                                ...............
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 p-2">
                    <a href="addqus.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-question fa-3x text-warning"></i>
                            <h4>Add Question</h4>
                            ...............
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 p-2">
                    <a href="viewquestion.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-expand fa-3x text-info"></i>
                            <h4>View Question</h4>
                            ...............
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="row p-3">
           
                <div class="col-md-4 p-2">
                    <a href="addnote.jsp">
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
                    <a href="viewnote.jsp">
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
                    <a href="viewresult.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-registered fa-3x text-danger"></i>
                                <h4>View Result</h4>
                            ...............
                            </div>
                        </div>
                    </a>
                </div>
            </div>
      

            <div class="row p-3">
                <div class="col-md-4 p-2">
                    <a href="text.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-sharp fa-solid fa-circle-plus fa-3x text-primary"></i>
                                
                                <h4>Create Test</h4>
                                ...............
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 p-2">
                    <a href="addtest.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-circle-question fa-3x text-danger"></i>
                            <h4>Add Question's Test</h4>
                            ...............
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 p-2">
                    <a href="upTest.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-sharp fa-solid fa-pen-to-square fa-3x text-success"></i>
                            <h4>Update Test</h4>
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