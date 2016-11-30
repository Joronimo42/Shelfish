
Partial Class Patrons_Request
    Inherits System.Web.UI.Page


    'This page is really just a results page that does all the requesting in the background.
    'It checks to make sure that the patron has not already requested the media, then
    'adds the request to the database, and displays where the media is coming from.
    'It requests the media from the first library to show up on the list, because in most cases, 
    'that will be sufficent. 
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        ViewState("MediaID") = Request.QueryString("MediaID")
        Dim dview As Data.DataView
        dview = CType(RequestDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
        If dview.Table.Rows.Count = 0 Then
            dview = CType(LinkLibraryPatronDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
            ViewState("LibraryToID") = CType(dview.Table.Rows.Item(0).Item("LibraryID"), Guid)

            dview = CType(LinkLibraryMediaDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
            ViewState("LibraryFromID") = CType(dview.Table.Rows.Item(0).Item("LibraryID"), Guid)

            RequestDataSource.Insert()

            Dim tempProfile As ProfileCommon
            tempProfile = Profile.GetProfile(Membership.GetUser(ViewState("LibraryFromID")).UserName)
            RequestLabel.Text = "Your request is being processed by " & tempProfile.FullName & "."


        Else
            RequestLabel.Text = "You have already requested this media."
        End If
    End Sub

    Protected Sub RequestDataSource_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles RequestDataSource.Inserting
        e.Command.Parameters("@PatronID").Value = Membership.GetUser.ProviderUserKey
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
        e.Command.Parameters("@LibraryFromID").Value = ViewState("LibraryFromID")
        e.Command.Parameters("@LibraryToID").Value = ViewState("LibraryToID")
    End Sub

    Protected Sub RequestDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles RequestDataSource.Selecting
        e.Command.Parameters("@PatronID").Value = Membership.GetUser.ProviderUserKey
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
    End Sub

    Protected Sub LinkLibraryPatronDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkLibraryPatronDataSource.Selecting
        e.Command.Parameters("@PatronID").Value = Membership.GetUser.ProviderUserKey
    End Sub

    Protected Sub LinkLibraryMediaDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkLibraryMediaDataSource.Selecting
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
    End Sub

End Class
