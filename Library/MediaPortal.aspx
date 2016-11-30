<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="MediaPortal.aspx.vb" Inherits="Library_MediaPortal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Label ID="TitleLabel" runat="server" Font-Size="X-Large" Text="Media Portal"
        Font-Bold="True"></asp:Label>
    <br />
    <table>
        <tr>
            <td>
                <asp:HyperLink ID="MyLibraryHL" runat="server" NavigateUrl="~/Library/BrowseMyLibraryMedia.aspx">Browse My Library&#39;s Media</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="BrowseAllHL" runat="server" NavigateUrl="~/Library/BrowseAllMedia.aspx">Browse All Library Media</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="PrintRequestHL" runat="server" NavigateUrl="~/Library/ManageRequests.aspx">Print Request Labels</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="MediaSummaryHL" runat="server" NavigateUrl="~/Library/PrintableMediaSummary.aspx">Printable Media Summary</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Library/EditCreators.aspx">Edit Creators</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Library/EditCreatorRoles.aspx">Edit Creator Roles</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Library/EditFormats.aspx">Edit Formats</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Library/EditPublishers.aspx">Edit Publishers</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Library/EditSubjects.aspx">Edit Subjects</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>
