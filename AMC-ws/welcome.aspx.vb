Public Class welcome
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("fullname") Is Nothing) Then
            Response.Redirect("default.aspx")
        End If
        Me.L_fullname.Text = Session("fullname")
    End Sub

End Class