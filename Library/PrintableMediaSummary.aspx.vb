
Partial Class Library_PrintableMediaSummary
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        'Out of everything in this project, this section probably gave me the biggest ulcer.
        'ASP.NET can be incredibly finicky when it comes to reports and subreports, and it took me forever
        'to make what you see here. 
        'Basically, in order to process a subreport, you have to add a function that handles the processing
        'of said subreport, and then, in that function, convert the results of your ObjectDataSource's Select
        'command into the form of a ReportDataSource. 
        'Here is the problem I faced. There is documentation on how to handle subreports, and even how to pass
        'parameters to subreports. However, after (quite literally) five hours of looking, I found nothing on how
        'to handle a subreport with parameters that was a part of a list (as in, each entry in the list had its 
        'own subreport with its own values, as can be seen here.)
        'The best advice that I found was that I should give up on the list in the parent report, and simply 
        'allow the user to select one MediaID in particular, and return that report only, passing the MediaID
        'parameter first to the parent report, and then to subsequent subreports.
        '
        'However, I am stubborn, and that is not how I wanted this report to work. I wanted a list of all of the 
        'Media, and gosh darnit, I was going to have it. So, I basically brute-forced my way through it.
        'By that I mean, I tried a dumb idea, tested it, saw it didn't work, then tried again.
        'I tried changing the names of my ObjectDataSources to match the Dataset within the report, I added the 
        'Datasets of the child reports to the parent report, all of which is still there, because I'm not quite 
        'sure which parts of it are neccessary. The breakthrough came whenever I added the line below, marked 
        '"HALLELUJAH". By passing the MediaID from the SubreportProcessingEventArgs to the ObjectSource_Selecting
        'subroutine, I got the specific records I needed, and the process was easily repeated for each individual
        'subreport. 
        AddHandler ReportViewer1.LocalReport.SubreportProcessing, AddressOf Me.SubreportProcessingEventHandler


    End Sub
    Protected Sub SubreportProcessingEventHandler(sender As Object, e As Microsoft.Reporting.WebForms.SubreportProcessingEventArgs)


        'HALLELUJAH, HOLY ****, where's the tylenol
        ViewState("MediaID") = e.Parameters(0).Values(0)

        e.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("PublisherByMediaID", PublisherByMediaID.Select()))
        e.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("SubjectByMediaID", SubjectByMediaID.Select()))
        e.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CreatorByMediaID", CreatorByMediaID.Select()))

    End Sub

    Protected Sub SubreportSources_Selecting(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles PublisherByMediaID.Selecting, SubjectByMediaID.Selecting, CreatorByMediaID.Selecting
        e.InputParameters.Item("MediaID") = ViewState("MediaID")

    End Sub


End Class
