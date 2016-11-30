<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="AddPatron.aspx.vb" Inherits="Library_AddPatron" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style2
        {
            height: 21px;
        }
        .style1
        {
            width: 203px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Label ID="TitleLabel" runat="server" Font-Size="X-Large" Text="Add Patron" Font-Bold="True"></asp:Label>
    <br />
    <asp:CreateUserWizard ID="CreateUserWizard" runat="server" Width="444px" LoginCreatedUser="False">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server">
                <ContentTemplate>
                    <table style="font-size: 100%; width: 444px;">
                        <tr>
                            <td align="center" colspan="2">
                                Add New Patron Account
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                    ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                    ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                    ErrorMessage="Security question is required." ToolTip="Security question is required."
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                    ErrorMessage="Security answer is required." ToolTip="Security answer is required."
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style2">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style2">
                                Full Name:
                            </td>
                            <td>
                                <asp:TextBox ID="FullNameTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="FullNameValidator" runat="server" ControlToValidate="FullNameTextbox"
                                    ErrorMessage="Full Name is required." ForeColor="Red" ToolTip="Full Name is required."
                                    ValidationGroup="CreateUserWizard">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                Address:
                            </td>
                            <td>
                                <asp:TextBox ID="AddressTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AddressRequired" runat="server" ControlToValidate="AddressTextbox"
                                    ErrorMessage="Address is required." ToolTip="Address is required." ValidationGroup="CreateUserWizard"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                City:
                            </td>
                            <td>
                                <asp:TextBox ID="CityTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="CityRequired" runat="server" ControlToValidate="CityTextbox"
                                    ErrorMessage="City is required." ToolTip="City is required." ValidationGroup="CreateUserWizard"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                State:
                            </td>
                            <td>
                                <asp:TextBox ID="StateTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="StateRequired" runat="server" ControlToValidate="StateTextbox"
                                    ErrorMessage="State is required." ToolTip="State is required." ValidationGroup="CreateUserWizard"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                Country:
                            </td>
                            <td>
                                <asp:TextBox ID="CountryTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="CountryRequired" runat="server" ControlToValidate="CountryTextbox"
                                    ErrorMessage="Country is required." ToolTip="Country is required." ValidationGroup="CreateUserWizard"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                Zip:
                            </td>
                            <td>
                                <asp:TextBox ID="ZipTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ZipRequired" runat="server" ControlToValidate="ZipTextbox"
                                    ErrorMessage="Zip code is required." ToolTip="Zip code is required." ValidationGroup="CreateUserWizard"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                Phone:
                            </td>
                            <td>
                                <asp:TextBox ID="PhoneTextbox" runat="server" Width="150px" TextMode="Phone"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ControlToValidate="PhoneTextbox"
                                    ErrorMessage="Phone number is required." ToolTip="Phone number is required."
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                    ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                    ValidationGroup="CreateUserWizard"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color: Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server">
                <ContentTemplate>
                    <table style="font-size: 100%; width: 444px;">
                        <tr>
                            <td align="center">
                                Complete
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Your account has been successfully created.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Your library card number is
                                <asp:Label ID="LibraryCardLabel" runat="server" Text="Label"></asp:Label>
                                .
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                    Text="Continue" ValidationGroup="CreateUserWizard" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    <asp:SqlDataSource ID="LinkLibraryPatronDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        DeleteCommand="DELETE FROM [LinkLibraryPatron] WHERE [LibraryCard] = @LibraryCard"
        InsertCommand="INSERT INTO [LinkLibraryPatron] ([LibraryID], [PatronID]) VALUES (@LibraryID, @PatronID); SET @PK = SCOPE_IDENTITY()"
        SelectCommand="SELECT * FROM [LinkLibraryPatron]" UpdateCommand="UPDATE [LinkLibraryPatron] SET [LibraryID] = @LibraryID, [PatronID] = @PatronID WHERE [LibraryCard] = @LibraryCard">
        <DeleteParameters>
            <asp:Parameter Name="LibraryCard" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LibraryID" DbType="Guid" />
            <asp:Parameter Name="PatronID" DbType="Guid" />
            <asp:Parameter DbType="Int32" Direction="Output" Name="PK" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LibraryID" Type="Object" />
            <asp:Parameter Name="PatronID" Type="Object" />
            <asp:Parameter Name="LibraryCard" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
