<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Your shopping cart</h1>
            <asp:ListBox ID="CartList" runat="server" SelectionMode="Multiple">
            </asp:ListBox>

            <asp:Button ID="RemoveItem" runat="server" Text="Remove item" OnClick="RemoveItem_Click" />
            <asp:Button ID="EmptyCart" runat="server" Text="Empty Cart" OnClick="EmptyCart_Click" /> 
            
            <asp:Button ID="ContinueShopping" runat="server" Text="Continue Shopping" OnClick="ContinueShopping_Click" />
            <asp:Button ID="CheckOut" runat="server" Text="Check Out" OnClick="CheckOut_Click" />
        </div>
    </form>
</body>
</html>
