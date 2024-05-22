<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span>Please select a product:</span>
            <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ProductsList_RenderProductDetails">
            </asp:DropDownList>

            <div>
                <h3><asp:Label ID="title" runat="server" Text=""></asp:Label></h3>
                <p><asp:Label ID="description" runat="server" Text=""></asp:Label></p>
                <p><asp:Label ID="price" runat="server" Text=""></asp:Label></p>
            </div>

            <div>
                <span>Quantity:</span>
                <asp:TextBox ID="quantity" TextMode="Number" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="addToCart" runat="server" Text="Add to Cart" OnClick="addToCartButton" />
                <asp:Button ID="goToCart" runat="server" Text="Go to Cart" OnClick="goToCartButton" />
            </div>
        </div>
    </form>
</body>
</html>
