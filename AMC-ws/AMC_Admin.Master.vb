﻿Imports System.IO

Public Class AMC_Admin
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim pageName As String = Path.GetFileName(Request.Path)
        If (Session("fullname") IsNot Nothing) Then
            Me.bt_login.Visible = False
            Me.bt_loginarrow.Visible = False
            Me.m_usuario.Visible = True
            Me.L_UserName.Text = Session("fullname")

        Else
            Me.m_usuario.Visible = False
        End If
    End Sub

    Protected Sub LB_Logout_Click(sender As Object, e As EventArgs) Handles LB_Logout.Click
        Session.Abandon()
        Session.RemoveAll()
        Response.Redirect("default.aspx")
    End Sub

End Class