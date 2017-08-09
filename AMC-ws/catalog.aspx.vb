Imports System.Data.SqlClient

Public Class catalog
    Inherits System.Web.UI.Page

    Dim connection As String = "Data Source=andrey.sapiens.co.cr;Initial Catalog=AMC;User ID=sa;Password=sa.1.29"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FillData()
    End Sub

    Sub FillData()
        'Dim T_cd = New AMC_ws.DataSet1TableAdapters.cdTableAdapter()
        'Dim W_cd = T_cd.GetData()
        'Me.GridView1.DataSource = W_cd
        'Me.GridView1.DataBind()
        Dim sqlConnection1 As New SqlConnection(connection)
        sqlConnection1.Open()
        Dim query As String = "SELECT id,cd_number,cd_title,descrip FROM [cd] WHERE IsPublished='Y'"
        Dim Adpt As New SqlDataAdapter(query, sqlConnection1)
        Dim ds As New DataSet()
        Adpt.Fill(ds)
        GridView1.DataSource = ds
        GridView1.DataBind()
        sqlConnection1.Close()
    End Sub

    Private Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        FillData()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub Label1_Click(sender As Object, e As EventArgs)
        Dim lno As LinkButton = sender
        Response.Redirect("album.aspx?idAlbum=" & lno.CommandArgument)
    End Sub
End Class