﻿Imports System.Data.SqlClient
Imports System.Security.Cryptography

Public Class project
    Inherits System.Web.UI.Page
#Region "Conn String"
    Dim connection As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"
#End Region

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        BindGridTracksInProject()

    End Sub

    Private Sub B_addfolder_Click(sender As System.Object, e As System.EventArgs) Handles B_addfolder.Click
#Region "Insert new project"
        Dim sqlConnection1 As New System.Data.SqlClient.SqlConnection(connection)
        Dim cmd As New System.Data.SqlClient.SqlCommand
        cmd.CommandType = System.Data.CommandType.Text
        cmd.CommandText = "INSERT INTO projects (projectName,fk_userID) VALUES ('" & T_newfolder.Text & "',(SELECT TOP 1 [users].[id] FROM [users] WHERE [users].[username] ='" & Session("Username") & "'))"
        cmd.Connection = sqlConnection1
        sqlConnection1.Open()
        cmd.ExecuteNonQuery()
        DD_project1.DataBind()
        'Reset()
        Response.Redirect("project.aspx")
        sqlConnection1.Close()
#End Region
    End Sub

    Protected Sub DD_project_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DD_project1.SelectedIndexChanged
        Me.GridProjects.DataBind()

    End Sub

    Protected Sub GridProjects_RowDeleting(sender As Object, e As EventArgs) Handles GridProjects.RowDeleting
        Me.DD_project1.DataBind()
        Me.DD_project1.Items.Insert(0, New ListItem("Choose Project", ""))
    End Sub

    Protected Sub BindGridTracksInProject()
        Dim sqlConnection1 As New System.Data.SqlClient.SqlConnection(connection)
        sqlConnection1.Open()
        Dim query As String = "SELECT [tracks].[title] FROM [tracks] JOIN [map_projects] ON [tracks].[id] = [map_projects].[fk_trackID] JOIN [projects] ON [map_projects].[fk_projectID] = [projects].[id] WHERE [projectName]='" & Me.DD_project1.SelectedValue & "' ORDER BY [tracks].[title]"
        Dim Adpt As New SqlDataAdapter(query, sqlConnection1)
        Dim ds As New DataSet()
        Adpt.Fill(ds)
        GridTracksInProject.DataSource = ds
        GridTracksInProject.DataBind()
        sqlConnection1.Close()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim sqlConnection1 As New System.Data.SqlClient.SqlConnection(connection)
        Dim cmd As New System.Data.SqlClient.SqlCommand
        cmd.CommandType = System.Data.CommandType.Text
        cmd.CommandText = "DELETE FROM [projects] WHERE [projectName] ='" & Me.DD_project1.SelectedValue & "'"
        cmd.Connection = sqlConnection1
        sqlConnection1.Open()
        cmd.ExecuteNonQuery()
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessDelete();", True)
        DD_project1.DataBind()
        Response.Redirect("project.aspx")
        sqlConnection1.Close()
    End Sub

    Protected Sub GridTracksInProject_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim sqlConnection1 As New System.Data.SqlClient.SqlConnection(connection)
        Dim cmd As New System.Data.SqlClient.SqlCommand
        cmd.CommandType = System.Data.CommandType.Text
        cmd.CommandText = "DELETE FROM [map_projects] WHERE [fk_trackID] ='" & Me.GridTracksInProject.SelectedValue & "'"
        cmd.Connection = sqlConnection1
        sqlConnection1.Open()
        cmd.ExecuteNonQuery()
        Response.Redirect("project.aspx")
        sqlConnection1.Close()
    End Sub

    'Protected Sub Button2_Click(sender As Object, e As EventArgs)
    '    Dim sqlConnection1 As New System.Data.SqlClient.SqlConnection(connection)
    '    Dim cmd As New System.Data.SqlClient.SqlCommand
    '    cmd.CommandType = System.Data.CommandType.Text
    '    cmd.CommandText = "DELETE FROM [map_projects] WHERE [title] ='" &  & "'"
    '    cmd.Connection = sqlConnection1
    '    sqlConnection1.Open()
    '    cmd.ExecuteNonQuery()
    '    ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessDelete();", True)
    '    DD_project1.DataBind()
    '    Response.Redirect("project.aspx")
    '    sqlConnection1.Close()
    'End Sub
End Class