Imports System.Data.SqlClient

Public Class Users
    Inherits System.Web.UI.Page
#Region "Conn String"
    Dim IdPerson As Integer
    Dim connection As String = "Data Source=172.24.16.68\PROD;Initial Catalog=americanmusicco;User ID=amcuser;Password=amccma;"
#End Region

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

    Protected Sub DropUserType_SelectedIndexChanged(sender As Object, e As EventArgs)
        If DropUserType.SelectedValue <> 3 Then
            BindGridUsers()
        Else
            BindAllUsers()
        End If

    End Sub

    Protected Sub GridUserBlanket_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim id As String = GridUserBlanket.SelectedRow.Cells(0).Text
        IdPerson = id
        Dim UserCompany As String = GridUserBlanket.SelectedRow.Cells(1).Text
        Dim createdDate As String = GridUserBlanket.SelectedRow.Cells(2).Text
        Dim phone1 As String = GridUserBlanket.SelectedRow.Cells(3).Text
        Dim address1 As String = GridUserBlanket.SelectedRow.Cells(4).Text
        Dim username As String = GridUserBlanket.SelectedRow.Cells(5).Text
        Dim password As String = GridUserBlanket.SelectedRow.Cells(6).Text
        Dim accountPIN As String = GridUserBlanket.SelectedRow.Cells(7).Text
        Dim comments As String = GridUserBlanket.SelectedRow.Cells(8).Text
        Dim lastLogin As String = GridUserBlanket.SelectedRow.Cells(9).Text
        Dim totalLogins As String = GridUserBlanket.SelectedRow.Cells(10).Text
        Dim Downloads As String = GridUserBlanket.SelectedRow.Cells(11).Text
        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(11) {New DataColumn("id", GetType(String)),
                                               New DataColumn("UserCompany", GetType(String)),
                                               New DataColumn("ConvertedDate", GetType(String)),
                                               New DataColumn("phone1", GetType(String)),
                                               New DataColumn("address1", GetType(String)),
                                               New DataColumn("username", GetType(String)),
                                               New DataColumn("password", GetType(String)),
                                               New DataColumn("accountpin", GetType(String)),
                                               New DataColumn("comments", GetType(String)),
                                               New DataColumn("LastLogin", GetType(String)),
                                               New DataColumn("totalLogins", GetType(String)),
                                               New DataColumn("Downloads", GetType(String))})
        dt.Rows.Add(id, UserCompany, createdDate, phone1, address1, username, password, accountPIN, comments, lastLogin, totalLogins, Downloads)
        FormView1.DataSource = dt
        FormView1.DataBind()
        ScriptManager.RegisterStartupScript(Me, Page.GetType(), "Popup", "openModalUserInfo();", True)
    End Sub

    Protected Sub btnUpdateUserInfo_Click(sender As Object, e As EventArgs)
        Dim v_ID = CType(FormView1.Row.FindControl("lblID"), HiddenField)
        Dim DropUserTypeToUpdate = CType(FormView1.FindControl("DropUserTypeToUpdate"), DropDownList)
        Dim dropSt = CType(FormView1.FindControl("DropUserStatus"), DropDownList)
        Dim sqlConnection1 As New SqlClient.SqlConnection(connection)
        Dim cmd As New SqlClient.SqlCommand
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "UPDATE [users] SET [type] = '" & DropUserTypeToUpdate.SelectedItem.Value & "', [standing] = '" & dropSt.SelectedItem.Value & "' WHERE [id]='" & v_ID.Value & "'"
        cmd.Connection = sqlConnection1
        sqlConnection1.Open()
        cmd.ExecuteNonQuery()
        GridUserBlanket.DataBind()
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessUpdated();", True)
        sqlConnection1.Close()
    End Sub

    Protected Sub btnDeleteUser_Click(sender As Object, e As EventArgs)
        Dim v_ID = CType(FormView1.Row.FindControl("lblID"), HiddenField)
        Dim sqlConnection1 As New SqlClient.SqlConnection(connection)
        Dim cmd As New SqlClient.SqlCommand
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "DELETE FROM [users] WHERE [id]='" & v_ID.Value & "'"
        cmd.Connection = sqlConnection1
        sqlConnection1.Open()
        cmd.ExecuteNonQuery()
        GridUserBlanket.DataBind()
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessDeleted();", True)
        sqlConnection1.Close()
    End Sub

    Protected Sub BindGridUsers()
        Dim sqlConnection1 As New SqlConnection(connection)
        sqlConnection1.Open()
        Dim query As String = "SELECT distinct [users].[id],CONCAT([users].[companyName],' (', [users].[fullname],')') AS UserCompany,CONVERT(VARCHAR(40),[users].[timeStamped],101) AS ConvertedDate, phone1,address1,username,password,accountpin,comments, MAX(CONVERT(VARCHAR(10), [userlogins].[dated], 101)) as LastLogin, count([userlogins].[userid]) as totalLogins,(SELECT COUNT(md2.fk_userID) FROM [dbo].[map_download] md2 JOIN [dbo].[users] u2  on(md2.fk_userID=u2.id) where u2.type='" & DropUserType.SelectedValue & "') as Downloads FROM [users] INNER JOIN [userlogins] ON [users].[id] = [userlogins].[userid] WHERE ([users].[type] = '" & DropUserType.SelectedValue & "') group by [users].[id],CONCAT([users].[companyName],' (', [users].[fullname],')'),[users].[timeStamped],phone1,address1,username,password,accountpin,comments"
        Dim Adpt As New SqlDataAdapter(query, sqlConnection1)
        Dim ds As New DataSet()
        Adpt.Fill(ds)
        GridUserBlanket.DataSource = ds
        GridUserBlanket.DataBind()
        sqlConnection1.Close()
    End Sub

    Protected Sub BindAllUsers()
        Dim sqlConnection1 As New SqlConnection(connection)
        sqlConnection1.Open()
        Dim query As String = "SELECT distinct [users].[id],CONCAT([users].[companyName],' (', [users].[fullname],')') AS UserCompany,CONVERT(VARCHAR(40),[users].[timeStamped],101) AS ConvertedDate, phone1,address1,username,password,accountpin,comments, MAX(CONVERT(VARCHAR(10), [userlogins].[dated], 101)) as LastLogin, count([userlogins].[userid]) as totalLogins,(SELECT COUNT(md2.fk_userID) FROM [map_download] md2 JOIN [dbo].[users] u2  on(md2.fk_userID=u2.id) where u2.type='" & DropUserType.SelectedValue & "') as Downloads FROM [users] INNER JOIN [userlogins] ON [users].[id] = [userlogins].[userid] where [users].[companyName] <> 'AMC' group by [users].[id],CONCAT([users].[companyName],' (', [users].[fullname],')'),[users].[timeStamped],phone1,address1,username,password,accountpin,comments"
        Dim Adpt As New SqlDataAdapter(query, sqlConnection1)
        Dim ds As New DataSet()
        Adpt.Fill(ds)
        GridUserBlanket.DataSource = ds
        GridUserBlanket.DataBind()
        sqlConnection1.Close()
    End Sub

    Protected Sub GridUserBlanket_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridUserBlanket.PageIndex = e.NewPageIndex
        If DropUserType.SelectedItem.Text <> "View All" Then
            BindGridUsers()
        Else
            BindAllUsers()
        End If
    End Sub
End Class