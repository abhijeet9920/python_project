<!DOCTYPE html>
<html lang="en">
    <head>
        <title>User Search</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.1/jquery.validate.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.1/additional-methods.min.js"></script>
        <style type="text/css">
            .error{
                color:red;
                margin-left: 33%
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
            table {
                padding-left: 70px;
                padding-right: 70px;
                margin-top: 30px;
                margin-left: 30px;
            }
            th, td{
                padding-left: 70px;
                padding-right: 70px;
            }
        </style>
    </head>
    <body style="background-color: #003333">
        <h2 style="color:#ffffff;margin-left: 95px;">ENSURING DATA SECURITY AND FUZZY SEARCHING OVER AN ENCRYPTED DATA</h2>
        <div class="container" style="margin-top: 20px;padding-left: 475px;background-color: #a3c2c2;margin-left: 250px;margin-right: 150px;width: 915px;">
            <!-- <ul class="nav navbar-nav">
                <li class="active"><a href="index.html">Home</a></li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">Login</a>
                    <ul class="dropdown-menu" style="margin-top: 5px;">
                        <li><a href="do1.html" align="center">Data Owner</a></li>
                        <li><a href="u1.html" align="center">User</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">Register</a>
                    <ul class="dropdown-menu" style="margin-top: 5px;">
                        <li><a href="dataowner.html" align="center">Data Owner</a></li>
                        <li><a href="user.html" align="center">User</a></li>
                    </ul>
                </li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul> -->
        </div>
        <div class="container" style="margin-top: 30px;background-color: #a3c2c2;width: 918px;margin-left: 250px;padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 30px;">
            <div style="background-color: #000000">
                <h2 align="center" style="margin-top: 0px;color:#ffffff;height: 55px;padding-top: 10px;padding-bottom: 10px;">User Search</h2>
            </div>
            <div class="form-group">
                <input type="text " class="form-control" id="fname" placeholder="Search" style="width:450px;margin-left: 350px;">
            </div>
            <div style="margin-left: 810px;margin-top: -45px;">
                <button class="icon" style="height: 25px;padding-top: 3px;padding-right: 3px;padding-left: 3px;"><i class="glyphicon glyphicon-search" style="width: 14px;height: 30px;"></i></button>
            </div>
            <div class="form-group">
                <table border="3px">
                    <tr>
                        <th> Sr No.</th>
                        <th>Search Results</th>
                        <th>Download</th>
                    </tr>
                    <tr>
                        <td>1.</td>
                        <td>Fuzzy Search</td>
                        <td><button class="btn btn-info">Download  <i class="glyphicon glyphicon-download"></i></button></td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
    <noscript>
        <div class="overlay">
            <span class="disabledmsg">Please enable javascript</span>
        </div>
    </noscript>
</html>