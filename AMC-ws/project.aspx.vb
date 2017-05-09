Public Class project
    Inherits System.Web.UI.Page

    Private Sub B_addfolder_Click(sender As System.Object, e As System.EventArgs) Handles B_addfolder.Click
        Dim connection As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"
        Dim sqlConnection1 As New System.Data.SqlClient.SqlConnection(connection)

        Dim cmd As New System.Data.SqlClient.SqlCommand
        cmd.CommandType = System.Data.CommandType.Text
        cmd.CommandText = "INSERT INTO projects (projectName) VALUES ('" & T_newfolder.Text & "')"
        cmd.Connection = sqlConnection1

        sqlConnection1.Open()
        cmd.ExecuteNonQuery()
        DD_project.DataBind()
        Reset()
        Response.Redirect("project.aspx")
        sqlConnection1.Close()
    End Sub

End Class