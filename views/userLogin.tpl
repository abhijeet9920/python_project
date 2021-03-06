<!DOCTYPE html>
<html lang="en">
    <head>
        <title>User Login</title>
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
            .loader {
                display: none;
                position: fixed;
                left: 0px;
                top: 0px;
                width: 100%;
                height: 100%;
                z-index: 56;
                opacity: 0.5;
                /*background: url('http://interactive.channelvn.net/Published/Quiz/Styles/images/quiz-loading.gif') 50% 50% no-repeat rgb(204, 204, 204);*/
                background: url('/loader') 50% 50% no-repeat rgb(204, 204, 204);
            }
            .overlay {
                background-color: rgba(1, 1, 1, 0.7);
                bottom: 0;
                left: 0;
                position: fixed;
                right: 0;
                top: 0;
                text-align: center;
            }
            .disabledmsg {
                font-size: 45px;
                color:red;
                position: absolute;
                top: 50%;
                left: 0;
                right: 0;
                margin-top: -9px;
            }
        </style>
    </head>
    <body style="background-color: #003333">
        <h2 style="color:#ffffff;margin-left: 95px;">ENSURING DATA SECURITY AND FUZZY SEARCHING OVER AN ENCRYPTED DATA</h2>
        <div class="container" style="margin-top: 20px;padding-left: 475px;background-color: #a3c2c2;margin-left: 250px;margin-right: 150px;width: 915px;">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/" style="color:#000000">Home</a></li>
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
            <div class="loader"></div>
            <form action="/user/login/post" method="POST" id="userlogin">
                <div style="background-color: #000000">
                    <h2 align="center" style="margin-top: 0px;color:#ffffff;height: 55px;padding-top: 10px;padding-bottom: 10px;">User Login</h2>
                </div>
                <div class="form-group">
                    <label for="email" style="margin-left:300px">Email Id:</label>
                    <input type="text " class="form-control" id="email" name="email" placeholder="Enter your Email-Id" style="width:450px;margin-left: 300px;">
                </div>
                <div>
                    <button type="button" class="btn btn-primary" style="margin-left:780px;margin-top: -50px;" id="getuserskey">Send</button>
                </div>
                <div class="form-group">
                    <label for="uname" style="margin-left:300px">Username:</label>
                    <input type="text " class="form-control" id="uname" name="uname" placeholder="Enter your Username" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="psd" style="margin-left:300px">Password:</label>
                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter your Password" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="key" style="margin-left:300px">Secret Key:</label>
                    <input type="password" class="form-control" id="secret" name="secret" placeholder="Enter your Password" style="width:450px;margin-left: 300px;">
                </div>
                <div style="margin-left: 460px;">
                    <button type="submit" class="btn btn-primary">Login</button>
                    <a href="/user/register">Not having an account? Don't worry create here</a>
                </div>
            </form>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#getuserskey").on('click', function(){
                    var email = $("#email").val();
                    var uname = $("#uname").val();
                    if( email !== "" && uname !== ""){
                        $.ajax({
                            url: '/getkey',
                            type: 'POST',
                            data:{email:email,username:uname},
                            beforeSend:function(){
                                $(".loader").show();
                            },
                            success: function(response){
                                $(".loader").hide();
                                console.log(response)
                                alert(response.message)
                                if(response.status == 'fail'){
                                    location.reload();
                                }
                            }
                        });
                    }
                    else{
                        alert("Please enter your email and username");
                    }
                });


                $("#userlogin").validate({
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
    <noscript>
        <div class="overlay">
            <span class="disabledmsg">Please enable javascript</span>
        </div>
    </noscript>
</html>