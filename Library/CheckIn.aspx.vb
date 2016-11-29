
Partial Class Library_Checkout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub CheckoutDataSource_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles CheckoutDataSource.Deleting
        e.Command.Parameters("@PatronID").Value = ViewState("PatronID")
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
    End Sub





    Protected Sub NextButton_Click() Handles NextButton.Click

        ViewState("MediaID") = MediaIDTextbox.Text




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
        dview = CType(LinkLibraryPatronDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
        ViewState("PatronID") = CType(dview.Table.Rows.Item(0).Item("PatronID"), Guid)
        ViewState("LateFees") = CType(dview.Table.Rows.Item(0).Item("LateFees"), Decimal)



        'calculates late fees, based on 0.25 a day charge
        dview = CType(CheckoutDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
        ViewState("DueDate") = CType(dview.Table.Rows.Item(0).Item("DueDate"), Date)
        Dim difference As Long
        difference = DateDiff(DateInterval.Day, Today, ViewState("DueDate"))
        If difference < 0 Then
            ViewState("LateFees") = (ViewState("LateFees") + (difference * -1 * 0.25))
            LinkLibraryPatronDataSource.Update()
        End If


        dview = CType(LinkLibraryMediaDataSource.Select(DataSourceSelectArguments.Empty), Data.DataView)
        ViewState("LibraryMediaID") = CType(dview.Table.Rows.Item(0).Item("LibraryMediaID"), Integer)
        ViewState("QtyAvailable") = CType(dview.Table.Rows.Item(0).Item("QtyAvailable"), Integer)


        CheckoutDataSource.Delete()

        LinkLibraryMediaDataSource.Update()

        ErrorLabel.Text = "Patron owes $" & ViewState("LateFees") & "."
        ErrorLabel.Visible = True

        LibraryResultLabel.Text = LibraryCardTextbox.Text

        LibraryCardTextbox.Visible = False
        LibraryResultLabel.Visible = True

        FinishButton.Visible = False




    End Sub

    Protected Sub LinkLibraryMediaDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkLibraryMediaDataSource.Selecting
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
        e.Command.Parameters("@LibraryID").Value = Membership.GetUser.ProviderUserKey
    End Sub

    Protected Sub LinkLibraryMediaDataSource_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkLibraryMediaDataSource.Updating
        e.Command.Parameters("@LibraryID").Value = Membership.GetUser.ProviderUserKey
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
        e.Command.Parameters("@QtyAvailable").Value = ViewState("QtyAvailable") + 1
        e.Command.Parameters("@LibraryMediaID").Value = ViewState("LibraryMediaID")
    End Sub

    Protected Sub CheckoutDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles CheckoutDataSource.Selecting
        e.Command.Parameters("@MediaID").Value = ViewState("MediaID")
        e.Command.Parameters("@PatronID").Value = ViewState("PatronID")
    End Sub

    Protected Sub SqlDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles LinkLibraryPatronDataSource.Selecting
        e.Command.Parameters("@LibraryCard").Value = LibraryCardTextbox.Text
    End Sub

    Protected Sub LinkLibraryPatronDataSource_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles LinkLibraryPatronDataSource.Updating
        e.Command.Parameters("@LibraryCard").Value = LibraryCardTextbox.Text
        e.Command.Parameters("@LateFees").Value = ViewState("LateFees")
    End Sub
End Class
