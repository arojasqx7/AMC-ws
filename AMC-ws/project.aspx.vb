﻿Imports System.Data.SqlClient
Imports System.Security.Cryptography

Public Class project
    Inherits System.Web.UI.Page
#Region "Conn String"
    Dim connection As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"
#End Region
    Dim dt As New DataTable()

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        BindGridTracksInProject()

    End Sub

    Private Sub B_addfolder_Click(sender As System.Object, e As System.EventArgs) Handles B_addfolder.Click
        Dim conn As SqlConnection = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;")
        Dim conn2 As SqlConnection = New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;")
        If Me.T_newfolder.Text = "" Then
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ValidateEmptyFolder();", True)
        Else
            conn.Open()
            Dim theQuery As String = "SELECT * FROM projects WHERE projectName=@projectName AND fk_userID = (SELECT TOP 1 [users].[id] FROM [users] WHERE [users].[username] = @userName)"
            Dim cmd1 As SqlCommand = New SqlCommand(theQuery, conn)
            cmd1.Parameters.AddWithValue("@projectName", T_newfolder.Text)
            cmd1.Parameters.AddWithValue("@userName", Session("Username"))

            Using reader As SqlDataReader = cmd1.ExecuteReader()
                If reader.HasRows Then
                    ' Project already exists
                    ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ProjectExists();", True)
                    conn.Close()
                Else
                    conn2.Open()
                    Dim cmd As SqlCommand = New SqlCommand("INSERT INTO projects (projectName,fk_userID) VALUES ('" & T_newfolder.Text & "',(SELECT TOP 1 [users].[id] FROM [users] WHERE [users].[username] ='" & Session("Username") & "'))", conn2)
                    cmd.ExecuteNonQuery()
                    DD_project1.DataBind()
                    Response.Redirect("project.aspx")
                    conn2.Close()
                End If
            End Using

        End If
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
        Dim query As String = "SELECT [map_projects].[fk_trackID],[tracks].[title] FROM [tracks] JOIN [map_projects] ON [tracks].[id] = [map_projects].[fk_trackID] JOIN [projects] ON [map_projects].[fk_projectID] = [projects].[id] JOIN [users] ON [projects].[fk_userID] = [users].[id] WHERE [projectName]='" & Me.DD_project1.SelectedValue & "' AND [users].[username] ='" & Session("Username") & "' ORDER BY [tracks].[title]"
        Dim Adpt As New SqlDataAdapter(query, sqlConnection1)
        Dim ds As New DataSet()
        Adpt.Fill(ds)
        'ViewState("dt") = query
        GridTracksInProject.DataSource = ds
        GridTracksInProject.DataBind()
        sqlConnection1.Close()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim sqlConnection1 As New System.Data.SqlClient.SqlConnection(connection)
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Dim cmd2 As New System.Data.SqlClient.SqlCommand
        cmd.CommandType = System.Data.CommandType.Text
        cmd2.CommandType = System.Data.CommandType.Text
        cmd2.CommandText = "DELETE FROM [map_projects] WHERE [map_projects].[fk_projectID] = (SELECT TOP 1 [projects].[id] FROM [projects] WHERE [projects].[projectName] ='" & Me.DD_project1.SelectedValue & "') AND [map_projects].[fk_userID] = (SELECT TOP 1 [users].[id] FROM [users] WHERE [users].[username] = '" & Session("Username") & "')"
        cmd.CommandText = "DELETE FROM [projects] WHERE [projectName] ='" & Me.DD_project1.SelectedValue & "' AND [fk_userID] = (SELECT TOP 1 [users].[id] FROM [users] WHERE [users].[username] = '" & Session("Username") & "')"
        cmd2.Connection = sqlConnection1
        cmd.Connection = sqlConnection1
        sqlConnection1.Open()
        cmd2.ExecuteNonQuery()
        cmd.ExecuteNonQuery()
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessDelete();", True)
        DD_project1.DataBind()
        Response.Redirect("project.aspx")
        sqlConnection1.Close()
    End Sub

    Protected Sub GridTracksInProject_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim trackId As Integer = Me.GridTracksInProject.DataKeys(e.RowIndex).Value
        Dim sqlConnection1 As New System.Data.SqlClient.SqlConnection(connection)
        Dim cmd As New System.Data.SqlClient.SqlCommand
        cmd.CommandType = System.Data.CommandType.Text
        cmd.CommandText = "DELETE FROM [map_projects] WHERE [map_projects].[fk_trackID] = '" & trackId & "' AND [map_projects].[fk_userID] = (SELECT TOP 1 [users].[id] FROM [users] WHERE [users].[username] ='" & Session("Username") & "')"
        cmd.Connection = sqlConnection1
        sqlConnection1.Open()
        cmd.ExecuteNonQuery()
        Response.Redirect("project.aspx")
        sqlConnection1.Close()

    End Sub

    Protected Sub GridTracksInProject_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim item As String = e.Row.Cells(0).Text
            For Each button As Button In e.Row.Cells(1).Controls.OfType(Of Button)()
                If button.CommandName = "Delete" Then
                    button.Attributes("onclick") = "if(!confirm('Do you want to delete " + item + "?')){ return false; };"
                End If
            Next
        End If
    End Sub
End Class