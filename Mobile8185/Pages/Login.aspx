<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Pages/Template.master" AutoEventWireup="true" 
    EnableEventValidation="false" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Row for FORM starts -->
	<div class="row">
    	<div class="col-md-12">

            <fieldset>
                <legend class="font-custom">ADMIN</legend>
                <div class="row">
                    <div class="form-group">
                        <label for="username" class="col-lg-1 control-label text-right">Username</label>
                        <div class="col-lg-2">
                            <input class="form-control" id="username" runat="server" placeholder="Username" type="text" autofocus/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="password" class="col-lg-1 control-label text-right">Password</label>
                        <div class="col-lg-2">
                            <input class="form-control" id="password" runat="server" placeholder="Password" type="password"/>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-2 col-lg-offset-1 text-right">
                            <button type="reset" class="btn btn-default">Cancel</button>
							<asp:Button ID="login" class="btn btn-primary" runat="server" OnClick="Login_Click" Text="Login" />
                        </div>
                    </div>
                </div>
            </fieldset>

        </div>
    </div><!-- /.row for FORM ends -->

    <!-- MODAL -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Login Failed</h4>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lblMessage" runat="server" Text="Invalid Username/Password!" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.MODAL -->


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- scripts for Modal -->
    <script type="text/javascript">
        function OpenDialog() {
            $('#myModal').modal('show');
        }
    </script>

</asp:Content>

 
