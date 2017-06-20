<%@ Page Title="Home-Ninja Mobile" Language="C#" MasterPageFile="~/Pages/Template.master" AutoEventWireup="true" 
    EnableEventValidation="false" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    
    <style>
        /* Center the loader */
        #loader {
          position: absolute;
          left: 50%;
          top: 50%;
          z-index: 1;
          width: 150px;
          height: 150px;
          margin: -75px 0 0 -75px;
          border: 16px solid #f3f3f3;
          border-radius: 50%;
          border-top: 16px solid #3498db;
          width: 120px;
          height: 120px;
          -webkit-animation: spin 2s linear infinite;
          animation: spin 2s linear infinite;
        }

        @-webkit-keyframes spin {
          0% { -webkit-transform: rotate(0deg); }
          100% { -webkit-transform: rotate(360deg); }
        }

        @keyframes spin {
          0% { transform: rotate(0deg); }
          100% { transform: rotate(360deg); }
        }

        /* Add animation to "page content" */
        .animate-bottom {
          position: relative;
          -webkit-animation-name: animatebottom;
          -webkit-animation-duration: 1s;
          animation-name: animatebottom;
          animation-duration: 1s
        }

        @-webkit-keyframes animatebottom {
          from { bottom:-100px; opacity:0 } 
          to { bottom:0px; opacity:1 }
        }

        @keyframes animatebottom { 
          from{ bottom:-100px; opacity:0 } 
          to{ bottom:0; opacity:1 }
        }

        #wait_for_loader {
          display: none;
          text-align: center;
        }
    </style>

    <!-- scripts for LOADER -->
    <script type="text/javascript">

        var myVar;

        function showLoader() {
            myVar = setTimeout(showPage, 2000);
        }

        function showPage() {
            document.getElementById("loader").style.display = "none";
            document.getElementById("wait_for_loader").style.display = "block";
        }

        function hideLoader() {
            document.getElementById("wait_for_loader").style.display = "block";
            document.getElementById("loader").style.display = "none";
        }
    </script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="loader"></div>
    
    <!-- Content hidden while LOADING -->
    <div style="display:none;" id="wait_for_loader" class="animate-bottom">

        <!-- Row for CAROUSEL starts -->
	    <div class="row">
    	    <div class="col-md-12">

                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="/img/mobile7.png" alt="Los Angeles">
                        </div>

                        <div class="item">
                            <img src="/img/mobile2a.png" alt="Chicago">
                        </div>

                        <div class="item">
                            <img src="/img/mobile6.png" alt="New York">
                        </div>

                        <div class="item">
                            <img src="/img/mobile3.png" alt="New York">
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

            </div>
        </div><!-- /.row for CAROUSEL ends -->

        <hr>

        <!-- Row for EXTRA CONTENT starts -->
	    <div class="row">
    	
            <!-- SIDE PANEL -->
            <div class="col-md-4">
                    
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h3>Expand your business</h3>
                        <img src="/img/thumb4.png" class="img-thumbnail" alt="Cinque Terre">
                        <hr />
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-body">
                        <h3>Reach success</h3>
                        <img src="/img/thumb2.png" class="img-thumbnail" alt="Cinque Terre">
                        <hr />
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>
                    </div>
                </div>

            </div> <!-- SIDE PANEL -->

            <!-- MESSAGE BOARD -->
    	    <div class="col-md-8">
                    

                <% if (Security.IsAuthenticated(session)) { %> 

                    <!-- UPLOAD FIELDS -->
                    <fieldset>
                        <legend>Uploading Posts</legend>

                        <!-- Row for UPLOAD starts -->
                        <div class="row">
                            <div class="form-group">
                                <label for="uploadFile" class="col-lg-2 control-label text-right">File</label>
                                <div class="col-md-10">
							        <asp:FileUpload ID="uploadFile" runat="server" BorderStyle="Ridge" Width="309px" BackColor="White"/>
                                </div>
                            </div>
                        </div>

                        <!-- Row for COMMENTS starts -->
                        <div class="row">
                            <div class="form-group">
                                <label for="inputComments" class="col-lg-2 control-label text-right">Comments</label>
                                <div class="col-md-10">
                                    <textarea id="inputComments" class="form-control" runat="server" rows="3"></textarea>
                                </div>
                            </div>
                        </div>

                        <hr />

                        <!-- Row for BUTTONS starts -->
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-12 text-right">
                                    <button type="reset" class="btn btn-default">Cancel</button>
							        <asp:Button ID="Upload_Button" class="btn btn-primary" runat="server" OnClick="Upload_Click" Text="Upload" />
                                </div>
                            </div>
                        </div>
                    </fieldset> <!-- UPLOAD FIELDS -->
            
                    <hr />

                <% }%>
            
                <div class="panel panel-default">
                    <div class="panel-body">

                        <h3 class="text-center">Message Board</h3>

				        <!-- REPEATER -->
				        <asp:Repeater ID="RepeaterImages" runat="server" >
				        <ItemTemplate>
			
                            <div class="panel panel-default">
                                <div class="panel-body">

                                    <% if (Security.IsAuthenticated(session)) { %> 
					                    <!-- Row for DELETE starts -->
					                    <div class="row">
						                    <div class="col-md-12 text-right">
							                    <asp:Button CssClass="btn-danger waves-effect delete-button"
								                    runat="server" OnClick="Delete_Click" Text="X" 
								                    CommandArgument="<%# (Container.DataItem as Post).ImageName %>" />
						                    </div>
					                    </div><!-- /.Row for DELETE ends-->
                                    <% }%>

					                <!-- Row for IMAGE starts -->
					                <div class="row">
						                <div class="col-md-12 text-center">
							                <asp:Image ID="Image" class="img-rounded" runat="server" 
                                                ImageUrl='<%# (Container.DataItem as Post).ImageName %>' />
						                </div>
					                </div><!-- /.Row for IMAGE ends-->

                                    <hr />

					                <!-- Row for COMMENT starts -->
					                <div class="row">
						                <div class="col-md-12 text-left">
							                <p runat="server"><%# (Container.DataItem as Post).Date %></p>
							                <p runat="server"><%# (Container.DataItem as Post).Comment %></p>
						                </div>
					                </div><!-- /.Row for COMMENT ends-->

                                </div>
                            </div>
	
				        </ItemTemplate>
				        </asp:Repeater><!-- REPEATER -->

                    </div>
                </div>

            </div> <!-- MESSAGE BOARD -->

        </div><!-- /.row for EXTRA CONTENT ends -->

    </div><!-- Content hidden while LOADING -->


    <!-- MODAL -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Delete Confirmation</h4>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lblMessage" runat="server" Text="The Post will be deleted. Confirm?"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button class="btn btn-primary" runat="server" OnClick="Delete_Confirmation_Click" Text="Delete" />
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.MODAL -->


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- scripts for Modal -->
    <script type="text/javascript">
        function OpenConfirmationDialog() {
            $('#myModal').modal('show');
        }
    </script>

</asp:Content>
