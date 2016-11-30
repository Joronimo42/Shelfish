<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Request.aspx.vb" Inherits="Patrons_Request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:SqlDataSource ID="LinkLibraryPatronDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT LibraryID FROM LinkLibraryPatron WHERE (PatronID = @PatronID)">
        <SelectParameters>
            <asp:Parameter DbType="Guid" Name="PatronID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="RequestDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        DeleteCommand="DELETE FROM [Requests] WHERE [RequestID] = @RequestID" InsertCommand="INSERT INTO [Requests] ([PatronID], [LibraryFromID], [LibraryToID], [MediaID]) VALUES (@PatronID, @LibraryFromID, @LibraryToID, @MediaID)"
        SelectCommand="SELECT RequestID FROM Requests WHERE (PatronID = @PatronID) AND (MediaID = @MediaID)"
        UpdateCommand="UPDATE [Requests] SET [PatronID] = @PatronID, [LibraryFromID] = @LibraryFromID, [LibraryToID] = @LibraryToID, [MediaID] = @MediaID WHERE [RequestID] = @RequestID">
        <DeleteParameters>
            <asp:Parameter Name="RequestID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="PatronID" />
            <asp:Parameter DbType="Guid" Name="LibraryFromID" />
            <asp:Parameter DbType="Guid" Name="LibraryToID" />
            <asp:Parameter Name="MediaID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DbType="Guid" Name="PatronID" />
            <asp:Parameter Name="MediaID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="PatronID" Type="Object" />
            <asp:Parameter Name="LibraryFromID" Type="Object" />
            <asp:Parameter Name="LibraryToID" Type="Object" />
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="RequestID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="RequestLabel" runat="server" Text="RequestLabel"></asp:Label>
    <br />
    <asp:SqlDataSource ID="LinkLibraryMediaDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        DeleteCommand="DELETE FROM [LinkLibraryMedia] WHERE [LibraryMediaID] = @LibraryMediaID"
        InsertCommand="INSERT INTO [LinkLibraryMedia] ([LibraryID], [MediaID], [QtyOwned], [QtyAvailable]) VALUES (@LibraryID, @MediaID, @QtyOwned, @QtyAvailable)"
        SelectCommand="SELECT LibraryID FROM LinkLibraryMedia WHERE (MediaID = @MediaID)"
        UpdateCommand="UPDATE [LinkLibraryMedia] SET [LibraryID] = @LibraryID, [MediaID] = @MediaID, [QtyOwned] = @QtyOwned, [QtyAvailable] = @QtyAvailable WHERE [LibraryMediaID] = @LibraryMediaID">
        <DeleteParameters>
            <asp:Parameter Name="LibraryMediaID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LibraryID" Type="Object" />
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="QtyOwned" Type="Int32" />
            <asp:Parameter Name="QtyAvailable" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="MediaID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LibraryID" Type="Object" />
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="QtyOwned" Type="Int32" />
            <asp:Parameter Name="QtyAvailable" Type="Int32" />
            <asp:Parameter Name="LibraryMediaID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
