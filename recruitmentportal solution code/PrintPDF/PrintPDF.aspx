<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintPDF.aspx.cs" Inherits="PrintPDF.PrintPDF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <img src = "https://www.google.co.in/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwi89azl1OfSAhXMN48KHftIDAYQjRwIBQ&url=http%3A%2F%2Fwww.cloudlinktech.com%2Fdata-security-products%2Fsecure-vm%2F&psig=AFQjCNHjYXgL_ejuZmSyxlOh5TtrwuTWSg&ust=1490187935008010" /><br />
    </div>
    <div style = "font-family:Arial">This is a test page</div>
    <div>
    <table border = "1" width = "100">
    <tr><td>Name</td><td>Age</td></tr>
    <tr><td>John</td><td>11</td></tr>
    <tr><td>Sam</td><td>13</td></tr>
    <tr><td>Tony</td><td>12</td></tr>
    </table>
    </div>
    <div>
    <asp:Button ID="btnExport" runat="server" Text="Export" onclick="btnExport_Click" /></div>
</form>
</body>
</html>
