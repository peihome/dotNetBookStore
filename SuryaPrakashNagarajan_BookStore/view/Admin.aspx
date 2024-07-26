<%@ Page Title="" Language="C#" MasterPageFile="~/view/Master.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SuryaPrakashNagarajan_BookStore.view.Admin" %>
<asp:Content ID="title" ContentPlaceHolderID="title" runat="server">
    <title>Admin Page</title>
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContent" runat="server">
    <h1>Admin Page</h1>
    <form id="form1" runat="server" class="form adminForm">

        <div class="input-container ic2">
            <asp:DropDownList CssClass="input" ID="Genres" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Genres_HandleGenreChange">
            </asp:DropDownList>
            <asp:label for="Genres" ID="GenresLabel" class="placeholder" runat="server">Please select a genre:</asp:label>
            <asp:RequiredFieldValidator id="GenreListValidator"
                ControlToValidate="Genres"
                Display="Dynamic"
                ErrorMessage="Please select a genre!"
                runat="server"
                ForeColor="Red" /> 
        </div>

        <div>
            <asp:GridView Visible="false" ID="BooksGridView" runat="server" AutoGenerateColumns="True" AllowPaging="True" PageSize="10" 
                DataKeyNames="Id"
                AutoGenerateSelectButton="True"
                OnSelectedIndexChanged="BooksGridView_SelectedIndexChanged"
                OnPageIndexChanging="BooksGridView_HandlePageChange">
            </asp:GridView>
        </div>

        <div>
            <asp:Label Visible="false" ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>
            <asp:GridView Visible="false" ID="GenresGridView" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="Id" OnRowEditing="GenresGridView_RowEditing" 
                OnRowUpdating="GenresGridView_RowUpdating" OnRowCancelingEdit="GenresGridView_RowCancelingEdit" 
                OnRowDeleting="GenresGridView_RowDeleting" ShowFooter="True" OnRowCommand="GenresGridView_RowCommand"
                >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Genre ID" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Genre Name">
                        <ItemTemplate>
                            <%# Eval("Name") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditGenreName" runat="server" Text='<%# Bind("Name") %>' ValidationGroup="EditValidation" />
                            <asp:RequiredFieldValidator ID="txtEditGenreName_Validator" runat="server" 
                                ControlToValidate="txtEditGenreName" 
                                Display="Dynamic"
                                ErrorMessage="Genre name cannot be empty!"
                                ForeColor="Red" 
                                ValidationGroup="EditValidation" />
                            <asp:RegularExpressionValidator ID="txtEditGenreName_RE_Validator" runat="server" 
                                ControlToValidate="txtEditGenreName" 
                                Display="Dynamic"
                                ErrorMessage="Genre name can only contain letters."
                                ValidationExpression="^[a-zA-Z ]+$"
                                ForeColor="Red"
                                ValidationGroup="EditValidation" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ValidationGroup="EditValidation" />
                    <asp:TemplateField>
                        <FooterTemplate>
                            <tr>
                                <td colspan="5" style="padding:0">
                                    <div class="input-container ic2 customInput">
                                        <asp:TextBox CssClass="input" ID="txtNewGenreName" runat="server" ValidationGroup="FooterValidation" />
                                        <label for="txtNewGenreName" class="placeholder">Genre Name</label>
                                        <asp:RequiredFieldValidator id="txtNewGenreName_Validator"
                                            ControlToValidate="txtNewGenreName"
                                            Display="Dynamic"
                                            ErrorMessage="Genre name cannot be empty!"
                                            runat="server"
                                            ForeColor="Red"
                                            ValidationGroup="FooterValidation" /> 
                                        <asp:RegularExpressionValidator ID="txtNewGenreName_RE_Validator" runat="server" 
                                            ControlToValidate="txtNewGenreName" 
                                            ErrorMessage="Genre name can only contain letters." 
                                            ValidationExpression="^[a-zA-Z ]+$" 
                                            ForeColor="Red"
                                            ValidationGroup="FooterValidation" />
                                    </div>
                                    <div>
                                        <asp:Button CssClass="submit" ID="btnAddGenre" runat="server" CommandName="AddNew" Text="Add New" ValidationGroup="FooterValidation" />
                                    </div>
                                </td>
                            </tr>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- DetailsView - initially hidden -->
        <div>
           <asp:DetailsView ID="BookDetailsView" runat="server" AutoGenerateRows="False" 
                DefaultMode="ReadOnly" DataKeyNames="Id" 
                OnItemUpdating="BookDetailsView_ItemUpdating" 
                OnItemDeleting="BookDetailsView_ItemDeleting"
                OnItemInserting="BookDetailsView_ItemInserting"
                OnModeChanging="BookDetailsView_ModeChanging"
                OnItemCreated="BookDetailsView_ItemCreated"
                >
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Book ID" ReadOnly="True" InsertVisible="False" />
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <%# Eval("Name") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' />
                            <asp:RequiredFieldValidator id="txtName_Validator"
                                ControlToValidate="txtName"
                                Display="Dynamic"
                                ErrorMessage="Name cannot be empty!"
                                runat="server"
                                ForeColor="Red"
                                /> 
                            <asp:RegularExpressionValidator ID="txtNamee_RE_Validator" runat="server" 
                                ControlToValidate="txtName" 
                                ErrorMessage="Name can only contain letters." 
                                ValidationExpression="^[a-zA-Z' ]+$" 
                                ForeColor="Red"
                                />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" />
                            <asp:RequiredFieldValidator id="TextBox1_Validator"
                                ControlToValidate="TextBox1"
                                Display="Dynamic"
                                ErrorMessage="Name cannot be empty!"
                                runat="server"
                                ForeColor="Red"
                                /> 
                            <asp:RegularExpressionValidator ID="TextBox1_RE_Validator" runat="server" 
                                ControlToValidate="TextBox1" 
                                ErrorMessage="Name can only contain letters." 
                                ValidationExpression="^[a-zA-Z' ]+$" 
                                ForeColor="Red"
                                />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <%# Eval("Description") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' />
                            <asp:RequiredFieldValidator id="txtDescription_Validator"
                                ControlToValidate="txtDescription"
                                Display="Dynamic"
                                ErrorMessage="Description cannot be empty!"
                                runat="server"
                                ForeColor="Red"
                                />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" />
                            <asp:RequiredFieldValidator id="TextBox2_Validator"
                                ControlToValidate="TextBox2"
                                Display="Dynamic"
                                ErrorMessage="Description cannot be empty!"
                                runat="server"
                                ForeColor="Red"
                                />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <%# Eval("Price") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrice" runat="server" Type="Number" Text='<%# Bind("Price") %>' />
                            <asp:RequiredFieldValidator id="txtPrice_Validator"
                                ControlToValidate="txtPrice"
                                Display="Dynamic"
                                ErrorMessage="Price cannot be empty!"
                                runat="server"
                                ForeColor="Red"
                                />
                            <asp:RegularExpressionValidator ID="txtPrice_RE_Validator" runat="server" 
                                ControlToValidate="txtPrice" 
                                ErrorMessage="Price can only contain numbers." 
                                ValidationExpression="^\d+(\.\d{1,2})?$" 
                                ForeColor="Red"
                                />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Type="Number" />
                            <asp:RequiredFieldValidator id="TextBox3_Validator"
                                ControlToValidate="TextBox3"
                                Display="Dynamic"
                                ErrorMessage="Price cannot be empty!"
                                runat="server"
                                ForeColor="Red"
                                />
                            <asp:RegularExpressionValidator ID="TextBox3_RE_Validator" runat="server" 
                                ControlToValidate="TextBox3" 
                                ErrorMessage="Price can only contain numbers." 
                                ValidationExpression="^\d+(\.\d{1,2})?$" 
                                ForeColor="Red"
                                />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Genre">
                        <ItemTemplate>
                            <%# Eval("Genre_Name") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlGenre" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlGenreInsert" runat="server"></asp:DropDownList>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </div>

        <div>
            <asp:Button CssClass="submit" ID="editGenres" runat="server" Text="Edit Genres" OnClick="showEditGenres" />
            <asp:Button CssClass="submit secondary" Visible="false" ID="CancelBtn" runat="server" Text="Back" OnClick="handleCancelEdit" CausesValidation="false" />
        </div>
    </form>
</asp:Content>