<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="TableOfContents.aspx.vb" Inherits="Documentation_User_TableOfContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table>
<tr>
<td>
    <asp:HyperLink ID="HyperLink6" runat="server" 
        NavigateUrl="~/Documentation/User/Editing Your Account.pdf">Editing Your Account</asp:HyperLink>
    </td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td>For Librarians</td>
</tr>
<tr>
<td>
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Documentation/User/Checkout and Checkin.pdf">Checking out and checking in</asp:HyperLink>
    </td>
</tr>
<tr>
<td>
    <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="~/Documentation/User/Managing Patrons.pdf">Adding and managing patrons</asp:HyperLink>
    </td>
</tr>
<tr>
<td>
    <asp:HyperLink ID="HyperLink3" runat="server" 
        NavigateUrl="~/Documentation/User/Managing Media.pdf">Managing media </asp:HyperLink>
    </td>
</tr>
<tr>
<td>
    <asp:HyperLink ID="HyperLink4" runat="server" 
        NavigateUrl="~/Documentation/User/Managing Requests.pdf">Managing Requests</asp:HyperLink>
    </td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td>For Patrons</td>
</tr>
<tr>
<td>
    <asp:HyperLink ID="HyperLink5" runat="server" 
        NavigateUrl="~/Documentation/User/Requesting Media from Other Libraries.pdf">Requesting Media from other Libraries</asp:HyperLink>
    </td>
</tr>
<tr>
<td>
    <asp:HyperLink ID="HyperLink7" runat="server" 
        NavigateUrl="~/Documentation/User/Viewing What Media You Have Currently Checked Out.pdf">Viewing Checkouts</asp:HyperLink>
    </td>
</tr>
</table>
</asp:Content>

