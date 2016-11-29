
Partial Class Account_AddLibrary
    Inherits System.Web.UI.Page

    Protected Sub CreateUserWizard_CreatedUser(sender As Object, e As System.EventArgs) Handles CreateUserWizard.CreatedUser
        Dim UserTextbox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("UserName"), TextBox)
        Dim LibraryNameTextbox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("LibraryNameTextbox"), TextBox)
        Dim AddressTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextbox"), TextBox)
        Dim CityTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("CityTextbox"), TextBox)
        Dim StateTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("StateTextbox"), TextBox)
        Dim CountryTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryTextbox"), TextBox)
        Dim ZipTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("ZipTextbox"), TextBox)
        Dim PhoneTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("PhoneTextbox"), TextBox)
        Dim WebsiteTextBox As TextBox = CType(CreateUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("WebsiteTextbox"), TextBox)


        Dim user As ProfileCommon = Profile.GetProfile(UserTextbox.Text)

        user.FullName = LibraryNameTextbox.Text
        user.Address = AddressTextBox.Text
        user.City = CityTextBox.Text
        user.State = StateTextBox.Text
        user.Country = CountryTextBox.Text
        user.Zip = ZipTextBox.Text
        user.Phone = PhoneTextBox.Text
        user.Website = WebsiteTextBox.Text
        user.IsLibrary = True

        user.Save()

        Roles.AddUserToRole(user.UserName, "Librarian")


    End Sub


End Class
