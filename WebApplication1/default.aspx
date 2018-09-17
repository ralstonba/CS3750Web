<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function validateForm(btn) {
            var apple, orange, pear, grape;
            apple = document.getElementById("Apple").checked;
            orange = document.getElementById("Orange").checked;
            pear = document.getElementById("Pear").checked;
            grape = document.getElementById("Grape").checked;
            if (!(apple || orange || pear || grape)) {
                alert("Please select a checkbox");
                return false;
            }            
            __doPostBack(btn.name, "");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        Name <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <div>
            <asp:CheckBox ID="Apple" runat="server" Text="Apple" /><br />
            <asp:CheckBox ID="Orange" runat="server" Text="Orange" /><br />
            <asp:CheckBox ID="Pear" runat="server" Text="Pear" /><br />
            <asp:CheckBox ID="Grape" runat="server" Text="Grape" /><br />
        </div>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClientClick="validateForm(this); return false;" OnClick="Button1_Click" /><br />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
