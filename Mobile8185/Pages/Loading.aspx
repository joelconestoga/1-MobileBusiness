<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Loading.aspx.cs" Inherits="Pages_Loading" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ninja Mobile</title>

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

    <script type="text/javascript">

        var myVar;

        function myFunction() {
            myVar = setTimeout(showPage, 3000);
        }

        function showPage() {
            document.getElementById("loader").style.display = "none";

            $("#btnShowPopup").click();
            //document.getElementById("wait_for_loader").style.display = "block";
        }
    </script>

	<link rel="shortcut icon" type="image/x-icon" href="~/favicon.ico" />
    <link rel="stylesheet" href="~/Content/bootstrap-slate.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="~/Content/style.css" type="text/css" media="screen" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="loader"></div>
        <asp:Button ID="btnShowPopup" style="display: none;" runat="server" OnClick="Load_Home_Click" Text="" />
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
