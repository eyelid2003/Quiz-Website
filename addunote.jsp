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
                            
                            String email=(String)session.getAttribute("email");
                        %>
                        <h4 class="text-center">Add Notes</h4>
                        <form action="AddUNote" method="post" enctype="multipart/form-data" >
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" id="email" name="email" value="<%= email %>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="nheading">Note Heading</label>
                                <input type="text" class="form-control" id="nheading" name="nheading" placeholder="Note Heading" required>
                            </div>
            
                            <div class="form-group">
                                <label for="ndesc">Note Description</label>
                                <textarea rows="3" placeholder="Description of Note" class="form-control form-lg fs-6 shadow-sm" name="ndesc" id="ndesc" required></textarea>
                            </div>
                        

                            <div class="form-group">
                                <label class="my-1 mr-2" for="nstatus">Note Status</label>
                                <select class="custom-select my-1 mr-sm-2" id="nstatus" name="nstatus">
                                    <option value="select">....select....</option>
                                    <option value="public">Public</option>
                                    <option value="private">Private</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="photo">Upload Photo</label>
                                <input type="file" class="form-control" name="photo" value="photo" id="photo" placeholder="Chose Photo" required>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg" onclick="return p1()">Add Note</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="all_component/footer.jsp" %>
    <script>
        function p1()
        {
            a=document.getElementById("nstatus").value
            if(a=="select")
            {
                alert("Chose Status")
                return false
            }
    
        }
       </script>
</body>
</html>