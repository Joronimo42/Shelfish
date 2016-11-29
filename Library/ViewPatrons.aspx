<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ViewPatrons.aspx.vb" Inherits="Library_ViewPatrons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:Label ID="TitleLabel" runat="server" Font-Size="X-Large" 
        Text="View Patrons" Font-Bold="True"></asp:Label>
    
    <asp:SqlDataSource ID="PatronDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM [LinkLibraryPatron] WHERE [LibraryCard] = @LibraryCard" 
        InsertCommand="INSERT INTO [LinkLibraryPatron] ([LibraryID], [PatronID]) VALUES (@LibraryID, @PatronID)" 
        SelectCommand="SELECT LinkLibraryPatron.LibraryCard, LinkLibraryPatron.LibraryID, LinkLibraryPatron.PatronID, aspnet_Users.UserName, LinkLibraryPatron.LateFees FROM LinkLibraryPatron INNER JOIN aspnet_Users ON LinkLibraryPatron.PatronID = aspnet_Users.UserId WHERE (LinkLibraryPatron.LibraryID = @LibraryID)" 
        
        
        
        
        
        UpdateCommand="UPDATE [LinkLibraryPatron] SET [LibraryID] = @LibraryID, [PatronID] = @PatronID WHERE [LibraryCard] = @LibraryCard">
        <DeleteParameters>
            <asp:Parameter Name="LibraryCard" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LibraryID" Type="Object" />
            <asp:Parameter Name="PatronID" Type="Object" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DbType="Guid" Name="LibraryID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LibraryID" Type="Object" />
            <asp:Parameter Name="PatronID" Type="Object" />
            <asp:Parameter Name="LibraryCard" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CheckoutDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM [Checkouts] WHERE [CheckoutID] = @CheckoutID" 
        InsertCommand="INSERT INTO [Checkouts] ([PatronID], [MediaID], [DueDate], [Renewals]) VALUES (@PatronID, @MediaID, @DueDate, @Renewals)" 
        SelectCommand="SELECT CheckoutID, PatronID, MediaID, DueDate, Renewals FROM Checkouts WHERE (PatronID = @PatronID)" 
        
        
        UpdateCommand="UPDATE [Checkouts] SET [PatronID] = @PatronID, [MediaID] = @MediaID, [DueDate] = @DueDate, [Renewals] = @Renewals WHERE [CheckoutID] = @CheckoutID">
        <DeleteParameters>
            <asp:Parameter Name="CheckoutID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PatronID" Type="Object" />
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="DueDate" />
            <asp:Parameter Name="Renewals" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="PatronID" DbType="Guid" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="PatronID" Type="Object" />
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="DueDate" />
            <asp:Parameter Name="Renewals" Type="Int32" />
            <asp:Parameter Name="CheckoutID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="ErrorLabel" runat="server" Font-Size="X-Large" ForeColor="Red" 
        Text="User still has material checked out" Visible="False"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="LibraryCard" 
        DataSourceID="PatronDataSource">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="LibraryCard" HeaderText="LibraryCard" 
                InsertVisible="False" ReadOnly="True" SortExpression="LibraryCard" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            <asp:BoundField DataField="LateFees" HeaderText="LateFees" 
                SortExpression="LateFees" />
        </Columns>
    </asp:GridView>
    <br />
    <table>
    <tr>
    <td>
    <asp:Button ID="AddButton" runat="server" Text="Add User" />
    </td>
    <td>
    <asp:Button ID="DeleteButton" runat="server" Text="Delete User" 
        Visible="False" />
    </td>
    <td>
        <asp:Button ID="LateFees" runat="server" Text="Manage Patron/Late Fees" 
            Visible="False" />
    </td>
    </tr>
    
    </table>
    
</asp:Content>

