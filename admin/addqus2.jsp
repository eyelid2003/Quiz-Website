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
            margin-top: 3%;
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
                            
                            String subject=(String)session.getAttribute("subject");
                            String level=(String)session.getAttribute("level");
                        %>
                        <h4 class="text-center">Add Question's</h4><br>
                        <form action="../AddQus" method="post"  >
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="subject">Subject Name</label>
                                    <input type="text" class="form-control" id="subject" value="<%= subject %>" name="subject" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="level">Subject Level</label>
                                    <input type="text" class="form-control" id="level" value="<%= level %>" name="level" readonly >
                                </div>
                            </div>
                        
                            <div class="form-group">
                              <label for="qus">Question</label>
                              <input type="text" class="form-control" name="qus" id="qus" placeholder="Question" required>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="first">1st Option</label>
                                    <input type="text" class="form-control" id="first" name="first" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="second">2nd Option</label>
                                    <input type="text" class="form-control" id="second"  name="second" required >
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="third">3rd Option</label>
                                    <input type="text" class="form-control" id="third" name="third" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="forth">4th Option</label>
                                    <input type="text" class="form-control" id="forth" name="forth"  required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="rightt">Right Option</label>
                              <input type="text" class="form-control" name="rightt" id="rightt" required >
                            </div>


                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg"  onclick="return p1()">Add</button>
                                <a href="../Exit" class="btn btn-primary btn-lg">Exit</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><div class="f">
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