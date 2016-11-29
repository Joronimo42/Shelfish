
Partial Class Library_Media_LinkMediaSubject
    Inherits System.Web.UI.Page
    Dim MediaID As Integer = -1
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not (Request.QueryString("MediaID") Is Nothing) Then

            MediaID = Request.QueryString("MediaID")

            'For reasons I still don't fully understand, every page has to check if the 
            'page is posting back or not, otherwise none of the insert or update or delete
            'queries will work. 
            If Not (Page.IsPostBack) Then

                LinkMediaSubjectDataSource.Select(DataSourceSelectArguments.Empty)

            End If
        End If
    End Sub
    Protected Sub AddButton_Click(sender As Object, e As System.EventArgs) Handles AddButton.Click
        LinkMediaSubjectDataSource.Insert()
    End Sub

    Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs) Handles DeleteButton.Click
        LinkMediaSubjectDataSource.Delete()
        ListBox.DataBind()
    End Sub

    Protected Sub ClearButton_Click(sender As Object, e As System.EventArgs) Handles ClearButton.Click
        SubjectsDataSource.Delete()
        ListBox.DataBind()
    End Sub

    Protected Sub NextButton_Click(sender As Object, e As System.EventArgs) Handles NextButton.Click
        Response.Redirect("~/Library/MediaPortal.aspx")
    End Sub

    Protected Sub LinkMediaSubjectDataSource_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkMediaSubjectDataSource.Deleting
        e.Command.Parameters("@MediaSubjectID").Value = ListBox.SelectedValue
    End Sub




    Protected Sub LinkMediaSubjectDataSource_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkMediaSubjectDataSource.Inserting
        e.Command.Parameters("@MediaID").Value = MediaID
        e.Command.Parameters("@SubjectID").Value = SubjectDDL.SelectedValue
    End Sub


    Protected Sub LinkMediaSubjectDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkMediaSubjectDataSource.Selecting
        e.Command.Parameters("@MediaID").Value = MediaID
    End Sub

    Protected Sub SubjectsDataSource_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SubjectsDataSource.Deleting
        e.Command.Parameters("@MediaID").Value = MediaID
    End Sub
End Class
