<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.Success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Success Page</title>
    <link rel="stylesheet" href="../Content/style.css" />
</head>
<body class="successBody">
    <form id="form1" runat="server" class="form">
        <h2>
            Your order has been placed! <br />
            Click <asp:HyperLink CssClass="bgB" ID="Here" runat="server" NavigateUrl="/view/Products.aspx" Text="here" /> to go back to Products Page.
        </h2>
    </form>
</body>
</html>
