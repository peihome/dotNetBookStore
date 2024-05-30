<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products Page</title>
    <link rel="stylesheet" href="../Content/style.css" />
</head>
<body>
    <h1>Products Page</h1>
    <form id="form1" runat="server" class = "form">
        <div>
            <div class="input-container ic2">
                <asp:DropDownList CssClass="input" ID="GenreList" AutoPostBack="true" runat="server" OnSelectedIndexChanged="RenderBookList">
                </asp:DropDownList>
                <label for="GenreList" class="placeholder">Please select a genre:</label>
                <asp:RequiredFieldValidator id="GenreListValidator"
                    ControlToValidate="GenreList"
                    Display="Dynamic"
                    ErrorMessage="Please select a genre!"
                    runat="server"
                    ForeColor="Red" /> 
            </div>

            <div class="input-container ic2">
                <asp:DropDownList CssClass="input" ID="BookList" AutoPostBack="true" runat="server" OnSelectedIndexChanged="HandleBookSelection">
                </asp:DropDownList>
                <label for="BookList" class="placeholder">Please select a product:</label>
                <asp:RequiredFieldValidator id="BookListValidator"
                    ControlToValidate="BookList"
                    Display="Dynamic"
                    ErrorMessage="Please select a book!"
                    runat="server"
                    ForeColor="Red" />
            </div>

            <div class="subtitle">
                <h3><asp:Label ID="Title" runat="server" Text=""></asp:Label></h3>
                <p><asp:Label ID="Description" runat="server" Text=""></asp:Label></p>
                <p><asp:Label ID="Price" runat="server" Text=""></asp:Label></p>
            </div>

            <div class="tAC">
                <asp:Image ID="BookCover" runat="server" />
            </div>

            <div class="input-container ic2">
                <asp:TextBox CssClass="input" ID="Quantity" TextMode="Number" runat="server"></asp:TextBox>
                <label for="Quantity" class="placeholder">Quantity:</label>
                <asp:RequiredFieldValidator id="quantityValidator"
                    ControlToValidate="Quantity"
                    Display="Dynamic"
                    ErrorMessage="Please enter a quantity!"
                    runat="server"
                    ForeColor="Red"
                    />

                <asp:RangeValidator ID="quantityRangeValidator" runat="server"
                    ControlToValidate="Quantity"
                    ErrorMessage="Please enter a value between 1 and 5"
                    Type="Integer"
                    MinimumValue="1"
                    MaximumValue="5"
                    ForeColor="Red"
                    />
            </div>
            <div>
                <asp:Button CssClass="submit" ID="addToCart" runat="server" Text="Add to Cart" OnClick="addToCartButton" />
                <asp:Button CssClass="submit" ID="goToCart" runat="server" Text="Go to Cart" OnClick="goToCartButton" />
            </div>
        </div>
    </form>
</body>
</html>
