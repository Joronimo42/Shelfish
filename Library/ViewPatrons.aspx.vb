
Partial Class Library_ViewPatrons
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        DeleteButton.Visible = True
        LateFees.Visible = True

    End Sub

    Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs) Handles DeleteButton.Click
        ViewState("UserName") = GridView1.SelectedRow.Cells.Item(2).Text
        Dim dview As Data.DataView
        dview = CType(CheckoutDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
        If dview.Table.Rows.Count < 1 Then
            ViewState("LibraryCard") = GridView1.SelectedDataKey.Item("LibraryCard")

            PatronDataSource.Delete()
            ErrorLabel.Visible = False
            DeleteButton.Visible = False
            LateFees.Visible = False


        Else
            ErrorLabel.Visible = True
        End If


    End Sub

    Protected Sub PatronDataSource_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles PatronDataSource.Deleted
        Membership.DeleteUser(ViewState("UserName"))
    End Sub

    Protected Sub PatronDataSource_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles PatronDataSource.Deleting
        e.Command.Parameters("@LibraryCard").Value = ViewState("LibraryCard")
    End Sub

    Protected Sub AddButton_Click(sender As Object, e As System.EventArgs) Handles AddButton.Click
        Response.Redirect("~/Library/AddPatron.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            PatronDataSource.Select(DataSourceSelectArguments.Empty)
        End If
    End Sub

    Protected Sub PatronDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles PatronDataSource.Selecting
        e.Command.Parameters("@LibraryID").Value = Membership.GetUser().ProviderUserKey
    End Sub

    Protected Sub CheckoutDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles CheckoutDataSource.Selecting
        e.Command.Parameters("@PatronID").Value = CType(Membership.GetUser(ViewState("UserName").ToString).ProviderUserKey, Guid)
    End Sub


    Protected Sub LateFees_Click(sender As Object, e As System.EventArgs) Handles LateFees.Click
        Response.Redirect("~/Library/EditPatronAccount.aspx?LibraryCard=" & GridView1.SelectedDataKey.Item("LibraryCard"))
    End Sub
End Class
