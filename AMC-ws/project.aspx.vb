Imports System.Data.SqlClient

Public Class project
    Inherits System.Web.UI.Page
#Region "Conn String"
    Dim connection As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"
#End Region

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
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
    End Sub
End Class