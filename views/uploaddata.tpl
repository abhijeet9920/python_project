<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Upload Files</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tag-it/2.0/css/jquery.tagit.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.1/jquery.validate.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tag-it/2.0/js/tag-it.js"></script>
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
            /*table {
                padding-left: 70px;
                padding-right: 70px;
                margin-top: 30px;
                margin-left: 30px;
            }*/
            th, td{
                padding-left: 70px;
                padding-right: 70px;
            }
            .btn-file {
                position: relative;
                overflow: hidden;
            }
            /*.btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: white;
                cursor: inherit;
                display: block;
            }*/
        </style>
    </head>
    <body style="background-color: #003333">
        <div class="container" style="margin-top: 20px; padding-left: 700px;">
            <!-- <ul class="nav navbar-nav">
                <li class="active"><a href="/">Home</a></li>
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
        <div class="container" style="margin-top: 30px;background-color: #a3c2c2;width: 918px;margin-left: 250px;padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 30px;">
            <div style="background-color: #000000">
                <h2 align="center" style="margin-top: 0px;color:#ffffff;height: 55px;padding-top: 10px;padding-bottom: 10px;">Upload File</h2>
            </div>
            <div class="form-group">
                
                %if msg != '':
                    <p class="{{classname}}">{{msg}}</p>
                %end
                <h2><center>Welcome {{login['uname']}}</center></h2>
                
                <form enctype="multipart/form-data" method="POST" id="upload">            
                    <label for="email" style="margin-left:350px">Select File:</label>
                    <span class="btn btn-default btn-file">
                        Browse <input type="file" name="documents" id="documents">
                    </span>
                    <div class="form-group">
                        <label for="title" style="margin-left:350px">Title for file:</label>
                        <input type="text " class="form-control" id="title" name="title" placeholder="" style="width:450px;margin-left: 350px;">
                        <input type="hidden" name="userid" value={{login['id']}}>
                    </div>
                    <div class="form-group">
                        <label for="keywords" style="margin-left:350px">Enter Keywords:</label>
                        <input type="text" class="tagit-hidden-field" id="keywords" name="keywords" placeholder="" style="width:450px;margin-left: 350px;">
                        <ul style="float:right" name="company" id="company"> </ul> 
                    </div>
                    <div style="margin-left: 475px;">
                        <button type="submit" class="btn btn-primary">Upload</button>
                        <button type="button" class="btn btn-primary" onclick="location.href='user.html';" style="margin-left: 10px;">Back</button>
                    </div>
                </form>
                <div class="form-group">
                    <table border="3px solid" class="table">
                        <tr>
                            <th>Files</th>
                            <th>Download</th>
                            <th>Delete</th>
                        </tr>
                        %for data in files:
                            <tr>
                                <td>{{data[2]}}</td>
                                <td>
                                    <form method="POST" action="/download">
                                        <input type="hidden" value={{data[2]}} class="fname" name="name">
                                        <input type="hidden" value={{data[1]}} class="fpath" name="path">
                                        <button class="btn btn-info download" type="submit">Download  <i class="glyphicon glyphicon-download"></i></button>
                                    </form>
                                </td>
                                <td><button class="btn btn-danger delete" id={{data[0]}}>Delete <i class="glyphicon glyphicon-trash"></i></button></td>
                            </tr>
                        %end
                    </table>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                //$("#company").tagit("add", {label: 'tag', value: 12});
                $(".delete").on('click', function(){
                    var id = $(this).attr('id');
                    var ch = confirm("Are you sure you want to delete?");
                    if(ch === true){
                        $.ajax({
                            url:'/deletefile/'+parseInt(id),
                            type:'POST',
                            success:function(data){
                                alert(data.msg);
                                location.reload();
                            }
                        })
                    }
                });
                $("#upload").validate({
                    rules:{
                        documents:"required",
                        keywords:"required"
                    },
                    messages:{
                        documents:{
                            "required":"Please upload a file"
                        },
                        keywords:{
                            "required":"Please enter some keywords"
                        }
                    },
                    errorPlacement: function(error, element){
                        if(element.attr('id') == 'documents'){
                            element.parent().after(error)
                        }else{
                            element.after(error)
                        }
                    },
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