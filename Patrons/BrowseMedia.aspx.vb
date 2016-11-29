
Partial Class Patrons_BrowseMedia
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim dview As Data.DataView
            dview = CType(LinkLibraryPatronDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
            ViewState("LibraryID") = CType(dview.Table.Rows.Item(0).Item("LibraryID"), Guid)
            GridView1.DataSource = MediaDataSource


            GridView1.DataBind()


        End If
    End Sub

    Protected Sub LinkLibraryPatronDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkLibraryPatronDataSource.Selecting
        e.Command.Parameters("@PatronID").Value = Membership.GetUser.ProviderUserKey
    End Sub

    Protected Sub MediaDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles MediaDataSource.Selecting
        e.Command.Parameters("@LibraryID").Value = ViewState("LibraryID")
    End Sub

    Protected Sub GridView1_SelectedIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles GridView1.SelectedIndexChanging
        RequestButton.Visible = True
    End Sub

    Protected Sub RequestButton_Click(sender As Object, e As System.EventArgs) Handles RequestButton.Click
        Response.Redirect("Request.aspx?MediaID=" & GridView1.SelectedDataKey.Item("MediaID").ToString)
    End Sub
End Class
