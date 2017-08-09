Imports System.Data.SqlClient

Public Class ClientActivity
    Inherits System.Web.UI.Page

#Region "Conn String"
    Dim connection As String = "Data Source=andrey.sapiens.co.cr;Initial Catalog=AMC;User ID=sa;Password=sa.1.29"
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BindGridClientActivity()
        If (Session("fullname") IsNot Nothing) Then
            If Session("fullname") = "Admin1" Then
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

    Protected Sub btnApply_Click(sender As Object, e As EventArgs)
        GridClientActivity.Visible = True

    End Sub

    Protected Sub GridClientActivity_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim Dated1 As String = GridClientActivity.SelectedRow.Cells(0).Text
        Dim totalLogins1 As String = GridClientActivity.SelectedRow.Cells(1).Text
        'Dim Downloads1 As String = GridClientActivity.SelectedRow.Cells(2).Text
        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(1) {New DataColumn("Dated", GetType(String)),
                                               New DataColumn("Logins", GetType(String))})
        'New DataColumn("Downloads", GetType(String))})
        dt.Rows.Add(Dated1, totalLogins1)
        FormView1.DataSource = dt
        FormView1.DataBind()
        ScriptManager.RegisterStartupScript(Me, Page.GetType(), "Popup", "openModalUserInfo();", True)
    End Sub

    Protected Sub BindGridClientActivity()
        Dim sqlConnection1 As New SqlConnection(connection)
        sqlConnection1.Open()
        Dim query As String = "SELECT DISTINCT (CONVERT(VARCHAR(40),[userlogins].[dated],101)) AS Dated, COUNT([userlogins].[dated]) AS Logins FROM [userlogins] INNER JOIN [users] ON [userlogins].[userid] = [users].[id] WHERE ([users].[companyName] = '" & DropDownList1.SelectedItem.Text & "' AND Dated BETWEEN '" & txtDateFrom.Text & "' AND '" & txtDateTo.Text & "') GROUP BY CONVERT(VARCHAR(40),[userlogins].[dated],101) ORDER BY 1"
        Dim Adpt As New SqlDataAdapter(query, sqlConnection1)
        Dim ds As New DataSet()
        Adpt.Fill(ds)
        GridClientActivity.DataSource = ds
        GridClientActivity.DataBind()
        sqlConnection1.Close()
        ',(SELECT COUNT(md2.fk_userID) FROM [map_download] md2 JOIN [users] u2 ON (md2.fk_userID=u2.id) where u2.companyName='" & DropDownList1.SelectedItem.Text & "') as Downloads
    End Sub

End Class