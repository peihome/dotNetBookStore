<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <span>Please select a genre:</span>
                <asp:DropDownList ID="GenreList" AutoPostBack="true" runat="server" OnSelectedIndexChanged="RenderBookList">
                </asp:DropDownList>
                <asp:RequiredFieldValidator id="GenreListValidator"
                    ControlToValidate="GenreList"
                    Display="Dynamic"
                    ErrorMessage="Please select a genre!"
                    runat="server"
                    ForeColor="Red" /> 
            </div>

            <div>
                <span>Please select a product:</span>
                <asp:DropDownList ID="BookList" AutoPostBack="true" runat="server" OnSelectedIndexChanged="HandleBookSelection">
                </asp:DropDownList>
                <asp:RequiredFieldValidator id="BookListValidator"
                    ControlToValidate="BookList"
                    Display="Dynamic"
                    ErrorMessage="Please select a book!"
                    runat="server"
                    ForeColor="Red" />
            </div>

            <div>
                <h3><asp:Label ID="Title" runat="server" Text=""></asp:Label></h3>
                <p><asp:Label ID="Description" runat="server" Text=""></asp:Label></p>
                <p><asp:Label ID="Price" runat="server" Text=""></asp:Label></p>
            </div>

            <div>
                <asp:Image ID="BookCover" runat="server" />
            </div>

            <div>
                <span>Quantity:</span>
                <asp:TextBox ID="Quantity" TextMode="Number" runat="server"></asp:TextBox>
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
                <asp:Button ID="addToCart" runat="server" Text="Add to Cart" OnClick="addToCartButton" />
                <asp:Button ID="goToCart" runat="server" Text="Go to Cart" OnClick="goToCartButton" />
            </div>
        </div>
    </form>
</body>
</html>
