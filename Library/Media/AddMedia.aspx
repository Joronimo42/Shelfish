<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="AddMedia.aspx.vb" Inherits="Library_Media_AddMedia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 128px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Label ID="TitleLabel" runat="server" Font-Size="X-Large" Text="Add/Edit Media"
        Font-Bold="True"></asp:Label>
    <br />
    <table>
        <tr>
            <td align="right">
                ISBN:
            </td>
            <td class="style1">
                <asp:TextBox ID="ISBNTextbox" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right">
                Title:
            </td>
            <td class="style1">
                <asp:TextBox ID="TitleTextbox" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                <asp:RequiredFieldValidator ID="TitleValidate" runat="server" ControlToValidate="TitleTextbox"
                    ErrorMessage="Title Required" ToolTip="Title is required." ValidationGroup="AddMediaValidate"
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                Description:
            </td>
            <td class="style1">
                <asp:TextBox ID="DescriptionTextbox" runat="server" Height="71px" TextMode="MultiLine"
                    Width="176px"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right">
                Format:
            </td>
            <td class="style1">
                <asp:DropDownList ID="FormatDDL" runat="server" DataSourceID="SqlDataSource" DataTextField="Name"
                    DataValueField="FormatID">
                </asp:DropDownList>
            </td>
            <td class="style1">
                <asp:RequiredFieldValidator ID="FormatValidate" runat="server" ControlToValidate="FormatDDL"
                    ErrorMessage="Format Required" ToolTip="Format is required." ValidationGroup="AddMediaValidate"
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                Qty Owned:
            </td>
            <td class="style1">
                <asp:TextBox ID="QtyOwnedTextbox" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="style1">
                <asp:RequiredFieldValidator ID="QtyValidate" runat="server" ControlToValidate="QtyOwnedTextbox"
                    ErrorMessage="Qty is required." ToolTip="Qty is required." ValidationGroup="AddMediaValidate"
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:Button ID="NextButton" runat="server" Text="Next" UseSubmitBehavior="False"
        ValidationGroup="AddMediaValidate" />
    <!--Readout for debugging purposes, ignore. <asp:Label ID="DebugLabel" runat="server" Text="Label"></asp:Label>-->
    <br />
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        DeleteCommand="DELETE FROM [Media] WHERE [MediaID] = @MediaID" InsertCommand="INSERT INTO Media(ISBN, FormatID, Title, Description) VALUES (@ISBN, @FormatID, @Title, @Description); SET @PK = SCOPE_IDENTITY()"
        SelectCommand="SELECT Name, FormatID FROM Formats" UpdateCommand="UPDATE [Media] SET [ISBN] = @ISBN, [FormatID] = @FormatID, [Title] = @Title, [Description] = @Description WHERE [MediaID] = @MediaID">
        <DeleteParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="FormatID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DbType="Int32" Direction="Output" Name="PK" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="FormatID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="MediaID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="EditingMediaDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT * FROM [Media] WHERE ([MediaID] = @MediaID)">
        <SelectParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="LinkLibraryMediaDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        DeleteCommand="DELETE FROM [LinkLibraryMedia] WHERE [LibraryMediaID] = @LibraryMediaID"
        InsertCommand="LinkLibraryToMedia" SelectCommand="SELECT LibraryMediaID, LibraryID, MediaID, QtyOwned, QtyAvailable FROM LinkLibraryMedia WHERE (LibraryID = @LibraryID) AND (MediaID = @MediaID)"
        UpdateCommand="UPDATE LinkLibraryMedia SET LibraryID = @LibraryID, MediaID = @MediaID, QtyOwned = @QtyOwned, QtyAvailable = @QtyOwned WHERE (LibraryMediaID = @LibraryMediaID)"
        InsertCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="LibraryMediaID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LibraryID" DbType="Guid" />
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="QtyOwned" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="LibraryID" DbType="Guid" />
            <asp:Parameter Name="MediaID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LibraryID" />
            <asp:Parameter Name="MediaID" />
            <asp:Parameter Name="QtyOwned" />
            <asp:Parameter Name="LibraryMediaID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
