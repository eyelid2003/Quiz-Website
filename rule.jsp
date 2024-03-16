<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="all_component/allCSS.jsp" %>
    <style>
      body
      {
        background-color: #f0f2f2;

      }
     
     
    </style>
</head>
<body class="bg-color">
    <%@include file="all_component/navbar2.jsp" %>
  
  <marquee><h1 class="p-2">You have to follow some rules.</h1></marquee>
  <div class="container" >
    <ul>
        <li><h4>Please attend this Quiz seriously.</h2></li><br>
        <li><h4>First you wanna play this quiz, click on start button. </h4></li><br>
        <li><h4>Then you have to select your suject  and choose your subject level in which you want to play Quiz.</h4></li><br>
        <li><h4>Click on Show Test button, it will show the available test cases </h4></li><br>
        <li><h4>Chose your Test Case and then click on Start Now Button</h4></li><br>
        <li><h4>Question will appear when you click on green button.</h4></li><br>
        <li><h4>Each Question carry one mark.</h4></li><br>
        <li><h4>In this quiz there is no minus marking</h4></li><br>
        <li><h4>When you select your answer then click on Submit Answer button.</h4></li><br>
        <li><h4>When you click on Submit Test button your quiz will be submitted.</h4></li><br>
       
    </ul>
      <div class="text-center">
        <a href="start.jsp" class="btn btn-success text center">Start Quiz</a><br>
      </div>
      
    
  </div>
  <%@include file="all_component/footer.jsp" %>
</body>
</html>