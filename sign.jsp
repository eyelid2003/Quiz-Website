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
    <%@include file="all_component/navbar.jsp" %>
    <section class="d-flex flex-column min-vh-100 justify-content-center align-item-center">
        <div class="container">
           
            <div class="row">
                <div class="col-md-9 mx-auto rounded-5 shadow bg-white">
                    <div class="contect-form">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="m-5 text-center">
                                    <%@include file="msg.jsp" %>
                                    <h1>Create your account</h1>
                                </div>
                                
                                <form action="Signin" method="post" class="m-5">
                                    <div class="mb-3">
                                        <input type="text" name="name" placeholder="Your Name" id="name" class="form-control form-lg fs-6 shadow-sm" required>
                                    </div>
                                    <div class="mb-3">
                                        <input type="text" name="email" placeholder="Your E-mail" id="email" class="form-control form-lg fs-6 shadow-sm" required>
                                    </div>
                                    <div class="mb-3">
                                        <input type="password" name="pass" placeholder="Your Password" id="pass" class="form-control form-lg fs-6 shadow-sm" required>
                                    </div>
                                    <div class="mb-3">
                                        <input type="number" name="contact" placeholder="Your Contact" id="contact" class="form-control form-lg fs-6 shadow-sm" required>
                                    </div>
                                    <div class="mb-3">
                                        <button class="btn btn-primary">Create Account</button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-5">
                                <div class="mt-5">
                                    <img src="images/logo.png" class="img-fluid mt-5 p-3" id="img" >
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="all_component/footer.jsp" %>
</body>

</html>