<%@ Page Language="C#" MasterPageFile="~/view/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>Login Page</title>
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContent" runat="server">
    <h1>Login Page</h1>
    <form id="form1" runat="server" class = "form">
        <div class="input-container ic2">
            <asp:TextBox CssClass="input" ID="FirstName" runat="server" TextMode="SingleLine"/>
            <label for="FirstName" class="placeholder">First Name</label>
            <asp:RequiredFieldValidator ID="FirstName_Required" runat="server" ControlToValidate="FirstName" ErrorMessage="FirstName cannot be empty." Display="Dynamic" ForeColor="Red" />
            <asp:RegularExpressionValidator ID="FirstName_RE_Validator" runat="server" ControlToValidate="FirstName" ErrorMessage="First name can only contain letters." ValidationExpression="^[a-zA-Z ]+$" ForeColor="Red" />
        </div>

        <div class="input-container ic2">
            <asp:TextBox CssClass="input" ID="LastName" runat="server" TextMode="SingleLine"/>
            <label for="LastName" class="placeholder">Last Name</label>
            <asp:RequiredFieldValidator ID="LastName_Required" runat="server" ControlToValidate="LastName" ErrorMessage="LastName cannot be empty." Display="Dynamic" ForeColor="Red" />
            <asp:RegularExpressionValidator ID="LastName_RE_Validator" runat="server" ControlToValidate="LastName" ErrorMessage="Last name can only contain letters." ValidationExpression="^[a-zA-Z ]+$" ForeColor="Red" />
        </div>

        <div>
            <asp:Button CssClass="submit" ID="Submit" runat="server" Text="Submit" OnClick="handleSubmit" />
        </div>
    </form>
</asp:Content>