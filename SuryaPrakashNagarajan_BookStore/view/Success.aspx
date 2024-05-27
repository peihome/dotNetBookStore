<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.Success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Your order has been placed! <br />
            Click <asp:HyperLink ID="Here" runat="server" NavigateUrl="/view/Products.aspx" Text="here" /> to go back to Products Page.
        </div>
    </form>
</body>
</html>
