
Partial Class Library_ManageRequests
    Inherits System.Web.UI.Page

    Protected Sub RequestDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles RequestDataSource.Selecting
        e.Command.Parameters("@LibraryID").Value = Membership.GetUser.ProviderUserKey
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub UpdateReportViewer()
        'You'll see me do this a lot, this DataView method of retrieving information. Out of all of 
        'the methods I tried, this was the most reliable way of getting specific information from
        'the results of a query. 
        Dim dview As Data.DataView
        dview = CType(RequestDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim LibraryFromProfile As ProfileCommon
        Dim LibraryToProfile As ProfileCommon

        If RequestDDL.SelectedIndex < 0 Then
            ReportViewer1.Visible = False
            RequestLabel.Text = "All requests have been shipped."
            RequestLabel.Visible = True


        Else
            'One difficulty with reports and profiles is that profile information is inaccessible through
            'report datasets. All retrieval of profile information has to be done outside of the report,
            'then passed in the form of a parameter. This means that this whole big chunk of code has to be processed
            'in order to access the profile information. 

            LibraryFromProfile = Profile.GetProfile(Membership.GetUser(dview.Table.Rows.Item(RequestDDL.SelectedIndex).Item("LibraryFromID")).UserName)
            LibraryToProfile = Profile.GetProfile(Membership.GetUser(dview.Table.Rows.Item(RequestDDL.SelectedIndex).Item("LibraryToID")).UserName)

            Dim MediaID As New Microsoft.Reporting.WebForms.ReportParameter("MediaID", CType(dview.Table.Rows.Item(RequestDDL.SelectedIndex).Item("MediaID"), Integer))
            ViewState("PatronID") = dview.Table.Rows.Item(RequestDDL.SelectedIndex).Item("PatronID")


            dview = CType(LinkLibraryPatronMediaSource.Select(DataSourceSelectArguments.Empty), Data.DataView)

            Dim LibraryCard As New Microsoft.Reporting.WebForms.ReportParameter("LibraryCard", CType(dview.Table.Rows.Item(0).Item("LibraryCard"), Integer))
            Dim LibraryFromName As New Microsoft.Reporting.WebForms.ReportParameter("LibraryFromName", LibraryFromProfile.FullName)
            Dim LibraryFromAddress As New Microsoft.Reporting.WebForms.ReportParameter("LibraryFromAddress", LibraryFromProfile.Address)
            Dim LibraryFromCityState As New Microsoft.Reporting.WebForms.ReportParameter("LibraryFromCityState", (LibraryFromProfile.City & ", " & LibraryFromProfile.State))
            Dim LibraryFromCountry As New Microsoft.Reporting.WebForms.ReportParameter("LibraryFromCountry", LibraryFromProfile.Country)
            Dim LibraryFromZip As New Microsoft.Reporting.WebForms.ReportParameter("LibraryFromZip", LibraryFromProfile.Zip)

            Dim LibraryToName As New Microsoft.Reporting.WebForms.ReportParameter("LibraryToName", LibraryToProfile.FullName)
            Dim LibraryToAddress As New Microsoft.Reporting.WebForms.ReportParameter("LibraryToAddress", LibraryToProfile.Address)
            Dim LibraryToCityState As New Microsoft.Reporting.WebForms.ReportParameter("LibraryToCityState", (LibraryToProfile.City & ", " & LibraryToProfile.State))
            Dim LibraryToCountry As New Microsoft.Reporting.WebForms.ReportParameter("LibraryToCountry", LibraryToProfile.Country)
            Dim LibraryToZip As New Microsoft.Reporting.WebForms.ReportParameter("LibraryToZip", LibraryToProfile.Zip)

            Dim parameterlist As New List(Of Microsoft.Reporting.WebForms.ReportParameter)
            parameterlist.Add(MediaID)
            parameterlist.Add(LibraryCard)
            parameterlist.Add(LibraryFromName)
            parameterlist.Add(LibraryFromAddress)
            parameterlist.Add(LibraryFromCityState)
            parameterlist.Add(LibraryFromCountry)
            parameterlist.Add(LibraryFromZip)
            parameterlist.Add(LibraryToName)
            parameterlist.Add(LibraryToAddress)
            parameterlist.Add(LibraryToCityState)
            parameterlist.Add(LibraryToCountry)
            parameterlist.Add(LibraryToZip)

            ReportViewer1.LocalReport.SetParameters(parameterlist)

            ReportViewer1.LocalReport.Refresh()
        End If
    End Sub

    Protected Sub RequestDDL_DataBound(sender As Object, e As System.EventArgs) Handles RequestDDL.DataBound
        UpdateReportViewer()
    End Sub

    Protected Sub RequestDDL_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RequestDDL.SelectedIndexChanged

        UpdateReportViewer()


    End Sub

    Protected Sub ShippedButton_Click(sender As Object, e As System.EventArgs) Handles ShippedButton.Click
        RequestDataSource.Update()

    End Sub

    Protected Sub RequestDataSource_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles RequestDataSource.Updating
        e.Command.Parameters("@RequestID").Value = RequestDDL.SelectedValue

    End Sub

    Protected Sub LinkLibraryPatronMediaSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkLibraryPatronMediaSource.Selecting
        e.Command.Parameters("@PatronID").Value = ViewState("PatronID")
    End Sub
End Class
                           