﻿<%@ Page MasterPageFile="~/view/Master.Master" Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.Checkout" %>

<asp:Content ID="title" ContentPlaceHolderID="title" runat="server">
    <title>Checkout Page</title>
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContent" runat="server">
    <h1>Checkout Page</h1>
    <form id="form1" runat="server" class="form">
        <div>
            <asp:ValidationSummary ID="ValidationSummary" runat="server" 
                    ValidationGroup="form1" HeaderText="Please correct these entries :" 
                    DisplayMode="BulletList" ForeColor="Red" />
        </div>
        <div>
            <h3>Contact Information :</h3>
            <div class="input-container ic2">
                <asp:TextBox CssClass="input" ID="Email" runat="server" TextMode="Email"/>
                <label for="Email" class="placeholder">Email Address</label>
                <asp:RequiredFieldValidator ValidationGroup="form1" ID="Email_Required" runat="server" ControlToValidate="Email" ErrorMessage="Email field cannot be empty." Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ValidationGroup="form1" ID="Email_RE_Validator" runat="server" ControlToValidate="Email" ErrorMessage="Please enter a valid email address." ValidationExpression="^\S+@\S+\.\S+$" ForeColor="Red" />
            </div>

            <div class="input-container ic2">
                <asp:TextBox CssClass="input" ID="ConfirmEmail" runat="server" TextMode="Email" />
                <label for="ConfirmEmail" class="placeholder">Confirm email</label>
                <asp:RequiredFieldValidator ValidationGroup="form1" ID="ConfirmEmail_Required" runat="server" ControlToValidate="ConfirmEmail" ErrorMessage="ConfirmEmail field cannot be empty." Display="Dynamic" ForeColor="Red" />
                <asp:CompareValidator ValidationGroup="form1" ID="ConfirmEmail_Validator" runat="server" ControlToValidate="ConfirmEmail" ControlToCompare="Email" ErrorMessage="Email ids do not match." Display="Dynamic" ForeColor="Red" />
            </div>

            <div class="input-container ic2">
                <asp:TextBox CssClass="input" ID="FirstName" runat="server" TextMode="SingleLine" />
                <label for="FirstName" class="placeholder">First name</label>
                <asp:RequiredFieldValidator ValidationGroup="form1" ID="FirstName_Required" runat="server" ControlToValidate="FirstName" ErrorMessage="FirstName field cannot be empty." Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ValidationGroup="form1" ID="FirstName_Validator" runat="server" ControlToValidate="FirstName" ErrorMessage="Please enter a valid FirstName." ValidationExpression="^[a-zA-Z ,.'-]+$" Display="Dynamic" ForeColor="Red" />
            </div>

            <div class="input-container ic2">
                <asp:TextBox CssClass="input" ID="LastName" runat="server" TextMode="SingleLine" />
                <label for="LastName" class="placeholder">Last name</label>
                <asp:RequiredFieldValidator ValidationGroup="form1" ID="LastName_Required" runat="server" ControlToValidate="LastName" ErrorMessage="LastName field cannot be empty." Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ValidationGroup="form1" ID="LastName_Validator" runat="server" ControlToValidate="LastName" ErrorMessage="Please enter a valid LastName." ValidationExpression="^[a-zA-Z ,.'-]+$" Display="Dynamic" ForeColor="Red" />
            </div>

            <div class="input-container ic2">
                <asp:TextBox CssClass="input" ID="PhoneNumber" runat="server" TextMode="Phone" />
                <label for="PhoneNumber" class="placeholder">Phone number</label>
                <asp:RequiredFieldValidator ValidationGroup="form1" ID="PhoneNumber_Required" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="PhoneNumber field cannot be empty." Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ValidationGroup="form1" ID="PhoneNumber_Validator" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="Please enter a valid PhoneNumber." ValidationExpression="^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" Display="Dynamic" ForeColor="Red" />
            </div>
        </div>


        <div class="mT4em">
            <h3>Billing Address :</h3>
            <div class="input-container ic2">
                <asp:TextBox CssClass="input" ID="Address" runat="server" TextMode="SingleLine" />
                <label for="Address" class="placeholder">Address</label>
                <asp:RequiredFieldValidator ValidationGroup="form1" ID="Address_Required" runat="server" ControlToValidate="Address" ErrorMessage="Address field cannot be empty." Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ValidationGroup="form1" ID="Address_Validator" runat="server" ControlToValidate="Address" ErrorMessage="Please enter a valid Address." ValidationExpression="^\s*\S+(?:\s+\S+){2}" Display="Dynamic" ForeColor="Red" />

            </div>

            <div class="input-container ic2">
                <asp:TextBox CssClass="input" ID="City" runat="server" TextMode="SingleLine" />
                <label for="City" class="placeholder">City</label>
                <asp:RequiredFieldValidator ValidationGroup="form1" ID="City_Required" runat="server" ControlToValidate="City" ErrorMessage="City field cannot be empty." Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ValidationGroup="form1" ID="City_Validator" runat="server" ControlToValidate="City" ErrorMessage="Please enter a valid City." ValidationExpression="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$" Display="Dynamic" ForeColor="Red" />

            </div>

            <div class="input-container ic2">
                <asp:DropDownList CssClass="input" ID="State" runat="server" />
                <label for="State" class="placeholder">State</label>
                <asp:RequiredFieldValidator ValidationGroup="form1" ID="State_Required" runat="server" ControlToValidate="State" ErrorMessage="State field cannot be empty." Display="Dynamic" ForeColor="Red" />

            </div>

            <div class="input-container ic2">
                <asp:TextBox CssClass="input" ID="ZipCode" runat="server" TextMode="SingleLine" />
                <label for="ZipCode" class="placeholder">Zip code</label>
                <asp:RequiredFieldValidator ValidationGroup="form1" ID="ZipCode_Required" runat="server" ControlToValidate="ZipCode" ErrorMessage="ZipCode field cannot be empty." Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ValidationGroup="form1" ID="ZipCode_Validator" runat="server" ControlToValidate="ZipCode" ErrorMessage="Please enter a valid ZipCode." ValidationExpression="^[A-Z]\d[A-Z] ?\d[A-Z]\d$" Display="Dynamic" ForeColor="Red" />

            </div>
        </div>
        <div class="mT4em">
            <h3>Optional Data :</h3>
            <div>
                <h4>Please let me know about : </h4>
                <asp:Panel ID="Subscription" runat="server">
                    <asp:CheckBox ID="NewProducts" runat="server" Text="New Products" />
                    <asp:CheckBox ID="SpecialOffers" runat="server" Text="Special Offers" />
                    <asp:CheckBox ID="NewEditions" runat="server" Text="New Editions" />
                    <asp:CheckBox ID="LocalEvents" runat="server" Text="Local Events" />
                </asp:Panel>
                
            </div>
            <div class="contact">
                <h4>Please contact me via :</h4>
                 <asp:RadioButton ID="Twitter" runat="server" GroupName="Contact" Text="Twitter" />

                 <asp:RadioButton ID="Facebook" runat="server" GroupName="Contact" Text="Facebook" />

                 <asp:RadioButton ID="TextMessage" runat="server" GroupName="Contact" Text="Text Message" />

                 <asp:RadioButton ID="Email_Contact" runat="server" GroupName="Contact" Text="Email" />

            </div>
            <div>
                <asp:Button CssClass="submit" ValidationGroup="form1" ID="CheckOut" runat="server" Text="Check Out" OnClick="CheckOut_Click" />
                <asp:Button CssClass="submit" ValidationGroup="form1" ID="CancelOrder" runat="server" Text="Cancel Order" OnClick="CancelOrder_Click" />
                <asp:HyperLink CssClass="continueShopping" ID="ContinueShopping" runat="server" NavigateUrl="/Products" Text="Continue Shopping" />
            </div>
        </div>
    </form>
</asp:Content>