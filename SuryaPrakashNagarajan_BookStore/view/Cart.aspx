<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cart Page</title>
    <link rel="stylesheet" href="../Content/style.css" />
</head>
<body>
    <h1>Cart Page</h1>
    <form id="form1" runat="server" class="form cartForm">
        <div>
            <h2>Your shopping cart :</h2>
            <div class="cartArea">
                <div>
                    <asp:ListBox CssClass="input" ID="CartList" runat="server" SelectionMode="Multiple">
                    </asp:ListBox>
                </div>

                <div>
                    <asp:Button CssClass="submit" ID="RemoveItem" runat="server" Text="Remove item" OnClick="RemoveItem_Click" />
                    <asp:Button CssClass="submit" ID="EmptyCart" runat="server" Text="Empty Cart" OnClick="EmptyCart_Click" /> 
                </div>
            </div>

            <div class="checkoutArea">
                <asp:Button CssClass="submit" ID="ContinueShopping" runat="server" Text="Continue Shopping" OnClick="ContinueShopping_Click" />
                <asp:Button CssClass="submit" ID="CheckOut" runat="server" Text="Check Out" OnClick="CheckOut_Click" />
            </div>
        </div>
    </form>
</body>
</html>
