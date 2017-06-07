Public Class CDsTracks
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Dim t_CD = New AMC_ws.DataSet2.cdDataTable()
        Dim adapter = New AMC_ws.DataSet2TableAdapters.cdTableAdapter()
        adapter.Insert(txtCatalogNo.Text, txtCDTitle.Text, DropDownPublishers.SelectedItem.Value, txtDesc.Text)
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessAdded();", True)
        Response.Redirect("CDsTracks.aspx")
    End Sub

    Protected Sub btnAddTracktoBD_Click(sender As Object, e As EventArgs)
        Dim t_tracks = New AMC_ws.DataSet2.tracksDataTable()
        Dim adapter = New AMC_ws.DataSet2TableAdapters.tracksTableAdapter()
        adapter.Insert(DropCD2.SelectedItem.Value, txtTrackNo.Text, txtTrackTitle.Text, txtDescTrack.Text, txtStyleLikes.Text, txtKeywords.Text, txtInstruments.Text)
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessAdded();", True)
        Response.Redirect("CDsTracks.aspx")
    End Sub
End Class