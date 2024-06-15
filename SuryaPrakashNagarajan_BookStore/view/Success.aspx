<%@ Page MasterPageFile="~/view/Master.Master" Language="C#" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.Success" %>

<asp:Content ID="title" ContentPlaceHolderID="title" runat="server">
    <title>Success Page</title>
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContent" runat="server">
    <form id="form1" runat="server" class="form">
        <h2>
            Your order has been placed! <br />
            Click <asp:HyperLink CssClass="bgB" ID="Here" runat="server" NavigateUrl="/Products" Text="here" /> to go back to Products Page.
        </h2>
    </form>
</asp:Content>
