Public Class ClientActivity
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnApply_Click(sender As Object, e As EventArgs)
        GridClientActivity.Visible = True

    End Sub
End Class