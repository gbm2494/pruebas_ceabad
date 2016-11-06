<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PruebaWebForms.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
     <script type = "text/javascript">

        function removeHeader()

        {
            document.getElementById("aNav").className =
                document.getElementById("aNav").className.replace(/\bmyNav\b/, '');

            document.getElementById("imgHeader").style.display = "none";
            document.getElementById("regPers").style.fontSize = "1em";
            document.getElementById("regEmp").style.fontSize = "1em";

        }
        removeHeader();
    </script> 
</asp:Content>
