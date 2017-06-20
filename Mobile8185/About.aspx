<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="mainhead" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <script type="text/javascript">
        function openModalDiv(divname) {
            $('#' + divname).dialog({ autoOpen: false, bgiframe: true, modal: true });
            $('#' + divname).dialog('open');
            $('#' + divname).parent().appendTo($("form:first"));
        }

        function closeModalDiv(divname) {
            $('#' + divname).dialog('close');
        }
    </script>

</asp:Content>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <input id="Button1" type="button" value="Open 1" onclick="javascript:openModalDiv('Div1');" />

    <div id="Div1" title="Basic dialog" >
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
          postback test<br />
          <asp:Button ID="but_OK" runat="server" Text="Send request" /><br />
          <asp:TextBox ID="tb_send" runat="server"></asp:TextBox><br />
          <asp:Label ID="lbl_result" runat="server" Text="prova" BackColor="#ff0000"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <input id="Button2" type="button" value="cancel" onclick="javascript:closeModalDiv('Div1');" />
</div>


</asp:Content>
