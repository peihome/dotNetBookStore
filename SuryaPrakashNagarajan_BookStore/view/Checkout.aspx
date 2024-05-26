<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Checkout Page</h1>
    <form id="form1" runat="server">
        <div>
            <h3>Contact Information</h3>
            <div>
                <span>Email Address :</span>
                <asp:TextBox ID="Email" runat="server" TextMode="Email" placeholder="Enter your email" />
                <asp:RequiredFieldValidator ID="Email_Required" runat="server" ControlToValidate="Email" ErrorMessage="Email field cannot be empty." Display="Dynamic" ForeColor="Red" />
            </div>

            <div>
                <span>Email Re-entry :</span>
                <asp:TextBox ID="ConfirmEmail" runat="server" TextMode="Email" placeholder="Re-enter your email" />
                <asp:RequiredFieldValidator ID="ConfirmEmail_Required" runat="server" ControlToValidate="ConfirmEmail" ErrorMessage="ConfirmEmail field cannot be empty." Display="Dynamic" ForeColor="Red" />

            </div>

            <div>
                <span>First Name :</span>
                <asp:TextBox ID="FirstName" runat="server" TextMode="SingleLine" placeholder="Enter your first name" />
                <asp:RequiredFieldValidator ID="FirstName_Required" runat="server" ControlToValidate="FirstName" ErrorMessage="FirstName field cannot be empty." Display="Dynamic" ForeColor="Red" />

            </div>

            <div>
                <span>Last Name :</span>
                <asp:TextBox ID="LastName" runat="server" TextMode="SingleLine" placeholder="Enter your last name" />
                <asp:RequiredFieldValidator ID="LastName_Required" runat="server" ControlToValidate="LastName" ErrorMessage="LastName field cannot be empty." Display="Dynamic" ForeColor="Red" />

            </div>

            <div>
                <span>Phone Number :</span>
                <asp:TextBox ID="PhoneNumber" runat="server" TextMode="Phone" placeholder="Enter your phone number" />
                <asp:RequiredFieldValidator ID="PhoneNumber_Required" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="PhoneNumber field cannot be empty." Display="Dynamic" ForeColor="Red" />

            </div>
        </div>


        <div>
            <h3>Billing Address</h3>
            <div>
                <span>Address :</span>
                <asp:TextBox ID="Address" runat="server" TextMode="SingleLine" placeholder="Enter your address" />
                <asp:RequiredFieldValidator ID="Address_Required" runat="server" ControlToValidate="Address" ErrorMessage="Address field cannot be empty." Display="Dynamic" ForeColor="Red" />

            </div>

            <div>
                <span>City :</span>
                <asp:TextBox ID="City" runat="server" TextMode="SingleLine" placeholder="Enter your city" />
                <asp:RequiredFieldValidator ID="City_Required" runat="server" ControlToValidate="City" ErrorMessage="City field cannot be empty." Display="Dynamic" ForeColor="Red" />

            </div>

            <div>
                <span>State :</span>
                <asp:DropDownList ID="State" runat="server" placeholder="Choose your state" />
                <asp:RequiredFieldValidator ID="State_Required" runat="server" ControlToValidate="State" ErrorMessage="State field cannot be empty." Display="Dynamic" ForeColor="Red" />

            </div>

            <div>
                <span>Zip Code :</span>
                <asp:TextBox ID="ZipCode" runat="server" TextMode="SingleLine" placeholder="Enter your zip code" />
                <asp:RequiredFieldValidator ID="ZipCode_Required" runat="server" ControlToValidate="ZipCode" ErrorMessage="ZipCode field cannot be empty." Display="Dynamic" ForeColor="Red" />

            </div>
        </div>
        <div>
            <h3>Optional Data</h3>
            <div>
                <h4>Please let me know about : </h4>
                <asp:Panel ID="Subscription" runat="server">
                    <asp:CheckBox ID="NewProducts" runat="server" Text="New Products" />
                    <asp:CheckBox ID="SpecialOffers" runat="server" Text="Special Offers" />
                    <asp:CheckBox ID="NewEditions" runat="server" Text="New Editions" />
                    <asp:CheckBox ID="LocalEvents" runat="server" Text="Local Events" />
                </asp:Panel>
                <asp:RequiredFieldValidator ID="Subscription_Required" runat="server" ControlToValidate="Subscription" ErrorMessage="Subscription field cannot be empty." Display="Dynamic" ForeColor="Red" />
            </div>
            <div>
                <h4>Please contact me via :</h4>
                 <asp:RadioButton ID="Twitter" runat="server" GroupName="Contact" Text="Twitter" />
                 <asp:RequiredFieldValidator ID="Twitter_Required" runat="server" ControlToValidate="Twitter" ErrorMessage="Twitter field cannot be empty." Display="Dynamic" ForeColor="Red" />

                 <asp:RadioButton ID="Facebook" runat="server" GroupName="Contact" Text="Facebook" />
                 <asp:RequiredFieldValidator ID="Facebook_Required" runat="server" ControlToValidate="Facebook" ErrorMessage="Facebook field cannot be empty." Display="Dynamic" ForeColor="Red" />

                 <asp:RadioButton ID="TextMessage" runat="server" GroupName="Contact" Text="Text Message" />
                 <asp:RequiredFieldValidator ID="TextMessage_Required" runat="server" ControlToValidate="TextMessage" ErrorMessage="TextMessage field cannot be empty." Display="Dynamic" ForeColor="Red" />

                 <asp:RadioButton ID="Email_Contact" runat="server" GroupName="Contact" Text="Email" />
                 <asp:RequiredFieldValidator ID="Email_Contact_Required" runat="server" ControlToValidate="Email_Contact" ErrorMessage="Email_Contact field cannot be empty." Display="Dynamic" ForeColor="Red" />

            </div>
            <div>
                <asp:Button ID="CheckOut" runat="server" Text="Check Out" OnClick="CheckOut_Click" />
                <asp:Button ID="CancelOrder" runat="server" Text="Cancel Order" OnClick="CancelOrder_Click" />
                <asp:HyperLink ID="ContinueShopping" runat="server" NavigateUrl="/view/Products.aspx" Text="Continue Shopping" />
            </div>
        </div>
    </form>
</body>
</html>