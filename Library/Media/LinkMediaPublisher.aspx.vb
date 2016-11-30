
Partial Class Library_Media_LinkMediaPublisher
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not (Request.QueryString("MediaID") Is Nothing) Then

            ViewState("MediaID") = Request.QueryString("MediaID")

            'For reasons I still don't fully understand, every page has to check if the 
            'page is posting back or not, otherwise none of the insert or update or delete
            'queries will work. 
            If Not (Page.IsPostBack) Then

                LinkMediaPublisherDataSource.Select(DataSourceSelectArguments.Empty)

            End If
        End If
    End Sub



    'All fairly straightforward, uses insert and delete commands to change the data, then refreshes the Listbox after each delete.
    Protected Sub AddButton_Click(sender As Object, e As System.EventArgs) Handles AddButton.Click
        LinkMediaPublisherDataSource.Insert()
    End Sub

    Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs) Handles DeleteButton.Click
        LinkMediaPublisherDataSource.Delete()
        ListBox.DataBind()
    End Sub

    Protected Sub ClearButton_Click(sender As Object, e As System.EventArgs) Handles ClearButton.Click
        PublisherDataSource.Delete()
        ListBox.DataBind()
    End Sub

    Protected Sub NextButton_Click(sender As Object, e As System.EventArgs) Handles NextButton.Click
        Response.Redirect("LinkMediaSubject.aspx?MediaID=" & ViewState("MediaID").ToString)
    End Sub





    Protected Sub LinkMediaPublisherDataSource_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkMediaPublisherDataSource.Deleting
        e.Command.Parameters("@MediaPublisherID").Value = ListBox.SelectedValue
    End Sub



    Protected Sub LinkMediaPublisherDataSource_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkMediaPublisherDataSource.Inserting
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
        e.Command.Parameters("@PublisherID").Value = PublisherDDL.SelectedValue
        e.Command.Parameters("@DatePublished").Value = PublishedDateTextbox.Text
    End Sub

    Protected Sub LinkMediaPublisherDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkMediaPublisherDataSource.Selecting
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
    End Sub


    Protected Sub PublisherDataSource_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles PublisherDataSource.Deleting
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
    End Sub
End Class
