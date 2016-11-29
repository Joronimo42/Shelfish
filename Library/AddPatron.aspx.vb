
Partial Class Library_AddPatron
    Inherits System.Web.UI.Page
    Dim PatronID As Guid
    Dim LibraryCard As String


    Protected Sub CreateUserWizard_CreatedUser(sender As Object, e As System.EventArgs) Handles CreateUserWizard.CreatedUser
        Dim UserTextbox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("UserName"), TextBox)
        Dim FullNameTextbox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("FullNameTextbox"), TextBox)
        Dim AddressTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextbox"), TextBox)
        Dim CityTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("CityTextbox"), TextBox)
        Dim StateTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("StateTextbox"), TextBox)
        Dim CountryTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryTextbox"), TextBox)
        Dim ZipTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("ZipTextbox"), TextBox)
        Dim PhoneTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("PhoneTextbox"), TextBox)

        PatronID = Membership.GetUser(UserTextbox.Text).ProviderUserKey

        Dim user As ProfileCommon = Profile.GetProfile(UserTextbox.Text)

        user.FullName = FullNameTextbox.Text
        user.Address = AddressTextBox.Text
        user.City = CityTextBox.Text
        user.State = StateTextBox.Text
        user.Country = CountryTextBox.Text
        user.Zip = ZipTextBox.Text
        user.Phone = PhoneTextBox.Text

        user.IsLibrary = False
        user.LibraryID = Membership.GetUser.ProviderUserKey.ToString


        user.Save()

        Roles.AddUserToRole(user.UserName, "Patron")

        LinkLibraryPatronDataSource.Insert()

        Dim cardNum As Label
        cardNum = CType(CreateUserWizard.CompleteStep.ContentTemplateContainer.FindControl("LibraryCardLabel"), Label)
        cardNum.Text = LibraryCard


    End Sub

    Protected Sub LinkLibraryPatronDataSource_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles LinkLibraryPatronDataSource.Inserted
        Dim command As Data.Common.DbCommand
        command = e.Command

        LibraryCard = command.Parameters("@PK").Value.ToString
    End Sub

    Protected Sub LinkLibraryPatronDataSource_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkLibraryPatronDataSource.Inserting
        e.Command.Parameters("@LibraryID").Value = Membership.GetUser.ProviderUserKey
        e.Command.Parameters("@PatronID").Value = PatronID
    End Sub
End Class
