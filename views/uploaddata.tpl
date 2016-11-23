<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Upload Files</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style type="text/css">
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
    <body>
        <div class="container" style="margin-top: 20px; padding-left: 700px;">
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
            </ul> -->
        </div>
        </div>
        <div class="container" style="margin-top: 30px;">
        <div class="form-group">
            <label for="email" style="margin-left:350px">Select File:</label>
            <div>
                <button type="button" class="btn btn-primary" style="margin-left: 450px;margin-top: -55px;">Browse</button>
            </div>
            <div class="form-group">
                <label for="uname" style="margin-left:350px">Title for file:</label>
                <input type="text " class="form-control" id="uname" placeholder="" style="width:450px;margin-left: 350px;">
            </div>
            <div class="form-group">
                <label for="psd" style="margin-left:350px">Enter Keywords:</label>
                <input type="password" class="form-control" id="psd" placeholder="" style="width:450px;margin-left: 350px;">
            </div>
            <div style="margin-left: 475px;">
                <button type="button" class="btn btn-primary">Upload</button>
                <button type="button" class="btn btn-primary" onclick="location.href='user.html';" style="margin-left: 10px;">Back</button>
            </div>
            <div class="form-group">
                <table style="padding-left: 70px;padding-right: 70px;margin-top: 30px;margin-left: 200px;">
                    <tr>
                        <th style="padding-left: 70px;padding-right: 70px;padding-bottom: 20px;"> Sr No. 
                        <th>
                        <th style="padding-left: 70px;padding-right: 70px;padding-bottom: 20px;">Search Results</th>
                        <th style="padding-left: 70px;padding-right: 70px;padding-bottom: 20px;">Upload</th>
                        <th style="padding-left: 70px;padding-right: 70px;padding-bottom: 20px;">Delete</th>
                    </tr>
                    <tr>
                        <td style="padding-left: 70px;padding-right: 70px;padding-bottom: 20px;">1.
                        <td>
                        <td style="padding-left: 70px;padding-right: 70px;padding-bottom: 20px;">Fuzzy Search</td>
                        <td style="padding-left: 70px;padding-right: 70px;padding-bottom: 20px;">Uploaded</td>
                        <td style="padding-left: 70px;padding-right: 70px;padding-bottom: 20px;"><button class="icon" class="btn btn-primary">Delete <i class="glyphicon glyphicon-trash"></i></button></td>
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