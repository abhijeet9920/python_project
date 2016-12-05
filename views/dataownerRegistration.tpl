<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Dataowner Registration</title>
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
                margin-left: 33%;
            }
            .success:{
                border: green solid 2px;
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
        <div class="container" style="margin-top: 30px;background-color: #a3c2c2;width: 918px;margin-left: 250px;padding-left: 0px;padding-right: 0px;">
            %if msg != '':
                %if classname == 'success':
                    <p class="alert alert-info">{{msg}}</p>
                %elif classname == 'failed':
                    <p class="alert alert-danger">{{msg}}</p>
                %end
            %end
            <div style="background-color: #000000">
                <h2 align="center" style="margin-top: 0px;color:#ffffff;height: 55px;padding-top: 10px;padding-bottom: 10px;">Registration Form</h2>
            </div>
            <form style="margin-top: 30px;" action="/owner/post" method="POST" id="ownerreg">
                <div class="form-group">
                    <label for="fname" style="margin-left:300px">First Name:</label>
                    <input type="text " class="form-control" name="fname" id="fname" placeholder="Enter your First name" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="lname" style="margin-left:300px">Last Name:</label>
                    <input type="text " class="form-control" name="lname" id="lname" placeholder="Enter your Last name" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="address" style="margin-left:300px">Address:</label>
                    <input type="text" class="form-control" name="address" id="address" placeholder="Enter your Address" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="phone" style="margin-left:300px">Phone no:</label>
                    <input type="text " class="form-control" name="phone" id="phone" placeholder="Enter your Phone number" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="email" style="margin-left:300px">Email:</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="Enter email" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="uname" style="margin-left:300px">Username:</label>
                    <input type="uname" class="form-control" name="uname" id="uname" placeholder="Enter Username" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="pwd" style="margin-left:300px">Password:</label>
                    <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter password" style="width:450px;margin-left: 300px;">
                </div>
                <button type="submit" class="btn btn-primary" style="margin-left:500px">Submit</button>
            </form>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#email").on("change", function(){
                    var value = $(this).val();
                    $.ajax({
                        type:"POST",
                        url: "/checkemail", // script to validate in server side
                        data: {email: value},
                        success: function(data) {
                            console.log(data);
                            if(data.status === true){
                                var html = '<label id="email-error" class="error" for="email">Please choose another email</label>';
                                console.log(html);
                                $("#email").after(html)
                            }
                        }
                    });
                });
                $("#ownerreg").validate({
                    rules:{
                        fname:"required",
                        lname:"required",
                        address:"required",
                        phone:{"required":true, "digits":true},
                        email:{"required":true, "email": true},
                        uname:"required",
                        pwd:"required"
                    },
                    messages:{
                        fname:"Please enter your first name",
                        lname:"Please enter your last name",
                        address:"Please enter your address",
                        phone:{
                            "required":"Please enter your mobile number",
                            "digits":"Phone number must be a number"
                        },
                        email:{
                            "required":"Please enter your email",
                            "email": "Please enter valid email"
                        },
                        uname:"Please enter your username",
                        pwd:"Please enter password"
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