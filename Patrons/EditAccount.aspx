<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="EditAccount.aspx.vb" Inherits="Patrons_EditAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="SavedLabel" runat="server" Font-Bold="True" Font-Size="Large" 
        Text="Profile Saved." Visible="False"></asp:Label>
    <br />
    <table>
        <tr>
            <td align="right" class="style1">
                &nbsp;</td>
            <td>
                <asp:Label ID="LibraryNameLabel" runat="server" Text="LibraryName"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                &nbsp;</td>
            <td>
                <asp:Label ID="NameLabel" runat="server" Text="Name"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                &nbsp;</td>
            <td>
                <asp:Label ID="CardNumberLabel" runat="server" Text="CardNumber"></asp:Label>
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
                <asp:TextBox ID="PhoneTextbox" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                    
                    SelectCommand="SELECT LibraryID, LibraryCard FROM LinkLibraryPatron WHERE (PatronID = @PatronID)">
                    <SelectParameters>
                        <asp:Parameter Name="PatronID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
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

