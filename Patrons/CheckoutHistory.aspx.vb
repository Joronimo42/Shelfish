
Partial Class Library_CheckoutResults
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            ReportViewer1.LocalReport.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CheckoutByCheckoutID", CheckoutByPatronID.Select()))

            'incredibly important, this has to be done if you want subreports to ever work in ASP.NET
            AddHandler ReportViewer1.LocalReport.SubreportProcessing, AddressOf Me.SubreportProcessingEventHandler
        End If





    End Sub

    Protected Sub SubreportProcessingEventHandler(sender As Object, e As Microsoft.Reporting.WebForms.SubreportProcessingEventArgs)



        ViewState("MediaID") = e.Parameters(0).Values(0)

        e.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("PublisherByMediaID", PublisherByMediaID.Select()))
        e.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("SubjectByMediaID", SubjectByMediaID.Select()))
        e.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CreatorByMediaID", CreatorByMediaID.Select()))

    End Sub




    Protected Sub SubreportSources_Selecting(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles PublisherByMediaID.Selecting, SubjectByMediaID.Selecting, CreatorByMediaID.Selecting
        e.InputParameters.Item("MediaID") = ViewState("MediaID")

    End Sub



    Protected Sub CheckoutByPatronID_Selecting(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles CheckoutByPatronID.Selecting
        e.InputParameters.Item("PatronID") = Membership.GetUser.ProviderUserKey

    End Sub


End Class
