﻿Public Class Publishers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("fullname") IsNot Nothing) Then
            If Session("fullname") = "Mitchel Greenspan" Then
                Me.L_UserName.Text = Session("fullname")
                Me.L_UserName.Visible = False
            Else
                Response.Redirect("UnauthorizedAccess.aspx")
            End If
        Else
            Me.L_UserName.Visible = False
            Response.Redirect("UnauthorizedAccess.aspx")
        End If
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Dim t_publisher = New AMC_ws.DataSet2.publishersDataTable()
        Dim adapter = New AMC_ws.DataSet2TableAdapters.publishersTableAdapter()
        adapter.Insert(txtPublisher.Text, txtPerformance.Text)
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessAdded();", True)
        Response.Redirect("Publishers.aspx")
    End Sub

End Class