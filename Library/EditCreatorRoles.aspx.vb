
Partial Class Library_EditCreatorRoles
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            ListView1.Sort("CreatorRole", SortDirection.Ascending)
        End If

    End Sub

End Class
