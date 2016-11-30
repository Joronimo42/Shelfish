<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="LinkMediaPublisher.aspx.vb" Inherits="Library_Media_LinkMediaPublisher" %>

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
    <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Link Media to Publishers"></asp:Label>
    <br />
    <br />
    <asp:ListBox ID="ListBox" runat="server" DataSourceID="LinkMediaPublisherDataSource"
        DataTextField="Name" DataValueField="MediaPublisherID" Width="291px"></asp:ListBox>
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
                Publisher:
            </td>
            <td class="style1">
                <asp:DropDownList ID="PublisherDDL" runat="server" DataSourceID="PublisherDataSource"
                    DataTextField="Name" DataValueField="PublisherID">
                </asp:DropDownList>
            </td>
            <td class="style2">
                <asp:HyperLink ID="EditPublishersHyperlink" runat="server" NavigateUrl="~/Library/EditPublishers.aspx">Edit Publishers</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                Date Published:
            </td>
            <td class="style1">
                <asp:TextBox ID="PublishedDateTextbox" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td class="style2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td class="style1" align="left">
                <asp:Button ID="AddButton" runat="server" Text="Add" />
            </td>
            <td class="style2" align="right">
                <asp:Button ID="NextButton" runat="server" Text="Next" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="LinkMediaPublisherDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        DeleteCommand="DELETE FROM [LinkMediaPublisher] WHERE [MediaPublisherID] = @MediaPublisherID"
        InsertCommand="INSERT INTO [LinkMediaPublisher] ([MediaID], [PublisherID], [DatePublished]) VALUES (@MediaID, @PublisherID, @DatePublished)"
        SelectCommand="SELECT LinkMediaPublisher.MediaPublisherID, LinkMediaPublisher.MediaID, LinkMediaPublisher.PublisherID, LinkMediaPublisher.DatePublished, Publishers.Name FROM LinkMediaPublisher INNER JOIN Publishers ON LinkMediaPublisher.PublisherID = Publishers.PublisherID WHERE (LinkMediaPublisher.MediaID = @MediaID)"
        UpdateCommand="UPDATE [LinkMediaPublisher] SET [MediaID] = @MediaID, [PublisherID] = @PublisherID, [DatePublished] = @DatePublished WHERE [MediaPublisherID] = @MediaPublisherID">
        <DeleteParameters>
            <asp:Parameter Name="MediaPublisherID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="PublisherID" Type="Int32" />
            <asp:Parameter Name="DatePublished" DbType="Date" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MediaID" QueryStringField="MediaID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="PublisherID" Type="Int32" />
            <asp:Parameter Name="DatePublished" DbType="Date" />
            <asp:Parameter Name="MediaPublisherID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="PublisherDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT * FROM [Publishers]" DeleteCommand="DELETE FROM LinkMediaPublisher WHERE (MediaID = @MediaID)">
        <DeleteParameters>
            <asp:Parameter Name="MediaID" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
