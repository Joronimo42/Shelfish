<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">



    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        Text="Hello, and welcome to Shelf-ish!"></asp:Label>

        <table>
        <tr>
        <td>
            <asp:HyperLink ID="UserDocHL" runat="server" 
                NavigateUrl="~/Documentation/User/TableOfContents.aspx">User Documentation</asp:HyperLink>
        </td>
        </tr>
        <tr>
        <td>
            <asp:HyperLink ID="TechDocHL" runat="server" 
                NavigateUrl="~/Documentation/Technical/Technical Documentation.zip">Technical Documentation</asp:HyperLink>
        </td>
        </tr>
        </table>

</asp:Content>