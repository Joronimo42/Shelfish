
Partial Class Library_Media_LinkMediaCreator
    Inherits System.Web.UI.Page
    Dim MediaID As Integer = -1



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not (Request.QueryString("MediaID") Is Nothing) Then

            MediaID = Request.QueryString("MediaID")

            'For reasons I still don't fully understand, every page has to check if the 
            'page is posting back or not, otherwise none of the insert or update or delete
            'queries will work. 
            If Not (Page.IsPostBack) Then

                LinkMediaCreatorDataSource.Select(DataSourceSelectArguments.Empty)

            End If
        End If
    End Sub

    Protected Sub AddButton_Click(sender As Object, e As System.EventArgs) Handles AddButton.Click
        LinkMediaCreatorDataSource.Insert()
    End Sub

    Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs) Handles DeleteButton.Click
        LinkMediaCreatorDataSource.Delete()
        ListBox.DataBind()
    End Sub

    Protected Sub ClearButton_Click(sender As Object, e As System.EventArgs) Handles ClearButton.Click
        CreatorDataSource.Delete()
        ListBox.DataBind()
    End Sub

    Protected Sub NextButton_Click(sender As Object, e As System.EventArgs) Handles NextButton.Click
        Response.Redirect("LinkMediaPublisher.aspx?MediaID=" & MediaID.ToString)
    End Sub





    Protected Sub LinkMediaCreatorDataSource_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkMediaCreatorDataSource.Deleting
        e.Command.Parameters("@MediaCreatorID").Value = ListBox.SelectedValue
    End Sub

    Protected Sub LinkMediaCreatorDataSource_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkMediaCreatorDataSource.Inserting
        e.Command.Parameters("@MediaID").Value = MediaID
        e.Command.Parameters("@CreatorID").Value = CreatorDDL.SelectedValue
        e.Command.Parameters("@CreatorRoleID").Value = CreatorRoleDDL.SelectedValue
    End Sub

    Protected Sub LinkMediaCreatorDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkMediaCreatorDataSource.Selecting
        e.Command.Parameters("@MediaID").Value = MediaID
    End Sub
    
    Protected Sub CreatorDataSource_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles CreatorDataSource.Deleting
        e.Command.Parameters("@MediaID").Value = MediaID
    End Sub

    
End Class
