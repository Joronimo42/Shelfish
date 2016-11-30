<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="ManageRequests.aspx.vb" Inherits="Library_ManageRequests" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:SqlDataSource ID="RequestDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        DeleteCommand="DELETE FROM [Requests] WHERE [RequestID] = @RequestID" InsertCommand="INSERT INTO [Requests] ([PatronID], [LibraryFromID], [LibraryToID], [MediaID], [Shipped]) VALUES (@PatronID, @LibraryFromID, @LibraryToID, @MediaID, @Shipped)"
        SelectCommand="SELECT RequestID, PatronID, LibraryFromID, LibraryToID, MediaID, Shipped FROM Requests WHERE (LibraryFromID = @LibraryID) AND (Shipped = 0)"
        UpdateCommand="UPDATE Requests SET Shipped = @Shipped WHERE (RequestID = @RequestID)">
        <DeleteParameters>
            <asp:Parameter Name="RequestID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PatronID" Type="Object" />
            <asp:Parameter Name="LibraryFromID" Type="Object" />
            <asp:Parameter Name="LibraryToID" Type="Object" />
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="Shipped" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DbType="Guid" Name="LibraryID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Shipped" DefaultValue="1" />
            <asp:Parameter Name="RequestID" DefaultValue="" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="LinkLibraryPatronMediaSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT [LibraryCard] FROM [LinkLibraryPatron] WHERE ([PatronID] = @PatronID)">
        <SelectParameters>
            <asp:Parameter Name="PatronID" Type="Object" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table>
        <tr>
            <td>
                MediaID:
            </td>
            <td>
                <asp:DropDownList ID="RequestDDL" runat="server" DataSourceID="RequestDataSource"
                    DataTextField="MediaID" DataValueField="RequestID">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="ShippedButton" runat="server" Text="Mark As Shipped" />
            </td>
        </tr>
    </table>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\RequestShippingLabel.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
    <br />
    <asp:Label ID="RequestLabel" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
