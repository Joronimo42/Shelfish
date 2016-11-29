<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="EditAccount.aspx.vb" Inherits="Library_EditAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    
    <asp:Label ID="TitleLabel" runat="server" Font-Size="X-Large" 
        Text="Edit Account" Font-Bold="True"></asp:Label>
    
    <br />
    <asp:Label ID="SavedLabel" runat="server" Font-Bold="True" Font-Size="Large" 
        Text="Profile Saved." Visible="False"></asp:Label>
    <br />
    <table>
        <tr>
            <td align="right" class="style1">
                Library Name:</td>
            <td>
                <asp:TextBox ID="LibraryNameTextbox" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                Address:
            </td>
            <td>
                <asp:TextBox ID="AddressTextbox" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                City:
            </td>
            <td>
                <asp:TextBox ID="CityTextbox" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                State:
            </td>
            <td>
                <asp:TextBox ID="StateTextbox" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                Country:
            </td>
            <td>
                <asp:TextBox ID="CountryTextbox" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                Zip:
            </td>
            <td>
                <asp:TextBox ID="ZipTextbox" runat="server" Width="150px"></asp:TextBox>
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
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                Website:
            </td>
            <td>
                <asp:TextBox ID="WebsiteTextbox" runat="server" Width="150px" TextMode="Url"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style1">
                &nbsp;</td>
            <td>
                <asp:Button ID="SaveButton" runat="server" Text="Save" />
            </td>
        </tr>
    </table>
</asp:Content>
