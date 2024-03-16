
<style>
  .bg-custom
{
    background-color: rgb(188, 158, 215);
}
.navbar .nav-item .nav-link:hover
{
    background-color:black;
    color:white;
    border-radius: 15px;
}
.nav-link:hover
{
    background-color:black;
    color:white;
    border-radius: 15px;
}
.bg-color
        {
            background-image: url("images/bg1.jpeg");
            background-repeat: no-repeat;
            height: 100%;
            background-attachment: fixed;
           background-position: center;
           background-size: cover;
        }
       
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
   
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <h3 ><i class="fa-brands fa-quinscape"></i> Quiz Game<span class="sr-only">(current)</span></h3>
        </li>
    
      </ul>
      
      <form class="form-inline my-2 my-lg-0">
      
        <a href="index.jsp" class="btn btn-light m-2 my-sm-0" type="submit"><i class="fa-solid fa-right-to-bracket"></i> Login </a>
       
        <a href="sign.jsp" class="btn btn-light m-2 my-sm-0" type="submit"><i class="fa-solid fa-address-card"></i> Registration</a>
       
        <a href="deleteaccount.jsp" class="btn btn-light m-2 my-sm-0" href="history.jsp" type="submit"><i class="fa-solid fa-trash"></i> Delete Account</a>
        <a href="admin/admin.jsp" class="btn btn-light m-2 my-sm-0" type="submit"><i class="fa-solid fa-user"></i> Admin</a>
      </form>
      
          
      
    </div>
  </nav>