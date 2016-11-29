
Partial Class Library_EditPatronAccount
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        ViewState("LibraryCard") = Request.QueryString("LibraryCard")
        CardNumberLabel.Text = ViewState("LibraryCard")
        Dim PatronProfile As New ProfileBase

        If Not Page.IsPostBack Then
            Dim LibraryProfile As ProfileBase
            LibraryProfile = Profile.GetProfile(Membership.GetUser.UserName)
            LibraryNameLabel.Text = LibraryProfile.GetPropertyValue("FullName")

            Dim dview As New Data.DataView
            dview = CType(LinkLibraryPatronDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)

            ViewState("PatronID") = CType(dview.Table.Rows.Item(0).Item("PatronID"), Guid)
            ViewState("LateFees") = CType(dview.Table.Rows.Item(0).Item("LateFees"), Decimal)
            PatronProfile = Profile.GetProfile(Membership.GetUser(ViewState("PatronID")).UserName)
            NameLabel.Text = PatronProfile.GetPropertyValue("FullName")
            AddressTextbox.Text = PatronProfile.GetPropertyValue("Address")
            CityTextbox.Text = PatronProfile.GetPropertyValue("City")
            StateTextbox.Text = PatronProfile.GetPropertyValue("State")
            CountryTextbox.Text = PatronProfile.GetPropertyValue("Country")
            ZipTextbox.Text = PatronProfile.GetPropertyValue("Zip")
            PhoneTextbox.Text = PatronProfile.GetPropertyValue("Phone")
            LateFeesTextbox.Text = ViewState("LateFees")

        End If


        
    End Sub
    Protected Sub SaveButton_Click(sender As Object, e As System.EventArgs) Handles SaveButton.Click

        Dim PatronProfile As New ProfileBase
        PatronProfile = ProfileBase.Create(Membership.GetUser(ViewState("PatronID")).UserName)


        PatronProfile.SetPropertyValue("Address", AddressTextbox.Text)
        PatronProfile.SetPropertyValue("City", CityTextbox.Text)
        PatronProfile.SetPropertyValue("State", StateTextbox.Text)
        PatronProfile.SetPropertyValue("Country", CountryTextbox.Text)
        PatronProfile.SetPropertyValue("Zip", ZipTextbox.Text)
        PatronProfile.SetPropertyValue("Phone", PhoneTextbox.Text)

        PatronProfile.Save()

        ViewState("LateFees") = LateFeesTextbox.Text


        LinkLibraryPatronDataSource.Update()


        SavedLabel.Visible = True



    End Sub

    Protected Sub LinkLibraryPatronDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkLibraryPatronDataSource.Selecting
        e.Command.Parameters("@LibraryCard").Value = ViewState("LibraryCard")
    End Sub

    Protected Sub LinkLibraryPatronDataSource_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkLibraryPatronDataSource.Updating
        e.Command.Parameters("@LibraryCard").Value = ViewState("LibraryCard")
        e.Command.Parameters("@LateFees").Value = ViewState("LateFees")

    End Sub
End Class
