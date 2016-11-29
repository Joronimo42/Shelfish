
Partial Class Library_Media_AddMedia
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load



        'I know the page title is "Add Media", but it also handles editing it as well.
        'Probably should have named it differently, but, oh well, it works. 
        'Anyway, this checks for a MediaID provided in the QueryString, to tell if it needs to 
        'insert or update the information. 
        If Not (Request.QueryString("MediaID") Is Nothing) Then

            ViewState("MediaID") = Request.QueryString("MediaID")

            'For reasons I still don't fully understand, every page has to check if the 
            'page is posting back or not, otherwise none of the insert or update or delete
            'queries will work. 
            If Not (Page.IsPostBack) Then

                Dim dview As New Data.DataView
                dview = CType(EditingMediaDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
                ISBNTextbox.Text = CType(dview.Table.Rows.Item(0).Item("ISBN"), String)
                TitleTextbox.Text = CType(dview.Table.Rows.Item(0).Item("Title"), String)
                DescriptionTextbox.Text = CType(dview.Table.Rows.Item(0).Item("Description"), String)
                FormatDDL.SelectedValue = CType(dview.Table.Rows.Item(0).Item("FormatID"), String)

                dview = CType(LinkLibraryMediaDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
                If dview.Table.Rows.Count > 0 Then
                    ViewState("QtyUpdate") = True
                    QtyOwnedTextbox.Text = CType(dview.Table.Rows.Item(0).Item("QtyOwned"), String)
                    ViewState("LinkMediaKey") = CType(dview.Table.Rows.Item(0).Item("LibraryMediaID"), Integer)
                Else
                    ViewState("QtyUpdate") = False
                End If

            End If
        Else
            ViewState("MediaID") = -1
        End If
    End Sub


    'This is just a little seperate data source for retrieving the Media information in the 
    'case that this is an update, rather than an insert.
    '(I used the main SqlDataSource's select query for retrieving the Format information, so
    'I needed a second query to get this information, and I'm far too lazy to type out all
    'the relevant commands for generating an SQL query, so, instead, second SqlDataSource it is.)
    Protected Sub EditingMediaDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles EditingMediaDataSource.Selecting
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
    End Sub

    Protected Sub NextButton_Click(sender As Object, e As System.EventArgs) Handles NextButton.Click
        'Since the MediaID defaults to -1, this checks for whether this Media already exists or not.
        'I got the idea from the basic VB Windows Forms Applications, which do something similar.



        If ViewState("MediaID") < 0 Then
            SqlDataSource.Insert()
            LinkLibraryMediaDataSource.Insert()
        Else
            If ViewState("MediaID") > 0 Then
                SqlDataSource.Update()
                If (ViewState("QtyUpdate") = True) Then
                    LinkLibraryMediaDataSource.Update()
                Else
                    LinkLibraryMediaDataSource.Insert()
                End If
            End If
        End If



        'Moves the user to the next step in the process
        Response.Redirect("LinkMediaCreator.aspx?MediaID=" & ViewState("MediaID").ToString)

    End Sub

    'Places the data from the form into the query.
    Protected Sub SqlDataSource_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource.Updating
        e.Command.Parameters("@ISBN").Value = ISBNTextbox.Text
        e.Command.Parameters("@FormatID").Value = FormatDDL.SelectedValue
        e.Command.Parameters("@Title").Value = TitleTextbox.Text
        e.Command.Parameters("@Description").Value = DescriptionTextbox.Text
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
    End Sub
    

    Protected Sub SqlDataSource_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource.Inserting

        e.Command.Parameters("@ISBN").Value = ISBNTextbox.Text
        e.Command.Parameters("@FormatID").Value = FormatDDL.SelectedValue
        e.Command.Parameters("@Title").Value = TitleTextbox.Text
        e.Command.Parameters("@Description").Value = DescriptionTextbox.Text

    End Sub


    'This retrieves the MediaID from the freshly inserted data, and passes it to the next form 
    'via the QueryString.
    Protected Sub SqlDataSource_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource.Inserted

        ViewState("MediaID") = e.Command.Parameters("@PK").Value

        'Had some issues with retriving the MediaID, this is a relic from debugging.
        'Keeping it here for both documentation and convienience, if it starts acting up again.
        'DebugLabel.Text = MediaID


    End Sub
    
    Protected Sub LinkLibraryMediaDataSource_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkLibraryMediaDataSource.Inserting
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
        e.Command.Parameters("@LibraryID").Value = Membership.GetUser().ProviderUserKey
        e.Command.Parameters("@QtyOwned").Value = QtyOwnedTextbox.Text
    End Sub



    Protected Sub LinkLibraryMediaDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkLibraryMediaDataSource.Selecting
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
        e.Command.Parameters("@LibraryID").Value = Membership.GetUser().ProviderUserKey
    End Sub

    Protected Sub LinkLibraryMediaDataSource_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkLibraryMediaDataSource.Updating
        e.Command.Parameters("@LibraryMediaID").Value = ViewState("LinkMediaKey")
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
        e.Command.Parameters("@LibraryID").Value = Membership.GetUser().ProviderUserKey
        e.Command.Parameters("@QtyOwned").Value = QtyOwnedTextbox.Text
    End Sub


End Class
