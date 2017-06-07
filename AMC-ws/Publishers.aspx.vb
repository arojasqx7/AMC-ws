Public Class Publishers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Dim t_publisher = New AMC_ws.DataSet2.publishersDataTable()
        Dim adapter = New AMC_ws.DataSet2TableAdapters.publishersTableAdapter()
        adapter.Insert(txtPublisher.Text, txtPerformance.Text)
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessAdded();", True)
        Response.Redirect("Publishers.aspx")
    End Sub

End Class