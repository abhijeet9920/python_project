<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Dataowner Login</title>
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
        <form action="login.py" method="POST">
            <div class="container" style="margin-top: 30px;background-color: #a3c2c2;width: 918px;margin-left: 250px;padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 30px;">
                <div style="background-color: #000000">
                    <h2 align="center" style="margin-top: 0px;color:#ffffff;height: 55px;padding-top: 10px;padding-bottom: 10px;">Dataowner Login</h2>
                </div>
                <div class="form-group">
                    <label for="email" style="margin-left:300px">Email Id:</label>
                    <input type="text " class="form-control" id="email" placeholder="Enter your Email-Id" style="width:450px;margin-left: 300px;">
                </div>
                <div>
                    <button type="button" class="btn btn-primary" style="margin-left:780px;margin-top: -50px;">Send</button>
                </div>
                <div class="form-group">
                    <label for="uname" style="margin-left:300px">Username:</label>
                    <input type="text " class="form-control" id="uname" placeholder="Enter your Username" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="psd" style="margin-left:300px">Password:</label>
                    <input type="password" class="form-control" id="psd" placeholder="Enter your Password" style="width:450px;margin-left: 300px;">
                </div>
                <div class="form-group">
                    <label for="key" style="margin-left:300px">Secret Key:</label>
                    <input type="password" class="form-control" id="psd" placeholder="Enter your Password" style="width:450px;margin-left: 300px;">
                </div>
                <div style="margin-left: 460px;">
                    <button type="button" class="btn btn-primary">Login</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='dataowner.html';" style="margin-left: 10px;">Sign Up</button>
                </div>
            </div>
        </form>
    </body>
</html>