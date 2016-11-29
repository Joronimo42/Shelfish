<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="CheckIn.aspx.vb" Inherits="Library_Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:Label ID="TitleLabel" runat="server" Font-Size="X-Large" 
        Text="Check In" Font-Bold="True"></asp:Label>
    
    <br />
    <asp:Label ID="ErrorLabel" runat="server" Font-Size="X-Large" ForeColor="Red" 
        Text="ErrorLabel" Visible="False"></asp:Label>
    <br />
    <table>
    <tr>
    <td>
        <asp:Label ID="MediaIDLabel" runat="server" Text="MediaID:"></asp:Label>
        </td>
    <td>
        <asp:Label ID="MediaResultLabel" runat="server" Text="MediaResultLabel" 
            Visible="False"></asp:Label>
        <asp:TextBox ID="MediaIDTextbox" runat="server" TextMode="Number"></asp:TextBox>
        </td>
    </tr>
    
    <tr>
    <td>
        <asp:Label ID="LibraryCardLabel" runat="server" Text="Library Card:" 
            Visible="False"></asp:Label>
        </td>
    <td>
        <asp:Label ID="LibraryResultLabel" runat="server" Text="LibraryResultLabel" 
            Visible="False"></asp:Label>
        <asp:TextBox ID="LibraryCardTextbox" runat="server" TextMode="Number" 
            Visible="False"></asp:TextBox>
        </td>
    </tr>
    
    <tr>
    <td>&nbsp;</td>
    <td align="right">
        <asp:Button ID="NextButton" runat="server" Text="Next" />
        <asp:Button ID="FinishButton" runat="server" Text="Finish" Visible="False" />
        </td>
    </tr>
    
    </table>
    <asp:SqlDataSource ID="CheckoutDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM Checkouts WHERE (PatronID = @PatronID) AND (MediaID = @MediaID)" 
        InsertCommand="INSERT INTO [Checkouts] ([PatronID], [MediaID], [DueDate], [Renewals]) VALUES (@PatronID, @MediaID, @DueDate, @Renewals); SET @PK = SCOPE_IDENTITY()" 
        SelectCommand="SELECT DueDate FROM Checkouts WHERE (PatronID = @PatronID) AND (MediaID = @MediaID)" 
        
        
        UpdateCommand="UPDATE [Checkouts] SET [PatronID] = @PatronID, [MediaID] = @MediaID, [DueDate] = @DueDate, [Renewals] = @Renewals WHERE [CheckoutID] = @CheckoutID">
        <DeleteParameters>
            <asp:Parameter Name="PatronID" />
            <asp:Parameter Name="MediaID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PatronID" DbType="Guid" />
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter DbType="Date" DefaultValue="" Name="DueDate" />
            <asp:Parameter DefaultValue="3" Name="Renewals" Type="Int32" />
            <asp:Parameter Direction="Output" DbType="Int32" Name="PK" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="PatronID" />
            <asp:Parameter Name="MediaID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="PatronID" Type="Object" />
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="DueDate" />
            <asp:Parameter Name="Renewals" Type="Int32" />
            <asp:Parameter Name="CheckoutID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="LinkLibraryMediaDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM [LinkLibraryMedia] WHERE [LibraryMediaID] = @LibraryMediaID" 
        InsertCommand="INSERT INTO [LinkLibraryMedia] ([LibraryID], [MediaID], [QtyOwned], [QtyAvailable]) VALUES (@LibraryID, @MediaID, @QtyOwned, @QtyAvailable)" 
        SelectCommand="SELECT LibraryMediaID, QtyAvailable FROM LinkLibraryMedia WHERE (MediaID = @MediaID) AND (LibraryID = @LibraryID)" 
        UpdateCommand="UPDATE LinkLibraryMedia SET LibraryID = @LibraryID, MediaID = @MediaID, QtyAvailable = @QtyAvailable WHERE (LibraryMediaID = @LibraryMediaID)">
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
            <asp:Parameter Name="LibraryID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LibraryID" DbType="Guid" />
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="QtyAvailable" Type="Int32" />
            <asp:Parameter Name="LibraryMediaID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="LinkLibraryPatronDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        
        SelectCommand="SELECT PatronID, LateFees FROM LinkLibraryPatron WHERE (LibraryCard = @LibraryCard)" 
        UpdateCommand="UPDATE LinkLibraryPatron SET LateFees = @LateFees WHERE (LibraryCard = @LibraryCard)">
        <SelectParameters>
            <asp:Parameter Name="LibraryCard" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LateFees" />
            <asp:Parameter Name="LibraryCard" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>

