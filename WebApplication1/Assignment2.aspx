<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Assignment2.aspx.cs" Inherits="WebApplication1.Assignment2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="radio" id="rbTrue" name="userSelection" required /><label for="rbTrue">True</label><br /> 
            <input type="radio" id="rbFalse" name="userSelection" required /><label for="rbFalse">False</label><br />
            <asp:Button ID="Button1" runat="server" Text="Submit" /> <%--OnClientClick="validateForm(this); return false;" OnClick="Button1_Click" />--%>
        </div>
    </form>
</body>
</html>
