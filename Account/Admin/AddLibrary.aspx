<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="AddLibrary.aspx.vb" Inherits="Account_AddLibrary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 203px;
        }
        .style2
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Register Library"></asp:Label>
    <asp:CreateUserWizard ID="CreateUserWizard" runat="server" Width="444px" 
        LoginCreatedUser="False">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server">
                <ContentTemplate>
                    <table style="font-size: 100%; width: 444px;">
                        <tr>
                            <td align="center" colspan="2">
                                Sign Up for Your New Account
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="User Name is required." ToolTip="User Name is required." 
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="Password is required." 
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                    ErrorMessage="E-mail is required." ToolTip="E-mail is required." 
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                Library Name:</td>
                            <td>
                                <asp:TextBox ID="LibraryNameTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="LibraryNameValidator" runat="server" 
                                    ControlToValidate="LibraryNameTextbox" ErrorMessage="Library Name is required." 
                                    ForeColor="Red" ToolTip="Library Name is required." 
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
                                    ErrorMessage="Address is required." ToolTip="Address is required." 
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                City:
                            </td>
                            <td>
                                <asp:TextBox ID="CityTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="CityRequired" runat="server" ControlToValidate="CityTextbox"
                                    ErrorMessage="City is required." ToolTip="City is required." 
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                State:
                            </td>
                            <td>
                                <asp:TextBox ID="StateTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="StateRequired" runat="server" ControlToValidate="StateTextbox"
                                    ErrorMessage="State is required." ToolTip="State is required." 
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                Country:
                            </td>
                            <td>
                                <asp:TextBox ID="CountryTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="CountryRequired" runat="server" ControlToValidate="CountryTextbox"
                                    ErrorMessage="Country is required." ToolTip="Country is required." 
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                Zip:
                            </td>
                            <td>
                                <asp:TextBox ID="ZipTextbox" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ZipRequired" runat="server" ControlToValidate="ZipTextbox"
                                    ErrorMessage="Zip code is required." ToolTip="Zip code is required." 
                                    ValidationGroup="CreateUserWizard" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                            <td align="right" class="style1">
                                Website:
                            </td>
                            <td>
                                <asp:TextBox ID="WebsiteTextbox" runat="server" Width="150px" TextMode="Url"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="WebsiteRequired" runat="server" ControlToValidate="WebsiteTextbox"
                                    ErrorMessage="Website is required." ToolTip="Website is required." 
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
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
