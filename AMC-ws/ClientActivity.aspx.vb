Imports System.Data.SqlClient

Public Class ClientActivity
    Inherits System.Web.UI.Page

#Region "Conn String"
    Dim connection As String = "Server=172.24.16.68\PROD;Database=americanmusicco;User Id=amcuser;Password=amccma;"
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
#Region "Page load code"
        BindGridClientActivity()
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
#End Region
    End Sub

    Protected Sub btnApply_Click(sender As Object, e As EventArgs)
        GridClientActivity.Visible = True
    End Sub

    Protected Sub GridClientActivity_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim Dated1 As String = GridClientActivity.SelectedRow.Cells(0).Text
        Dim CompanyName1 As String = GridClientActivity.SelectedRow.Cells(1).Text
        Dim totalLogins1 As String = GridClientActivity.SelectedRow.Cells(2).Text
        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(2) {New DataColumn("Dated", GetType(String)),
                                               New DataColumn("CompanyName", GetType(String)),
                                               New DataColumn("Logins", GetType(String))})
        dt.Rows.Add(Dated1, CompanyName1, totalLogins1)
        FormView1.DataSource = dt
        FormView1.DataBind()
        ScriptManager.RegisterStartupScript(Me, Page.GetType(), "Popup", "openModalUserInfo();", True)
    End Sub

    Protected Sub BindGridClientActivity()
#Region "BindGrid"
        Dim sqlConnection1 As New SqlConnection(connection)
        sqlConnection1.Open()
        Dim query As String = "SELECT DISTINCT (CONVERT(VARCHAR(40),[userlogins].[dated],101)) AS Dated, [users].companyName AS CompanyName, COUNT([userlogins].[dated]) AS Logins FROM [userlogins] INNER JOIN [users] ON [userlogins].[userid] = [users].[id] WHERE ([users].[companyName] = '" & DropDownList1.SelectedItem.Text & "' AND Dated BETWEEN '" & txtDateFrom.Text & "' AND '" & txtDateTo.Text & "') GROUP BY CONVERT(VARCHAR(40),[userlogins].[dated],101),[users].companyName ORDER BY 1"
        Dim Adpt As New SqlDataAdapter(query, sqlConnection1)
        Dim ds As New DataSet()
        Adpt.Fill(ds)
        GridClientActivity.DataSource = ds
        GridClientActivity.DataBind()
        sqlConnection1.Close()
#End Region
    End Sub

    Protected Sub BindGridClientActivityAll()
#Region "BindGrid"
        Dim sqlConnection1 As New SqlConnection(connection)
        sqlConnection1.Open()
        Dim query As String = "SELECT DISTINCT (CONVERT(VARCHAR(40),[userlogins].[dated],101)) AS Dated, COUNT([userlogins].[dated]) AS Logins FROM [userlogins] INNER JOIN [users] ON [userlogins].[userid] = [users].[id] WHERE Dated BETWEEN '" & txtDateFrom.Text & "' AND '" & txtDateTo.Text & "' GROUP BY Dated ORDER BY 1"
        Dim Adpt As New SqlDataAdapter(query, sqlConnection1)
        Dim ds As New DataSet()
        Adpt.Fill(ds)
        GridClientActivity.DataSource = ds
        GridClientActivity.DataBind()
        sqlConnection1.Close()
#End Region
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs)
        If DropDownList1.SelectedValue <> "All" Then
            GridClientActivity.Visible = True
            TblHeader.Visible = True
            lblCompanyName.Visible = True
            lblCompanyName.Text = DropDownList1.SelectedItem.Text
            BindGridClientActivity()
        ElseIf DropDownList1.SelectedValue = "Neutro" Then
            GridClientActivity.Visible = False
        Else
            GridClientActivity.Visible = True
            BindGridClientActivityAll()
        End If
    End Sub

    Protected Sub GridClientActivity_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridClientActivity.PageIndex = e.NewPageIndex
        GridClientActivity.DataBind()
    End Sub
End Class