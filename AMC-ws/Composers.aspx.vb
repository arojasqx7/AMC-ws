Public Class Composers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Dim t_composer = New AMC_ws.DataSet2.composersDataTable()
        Dim adapter = New AMC_ws.DataSet2TableAdapters.composersTableAdapter()
        adapter.Insert(txtFirstName.Text, txtMiddleInitial.Text, txtLastName.Text, DropDownPublishers.SelectedItem.Value, txtBio.Text)
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessAdded();", True)
        Response.Redirect("Composers.aspx")
    End Sub
End Class