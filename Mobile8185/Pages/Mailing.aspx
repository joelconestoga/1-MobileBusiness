<%@ Page Title="Mailing List" Language="C#" MasterPageFile="~/Pages/Template.master" AutoEventWireup="true" 
    EnableEventValidation="false" CodeFile="Mailing.aspx.cs" Inherits="Mailing" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <% if (Security.IsAuthenticated(session)) { %> 

    <!-- Row for MAILING VISIBLE starts -->
    <fieldset>
        <legend>Current Mailing</legend>
	    <div class="row">
    	    <div class="col-md-3">
                <div class="form-group">
                    <textarea class="form-control" rows="10" id="outputMailing" runat="server" readonly></textarea>
                </div>
            </div>
        </div>
    </fieldset>
    
    <hr />

    <% }%>

    <!-- Row for FORM starts -->
	<div class="row">
    	<div class="col-md-12">

            <fieldset>
                <legend class="font-custom">Join Mailing List</legend>
                <div class="row">
                    <div class="form-group">
                        <label for="inputEmail" class="col-lg-1 control-label text-right">Email</label>
                        <div class="col-lg-2">
                            <input class="form-control" id="inputEmail" runat="server" placeholder="Email" type="text" autofocus />
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-2 col-lg-offset-1 text-right">
                            <button type="reset" class="btn btn-default">Cancel</button>
                            <asp:Button class="btn btn-primary" runat="server" OnClick="Join_Mailing_Click" Text="Join" />
                        </div>
                    </div>
                </div>
            </fieldset>

        </div>
    </div><!-- /.row for FORM ends -->

</asp:Content>


