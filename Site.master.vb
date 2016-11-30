
Partial Class Site
    Inherits System.Web.UI.MasterPage

    'This checks the role of the user and customizes the menu to fit their needs. 
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If (Page.User.Identity.IsAuthenticated = True) Then
            If Page.User.IsInRole("Librarian") Then
                Dim CheckoutMenuItem As New MenuItem
                Dim ManageMediaMenuItem As New MenuItem
                Dim ManagePatronsMenuItem As New MenuItem
                Dim EditAccountMenuItem As New MenuItem
                Dim CheckInMenuItem As New MenuItem


                CheckoutMenuItem.Text = "Checkout"
                CheckoutMenuItem.NavigateUrl = "~/Library/Checkout.aspx"

                ManageMediaMenuItem.Text = "Media"
                ManageMediaMenuItem.NavigateUrl = "~/Library/MediaPortal.aspx"

                ManagePatronsMenuItem.Text = "Patrons"
                ManagePatronsMenuItem.NavigateUrl = "~/Library/ViewPatrons.aspx"

                EditAccountMenuItem.Text = "Account"
                EditAccountMenuItem.NavigateUrl = "~/Library/EditAccount.aspx"

                CheckInMenuItem.Text = "Check In"
                CheckInMenuItem.NavigateUrl = "~/Library/CheckIn.aspx"


                NavigationMenu.Items.Add(CheckoutMenuItem)
                NavigationMenu.Items.Add(CheckInMenuItem)
                NavigationMenu.Items.Add(ManageMediaMenuItem)
                NavigationMenu.Items.Add(ManagePatronsMenuItem)
                NavigationMenu.Items.Add(EditAccountMenuItem)
            End If
            If Page.User.IsInRole("Patron") Then

                Dim HistoryMenuItem As New MenuItem
                Dim BrowseMenuItem As New MenuItem
                Dim EditAccountMenuItem As New MenuItem


               

                HistoryMenuItem.Text = "Checkout History"
                HistoryMenuItem.NavigateUrl = "~/Patrons/CheckoutHistory.aspx"

                BrowseMenuItem.Text = "Browse"
                BrowseMenuItem.NavigateUrl = "~/Patrons/BrowseMedia.aspx"

                EditAccountMenuItem.Text = "Account"
                EditAccountMenuItem.NavigateUrl = "~/Patrons/EditAccount.aspx"


                NavigationMenu.Items.Add(BrowseMenuItem)

                NavigationMenu.Items.Add(HistoryMenuItem)
                NavigationMenu.Items.Add(EditAccountMenuItem)


            End If
            If Page.User.IsInRole("Admin") Then

                Dim AddLibrary As New MenuItem

                AddLibrary.Text = "Add Library"
                AddLibrary.NavigateUrl = "~/Account/Admin/AddLibrary.aspx"
                NavigationMenu.Items.Add(AddLibrary)
            End If
        End If
    End Sub
End Class

