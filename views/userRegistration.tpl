<!DOCTYPE html>
<html lang="en">
    <head>
        <title>User Registration</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        </div>
        <div class="container" style="margin-top: 30px;background-color: #a3c2c2;width: 918px;margin-left: 250px;padding-left: 0px;padding-right: 0px;">
            <div style="background-color: #000000">
                <h2 align="center" style="margin-top: 0px;color:#ffffff;height: 55px;padding-top: 10px;padding-bottom: 10px;">Registration Form</h2>
            </div>
            <form style="margin-top: 30px;" action="/user/post" method="POST">
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
    </body>
</html>