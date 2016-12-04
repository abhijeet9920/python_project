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
            .loader {
                display: none;
                position: fixed;
                left: 0px;
                top: 0px;
                width: 100%;
                height: 100%;
                z-index: 56;
                opacity: 0.5;
                background: url('/loader') 50% 50% no-repeat rgb(204, 204, 204);
            }
        </style>
    </head>
    <body style="background-color: #003333">
        <h2 style="color:#ffffff;margin-left: 95px;">ENSURING DATA SECURITY AND FUZZY SEARCHING OVER AN ENCRYPTED DATA</h2>
        <div class="container" style="margin-top: 20px;padding-left: 475px;background-color: #a3c2c2;margin-left: 250px;margin-right: 150px;width: 915px;">
        </div>
        <div class="container" style="margin-top: 30px;background-color: #a3c2c2;width: 918px;margin-left: 250px;padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 30px;">
            <div style="background-color: #000000">
                <h2 align="center" style="margin-top: 0px;color:#ffffff;height: 55px;padding-top: 10px;padding-bottom: 10px;">User Search</h2>
            </div>
            <div class="loader"></div>
            <form method="GET">
                <div class="form-group">
                    <input type="text " name="fname" class="form-control" id="fname" placeholder="Search" style="width:450px;margin-left: 200px;">
                </div>
                <div style="margin-left: 700px;margin-top: -45px;" class="form-group">
                    <button class="btn btn-info" type="submit">Search <i class="glyphicon glyphicon-search" style="width: 14px;height: 30px;"></i></button>
                </div>
            </form>
            <br>
            <br>
            <table border="3px" class="table">
                <tr>
                    <th> Id.</th>
                    <th>File Name</th>
                    <th>Upload On</th>
                    <th>Upload By</th>
                    <th>Action</th>
                </tr>
                %for data in files:
                    <tr>
                        <td>
                            {{data[0]}}
                            <input type="hidden" value={{data[5]}}>
                        </td>
                        <td>{{data[2]}}</td>
                        <td>{{data[3].strftime('%A, %d %b %Y %I:%M %p')}}</td>
                        <td>{{data[4]}}</td>
                        <td>
                            <form method="POST" action="/download">
                                <input type="hidden" value={{data[2]}} class="fname" name="name">
                                <input type="hidden" value={{data[1]}} class="fpath" name="path">
                                <button class="btn btn-info download" type="submit">Download  <i class="glyphicon glyphicon-download"></i></button>
                            </form>
                        </td>
                    </tr>
                %end
            </table>
            <div>
            </div>
        </div>
    </body>
    <noscript>
        <div class="overlay">
            <span class="disabledmsg">Please enable javascript</span>
        </div>
    </noscript>
</html>