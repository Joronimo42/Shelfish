
Partial Class Library_BrowseMedia
    Inherits System.Web.UI.Page

    'all fairly straightforward, uses the basic controls of the gridview control to access the list of media.
    'Shows buttons whenever a row is selected, hides them otherwise. 


    Protected Sub AddButton_Click(sender As Object, e As System.EventArgs) Handles AddButton.Click
        Response.Redirect("~/Library/Media/AddMedia.aspx")
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        EditButton.Visible = True
        Checkout.Visible = True
    End Sub

    Protected Sub EditButton_Click(sender As Object, e As System.EventArgs) Handles EditButton.Click
        Response.Redirect("~/Library/Media/AddMedia.aspx?MediaID=" & GridView1.SelectedDataKey.Item("MediaID").ToString)
    End Sub

    Protected Sub Checkout_Click(sender As Object, e As System.EventArgs) Handles Checkout.Click
        Response.Redirect("~/Library/Checkout.aspx?MediaID=" & GridView1.SelectedDataKey.Item("MediaID").ToString)
    End Sub



End Class
