Imports System.IO

Public Class AMC_Admin
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim pageName As String = Path.GetFileName(Request.Path)

        If (Session("fullname") IsNot Nothing) Then
            If Session("fullname") = "Admin1" Then
                Me.bt_login.Visible = False
                Me.bt_loginarrow.Visible = False
                Me.m_usuario.Visible = True
                Me.L_UserName.Text = Session("fullname")
                LB_Logout2.Visible = True
            Else
                Response.Redirect("UnauthorizedAccess.aspx")
            End If
        Else
            Me.m_usuario.Visible = False
        End If
    End Sub

    Protected Sub LB_Logout2_Click(sender As Object, e As EventArgs)
        Session.Abandon()
        Session.RemoveAll()
        Response.Redirect("default.aspx")
    End Sub
End Class