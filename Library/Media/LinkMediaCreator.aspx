<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="LinkMediaCreator.aspx.vb" Inherits="Library_Media_LinkMediaCreator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 88px;
        }
        .style2
        {
            width: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Link Media to Creators"></asp:Label>
    <br />
    <br />
    <asp:ListBox ID="ListBox" runat="server" DataSourceID="LinkMediaCreatorDataSource"
        DataTextField="DisplayCreator" DataValueField="MediaCreatorID" Width="291px">
    </asp:ListBox>
    <table>
        <tr>
            <td>
                <asp:Button ID="DeleteButton" runat="server" Text="Delete Selected" />
            </td>
            <td>
            </td>
            <td>
                <asp:Button ID="ClearButton" runat="server" Text="Clear All" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Creator:
            </td>
            <td class="style1">
                <asp:DropDownList ID="CreatorDDL" runat="server" DataSourceID="CreatorDataSource"
                    DataTextField="Name" DataValueField="CreatorID">
                </asp:DropDownList>
            </td>
            <td class="style2">
                <asp:HyperLink ID="EditCreatorsHyperlink" runat="server" NavigateUrl="~/Library/EditCreators.aspx">Edit Creators</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                Creator&#39;s Role:
            </td>
            <td class="style1">
                <asp:DropDownList ID="CreatorRoleDDL" runat="server" DataSourceID="CreatorRoleDataSource"
                    DataTextField="CreatorRole" DataValueField="CreatorRoleID">
                </asp:DropDownList>
            </td>
            <td class="style2">
                <asp:HyperLink ID="EditCreatorRolesHyperlink" runat="server" NavigateUrl="~/Library/EditCreatorRoles.aspx">Edit Creator Roles</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td class="style1" align="right">
                <asp:Button ID="AddButton" runat="server" Text="Add" />
            </td>
            <td class="style2" align="right">
                <asp:Button ID="NextButton" runat="server" Text="Next" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="LinkMediaCreatorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        DeleteCommand="DELETE FROM [LinkMediaCreator] WHERE [MediaCreatorID] = @MediaCreatorID"
        InsertCommand="INSERT INTO [LinkMediaCreator] ([MediaID], [CreatorID], [CreatorRoleID]) VALUES (@MediaID, @CreatorID, @CreatorRoleID)"
        SelectCommand="SELECT LinkMediaCreator.MediaCreatorID, LinkMediaCreator.MediaID, LinkMediaCreator.CreatorID, LinkMediaCreator.CreatorRoleID, Creators.Name + ', ' + CreatorRoles.CreatorRole AS DisplayCreator, Media.Title FROM LinkMediaCreator INNER JOIN Creators ON LinkMediaCreator.CreatorID = Creators.CreatorID INNER JOIN CreatorRoles ON LinkMediaCreator.CreatorRoleID = CreatorRoles.CreatorRoleID INNER JOIN Media ON LinkMediaCreator.MediaID = Media.MediaID WHERE (LinkMediaCreator.MediaID = @MediaID)"
        UpdateCommand="UPDATE [LinkMediaCreator] SET [MediaID] = @MediaID, [CreatorID] = @CreatorID, [CreatorRoleID] = @CreatorRoleID WHERE [MediaCreatorID] = @MediaCreatorID">
        <DeleteParameters>
            <asp:Parameter Name="MediaCreatorID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="CreatorID" Type="Int32" />
            <asp:Parameter Name="CreatorRoleID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MediaID" QueryStringField="MediaID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="CreatorID" Type="Int32" />
            <asp:Parameter Name="CreatorRoleID" Type="Int32" />
            <asp:Parameter Name="MediaCreatorID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CreatorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT * FROM [Creators]" DeleteCommand="DELETE FROM LinkMediaCreator WHERE (MediaID = @MediaID)">
        <DeleteParameters>
            <asp:Parameter Name="MediaID" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CreatorRoleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT * FROM [CreatorRoles]"></asp:SqlDataSource>
    <br />
</asp:Content>
