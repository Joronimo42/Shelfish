<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="LinkMediaSubject.aspx.vb" Inherits="Library_Media_LinkMediaSubject" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 88px;
        }
        .style2
        {
            width: 110px;
        }
        .style3
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Size="X-Large" 
        Text="Link Media to Subjects"></asp:Label>
    <br />
    <br />
    <asp:ListBox ID="ListBox" runat="server" 
        DataSourceID="LinkMediaSubjectDataSource" DataTextField="Name" 
        DataValueField="MediaSubjectID" Width="291px"></asp:ListBox>
    <table>
    <tr>
    <td>
        <asp:Button ID="DeleteButton" runat="server" Text="Delete Selected" />
        </td>
        <td></td>
        <td>
            <asp:Button ID="ClearButton" runat="server" Text="Clear All" />
        </td>
        
    </tr>

   
    <tr>
    <td class="style3">
        </td>
        <td class="style3"></td>
        <td class="style3"></td>
        
    </tr>

   
    <tr>
    <td>
        Subject:</td>
    <td class="style1">
        <asp:DropDownList ID="SubjectDDL" runat="server" 
            DataSourceID="SubjectsDataSource" DataTextField="Name" 
            DataValueField="SubjectID">
        </asp:DropDownList>
    </td>
    <td class="style2">
        <asp:HyperLink ID="EditSubjectsHyperlink" runat="server" 
            NavigateUrl="~/Library/EditSubjects.aspx">Edit Subjects</asp:HyperLink>
    </td>
    </tr>
    <tr>
    <td>
        &nbsp;</td>
    <td class="style1" align="left">
        <asp:Button ID="AddButton" runat="server" Text="Add" />
        </td>
    <td class="style2" align="right">
        <asp:Button ID="NextButton" runat="server" Text="Finish" />
    </td>
    </tr>
    </table>
    <asp:SqlDataSource ID="LinkMediaSubjectDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM [LinkMediaSubject] WHERE [MediaSubjectID] = @MediaSubjectID" 
        InsertCommand="INSERT INTO [LinkMediaSubject] ([MediaID], [SubjectID]) VALUES (@MediaID, @SubjectID)" 
        SelectCommand="SELECT LinkMediaSubject.MediaSubjectID, LinkMediaSubject.MediaID, LinkMediaSubject.SubjectID, Subjects.Name FROM LinkMediaSubject INNER JOIN Subjects ON LinkMediaSubject.SubjectID = Subjects.SubjectID WHERE (LinkMediaSubject.MediaID = @MediaID)" 
        
        
        
        
        
        UpdateCommand="UPDATE [LinkMediaSubject] SET [MediaID] = @MediaID, [SubjectID] = @SubjectID WHERE [MediaSubjectID] = @MediaSubjectID">
        <DeleteParameters>
            <asp:Parameter Name="MediaSubjectID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="SubjectID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MediaID" QueryStringField="MediaID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MediaID" Type="Int32" />
            <asp:Parameter Name="SubjectID" Type="Int32" />
            <asp:Parameter Name="MediaSubjectID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SubjectsDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT * FROM [Subjects]" 
        DeleteCommand="DELETE FROM LinkMediaSubject WHERE (MediaID = @MediaID)">
        <DeleteParameters>
            <asp:Parameter Name="MediaID" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>



