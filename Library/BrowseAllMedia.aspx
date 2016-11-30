<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="BrowseAllMedia.aspx.vb" Inherits="Library_BrowseMedia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:SqlDataSource ID="MediaDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        DeleteCommand="DELETE FROM [Media] WHERE [MediaID] = @MediaID" InsertCommand="INSERT INTO [Media] ([ISBN], [FormatID], [Title], [Description]) VALUES (@ISBN, @FormatID, @Title, @Description)"
        SelectCommand="SELECT Media.MediaID, Media.ISBN, Media.FormatID, Media.Title, Media.Description, Formats.Name FROM Media INNER JOIN Formats ON Media.FormatID = Formats.FormatID"
        UpdateCommand="UPDATE [Media] SET [ISBN] = @ISBN, [FormatID] = @FormatID, [Title] = @Title, [Description] = @Description WHERE [MediaID] = @MediaID">
        <DeleteParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="FormatID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="FormatID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="MediaID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="TitleLabel" runat="server" Font-Size="X-Large" Text="Browse All Media"
        Font-Bold="True"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="MediaID" DataSourceID="MediaDataSource"
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="MediaID" HeaderText="MediaID" InsertVisible="False" ReadOnly="True"
                SortExpression="MediaID" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
            <asp:BoundField DataField="FormatID" HeaderText="FormatID" SortExpression="FormatID"
                Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Name" HeaderText="Format" SortExpression="Name" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <table style="width: 298px">
        <tr>
            <td>
                <asp:Button ID="AddButton" runat="server" Text="Add Media" />
            </td>
            <td>
                <asp:Button ID="EditButton" runat="server" Text="Edit Media" Visible="False" />
            </td>
            <td>
                <asp:Button ID="Checkout" runat="server" Text="Checkout" Visible="False" />
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
