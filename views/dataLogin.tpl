<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Dataowner Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.1/jquery.validate.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.1/additional-methods.min.js"></script>
        <style type="text/css">
            .error{
                color:red;
                margin-left: 33%
            }
            .success:{
                border: green solid 2px,
            }
        </style>
    </head>
    <body style="background-color: #003333">
        <h2 style="color:#ffffff;margin-left: 95px;">ENSURING DATA SECURITY AND FUZZY SEARCHING OVER AN ENCRYPTED DATA</h2>
        <div class="container" style="margin-top: 20px;padding-left: 475px;background-color: #a3c2c2;margin-left: 250px;margin-right: 150px;width: 915px;">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.html" style="color:#000000">Home</a></li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="color:#000000">Login</a>
                    <ul class="dropdown-menu" style="margin-top: 5px;">
                        <li><a href="/owner/login" align="center">Data Owner</a></li>
                        <li><a href="/user/login" align="center">User</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="color:#000000">Register</a>
                    <ul class="dropdown-menu" style="margin-top: 5px;">
                        <li><a href="/owner/register" align="center">Data Owner</a></li>
                        <li><a href="/user/register" align="center">User</a></li>
                    </ul>
                </li>
                <li><a href="#" style="color:#000000">About Us</a></li>
                <li><a href="#" style="color:#000000">Contact Us</a></li>
            </ul>
        </div>
        <div class="container" style="margin-top: 30px;background-color: #a3c2c2;width: 918px;margin-left: 250px;padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 30px;">
            <form action="/owner/login/post" method="POST" id="ownerlogin">
                <div style="background-color: #000000">
                    <h2 align="center" style="margin-top: 0px;color:#ffffff;height: 55px;padding-top: 10px;padding-bottom: 10px;">Dataowner Login</h2>
                </div>
                <div class="form-group">
                    <label for="email" style="margin-left:300px">Email Id:</label>
                    <input type="text " class="form-control" id="email" placeholder="Enter your Email-Id" style="width:450px;margin-left: 300px;">
                </div>
                <div>
                    <button type="button" class="btn btn-primary" style="margin-left:780px;margin-top: -50px;" id="getsecret">Send</button>
                </div>
                <div class="form-group">
                    <label for="uname" style="margin-left:300px">Username:</label>
                    <input type="text " class="form-control" id="uname" placeholder="Enter your Username" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="psd" style="margin-left:300px">Password:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Enter your Password" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="key" style="margin-left:300px">Secret Key:</label>
                    <input type="password" class="form-control" id="secret" placeholder="Enter your secret" style="width:450px;margin-left: 300px;">
                </div>
                <div style="margin-left: 460px;">
                    <input type="submit" class="btn btn-primary" value="Login">
                    <!-- <button type="submit" class="btn btn-primary">Login</button> -->
                    <a href="/owner/register">Not having an account? Don't worry create here</a>
                    <!-- <button type="button" class="btn btn-primary" onclick="location.href='/owner/register';" style="margin-left: 10px;">Sign Up</button> -->
                </div>
            </form>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#getsecret").on('click', function(){
                    //alert("Clicked");
                    var email = $("#email").val();
                    var uname = $("#uname").val();
                    if( email !== "" && uname !== ""){
                        $.ajax({
                            url: '/getkey',
                            type: 'POST',
                            data:{email:email,username:uname},
                            success: function(response){
                                console.log(response)
                                alert(response.message)
                            }
                        });
                    }
                    else{
                        alert("Please enter your email and username");
                    }
                });
                $("#ownerlogin").validate({
                    rules:{
                        email:{"required":true, "email": true},
                        uname:"required",
                        pwd:"required",
                        secret:"required"
                    },
                    messages:{
                        email:{
                            "required":"Please enter your email",
                            "email": "Please enter valid email"
                        },
                        uname:"Please enter your username",
                        pwd:"Please enter password",
                        secret:"Please enter your secret key"
                    },
                    errorPlacement: function(error, element){
                        element.after(error)
                    },
                    onkeyup: true,
                    focusCleanup: true,
                    validClass: "success"
                });
            });
        </script>
    </body>
</html>