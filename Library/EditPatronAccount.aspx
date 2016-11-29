<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="EditPatronAccount.aspx.vb" Inherits="Library_EditPatronAccount" %>

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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style1">
                Late Fees:</td>
            <td>
                <asp:TextBox ID="LateFeesTextbox" runat="server" Width="150px" 
                    TextMode="Number"></asp:TextBox>
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
                <asp:TextBox ID="ZipTextbox" runat="server" Width="150px" TextMode="Number"></asp:TextBox>
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
    <asp:SqlDataSource ID="LinkLibraryPatronDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM [LinkLibraryPatron] WHERE [LibraryCard] = @LibraryCard" 
        InsertCommand="INSERT INTO [LinkLibraryPatron] ([LibraryID], [PatronID], [LateFees]) VALUES (@LibraryID, @PatronID, @LateFees)" 
        SelectCommand="SELECT LibraryCard, PatronID, LateFees FROM LinkLibraryPatron WHERE (LibraryCard = @LibraryCard)" 
        UpdateCommand="UPDATE LinkLibraryPatron SET LateFees = @LateFees WHERE (LibraryCard = @LibraryCard)">
        <DeleteParameters>
            <asp:Parameter Name="LibraryCard" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LibraryID" Type="Object" />
            <asp:Parameter Name="PatronID" Type="Object" />
            <asp:Parameter Name="LateFees" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="LibraryCard" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LateFees" />
            <asp:Parameter Name="LibraryCard" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

