Imports System.Data.SqlClient

Public Class Users
    Inherits System.Web.UI.Page

#Region "Conn String"
    Dim IdPerson As Integer
    Dim connection As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"
#End Region
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub DropUserType_SelectedIndexChanged(sender As Object, e As EventArgs)
        BindGridUsers()
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

        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(9) {New DataColumn("id", GetType(String)),
                                               New DataColumn("UserCompany", GetType(String)),
                                               New DataColumn("ConvertedDate", GetType(Date)),
                                               New DataColumn("phone1", GetType(String)),
                                               New DataColumn("address1", GetType(String)),
                                               New DataColumn("username", GetType(String)),
                                               New DataColumn("password", GetType(String)),
                                               New DataColumn("accountpin", GetType(String)),
                                               New DataColumn("comments", GetType(String)),
                                               New DataColumn("LastLogin", GetType(String))})
        dt.Rows.Add(id, UserCompany, createdDate, phone1, address1, username, password, accountPIN, comments, lastLogin)
        FormView1.DataSource = dt
        FormView1.DataBind()
        ScriptManager.RegisterStartupScript(Me, Page.GetType(), "Popup", "openModalUserInfo();", True)
    End Sub

    Protected Sub btnUpdateUserInfo_Click(sender As Object, e As EventArgs)
        Dim v_ID = CType(FormView1.Row.FindControl("lblID"), HiddenField)
        Dim dropUT = CType(FormView1.FindControl("DropUserTypeToUpdate"), DropDownList)
        Dim dropSt = CType(FormView1.FindControl("DropUserStatus"), DropDownList)
        Dim sqlConnection1 As New SqlClient.SqlConnection(connection)
        Dim cmd As New SqlClient.SqlCommand
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "UPDATE [users] SET [type] = '" & dropUT.SelectedItem.Value & "', [standing] = '" & dropSt.SelectedItem.Value & "' WHERE [id]='" & v_ID.Value & "'"
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
        Dim query As String = "SELECT [users].[id],CONCAT([users].[companyName],' (', [users].[fullname],')') AS UserCompany, [users].[timeStamped] AS ConvertedDate, phone1,address1,username,password,accountpin,comments, (SELECT TOP 1 [userlogins].[dated] FROM [userlogins] WHERE [userlogins].[userid] = '" & IdPerson & "' ORDER BY 1 DESC) AS LastLogin FROM [users] INNER JOIN [userlogins] ON [users].[id] = [userlogins].[userid] WHERE ([users].[type] = '" & DropUserType.SelectedValue & "')"
        Dim Adpt As New SqlDataAdapter(query, sqlConnection1)
        Dim ds As New DataSet()
        Adpt.Fill(ds)
        GridUserBlanket.DataSource = ds
        GridUserBlanket.DataBind()
        sqlConnection1.Close()
    End Sub

End Class