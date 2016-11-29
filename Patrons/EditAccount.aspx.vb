
Partial Class Patrons_EditAccount
    Inherits System.Web.UI.Page

    Dim LibraryUser As ProfileBase
    Dim CurrentUserProfile As ProfileBase


    Protected Sub SqlDataSource1_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        Dim currentUser As MembershipUser
        Dim id As Guid
        currentUser = Membership.GetUser()
        id = currentUser.ProviderUserKey

        e.Command.Parameters("@PatronID").Value = id

    End Sub



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim dview As New Data.DataView
        Dim LibraryID As Guid

        dview = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), Data.DataView)
        LibraryID = CType(dview.Table.Rows.Item(0).Item("LibraryID"), Guid)
        LibraryUser = Profile.GetProfile(Membership.GetUser(LibraryID).UserName)

        CardNumberLabel.Text = CType(dview.Table.Rows.Item(0).Item("LibraryCard"), String)
        LibraryNameLabel.Text = LibraryUser.GetPropertyValue("FullName")


    End Sub
End Class
