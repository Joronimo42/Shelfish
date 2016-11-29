
Partial Class Library_Checkout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Not (Request.QueryString("MediaID") Is Nothing) Then
                ViewState("MediaID") = Request.QueryString("MediaID")
                NextButton_Click()

            Else

                ViewState("MediaID") = Nothing


            End If
        End If

    End Sub

    Protected Sub CheckoutDataSource_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles CheckoutDataSource.Inserted
        ViewState("CheckoutID") = e.Command.Parameters("@PK").Value
    End Sub

    Protected Sub CheckoutDataSource_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles CheckoutDataSource.Inserting
        e.Command.Parameters("@DueDate").Value = Today.AddDays(14)
        e.Command.Parameters("@PatronID").Value = ViewState("PatronID")
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")

    End Sub

    Protected Sub NextButton_Click() Handles NextButton.Click
        If ViewState("MediaID") Is Nothing Then
            ViewState("MediaID") = MediaIDTextbox.Text
        End If



        MediaIDTextbox.Visible = False
        MediaResultLabel.Text = ViewState("MediaID")
        MediaResultLabel.Visible = True

        NextButton.Visible = False

        FinishButton.Visible = True
        LibraryCardLabel.Visible = True
        LibraryCardTextbox.Visible = True

    End Sub

    Protected Sub FinishButton_Click(sender As Object, e As System.EventArgs) Handles FinishButton.Click



        Dim dview As New Data.DataView
        dview = CType(CheckoutDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
        ViewState("PatronID") = CType(dview.Table.Rows.Item(0).Item("PatronID"), Guid)

        dview = CType(LinkLibraryMediaDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
        ViewState("LibraryMediaID") = CType(dview.Table.Rows.Item(0).Item("LibraryMediaID"), Integer)
        ViewState("QtyAvailable") = CType(dview.Table.Rows.Item(0).Item("QtyAvailable"), Integer)

        If ViewState("QtyAvailable") <= 0 Then
            ErrorLabel.Visible = True

        Else
            CheckoutDataSource.Insert()


            LinkLibraryMediaDataSource.Update()

            Response.Redirect("CheckoutResults.aspx?CheckoutID=" & ViewState("CheckoutID").ToString)
        End If



    End Sub

    Protected Sub LinkLibraryMediaDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkLibraryMediaDataSource.Selecting
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
        e.Command.Parameters("@LibraryID").Value = Membership.GetUser.ProviderUserKey
    End Sub

    Protected Sub LinkLibraryMediaDataSource_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkLibraryMediaDataSource.Updating
        e.Command.Parameters("@LibraryID").Value = Membership.GetUser.ProviderUserKey
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
        e.Command.Parameters("@QtyAvailable").Value = ViewState("QtyAvailable") - 1
        e.Command.Parameters("@LibraryMediaID").Value = ViewState("LibraryMediaID")
    End Sub

    Protected Sub CheckoutDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles CheckoutDataSource.Selecting
        e.Command.Parameters("@LibraryCard").Value = LibraryCardTextbox.Text
    End Sub
End Class
