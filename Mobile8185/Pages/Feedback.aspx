<%@ Page Title="Comments/Feedback" Language="C#" MasterPageFile="~/Pages/Template.master" AutoEventWireup="true" 
    EnableEventValidation="false" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <% if (Security.IsAuthenticated(session)) { %> 

    <!-- Row for FEEDBACKS starts -->
    <fieldset>
        <legend>Current Comments</legend>
	    <div class="row">
    	    <div class="col-md-12">
                <div class="form-group">
                    <textarea class="form-control" rows="10" id="outputFeedbacks" runat="server" readonly></textarea>
                </div>
            </div>
        </div>
    </fieldset>
    
    <hr />

    <% }%>

    <!-- Row for FORM starts -->
	<div class="row">
    	<div class="col-md-12">

            <form class="form-horizontal">
                <fieldset>
                    <legend class="font-custom">Comments and Feedback</legend>
                	<div class="row">
                        <div class="form-group">
                            <label for="inputName" class="col-lg-1 control-label text-right">Name</label>
                            <div class="col-lg-2">
                                <input class="form-control" id="inputName" runat="server" placeholder="Name" type="text">
                            </div>
                        </div>
                    </div>
                	<div class="row">
                        <div class="form-group">
                            <label for="inputEmail" class="col-lg-1 control-label text-right">Email</label>
                            <div class="col-lg-2">
                                <input class="form-control" id="inputEmail" runat="server" placeholder="Email" type="text">
                            </div>
                        </div>
                    </div>
                	<div class="row">
                        <div class="form-group">
                            <label for="inputComment" class="col-lg-1 control-label text-right">Message</label>
                            <div class="col-lg-10">
                                <textarea class="form-control" rows="3" runat="server" id="inputComment"></textarea>
                            </div>
                        </div>
                    </div>
                    <hr />
                	<div class="row">
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-1 text-right">
                                <button type="reset" class="btn btn-default">Cancel</button>
                                <asp:Button class="btn btn-primary" runat="server" OnClick="Feedback_Click" Text="Send" />
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>

        </div>
    </div><!-- /.row for FORM ends -->

</asp:Content>




