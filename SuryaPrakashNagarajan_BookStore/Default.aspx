<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link rel="stylesheet" href="/Content/style.css" />
</head>
<body>
    <h1>Home Page</h1>
    <form id="form1" runat="server" class="form">
        <div>
            <h2>Choose an option :</h2>
            <nav>
                <ul class="navContainer">
                    <li><a class="continueShopping" href="Default.aspx">Home</a></li>
                    <li><a class="continueShopping" href="view/Products.aspx">Products</a></li>
                    <li><a class="continueShopping" href="view/Cart.aspx">Cart</a></li>
                </ul>
            </nav>
        </div>
    </form>
</body>
</html>
