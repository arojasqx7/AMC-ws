Public Class myinfo
    Inherits System.Web.UI.Page
    Dim w_type As Integer
    Dim w_standing As Integer
    Dim w_comments As Integer
    Dim w_Original_id As Long
    Dim connection As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim t_user = New AMC_ws.DataSet1.usersDataTable()
        Dim adapter = New AMC_ws.DataSet1TableAdapters.usersTableAdapter()

        If Session("pinit") <> "X" Then
            Response.Redirect("default.aspx")

        Else
            If Page.IsPostBack Then
            Else
#Region "Load User Info"
                adapter.FillByusername(t_user, Session("username"))
                Me.L_infoName.Text = t_user(0).fname
                Me.L_infoLast.Text = t_user(0).lname
                Me.Tfname.Text = t_user(0).fname
                Me.Tlname.Text = t_user(0).lname
                Me.Tcompany.Text = t_user(0).companyName
                Me.Taddress1.Text = t_user(0).address1
                Me.Taddress2.Text = t_user(0).address2
                Me.Tcity.Text = t_user(0).city
                Me.Tstate.Text = t_user(0).state
                Me.DLcountry.Text = t_user(0).country
                Me.Tzip.Text = t_user(0).zip
                Me.Temail.Text = t_user(0).email
                Me.Tphone1.Text = t_user(0).phone1
                Me.Tphone2.Text = t_user(0).phone2
                Me.Tusern.Text = t_user(0).username

                w_type = t_user(0).type
                w_standing = t_user(0).type
                w_comments = t_user(0).type
                w_Original_id = t_user(0).type

                Me.Tpassword1.Attributes.Add("value", t_user(0).password)
                Me.Tpassword2.Attributes.Add("value", t_user(0).password)
                Me.Tpin1.Attributes.Add("value", t_user(0).accountpin)
                Me.Tpin2.Attributes.Add("value", t_user(0).accountpin)
#End Region
            End If

        End If
    End Sub

    Private Sub B_update_Click(sender As Object, e As EventArgs) Handles B_update.Click

        If Me.Tpassword1.Text <> Me.Tpassword2.Text Then
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "PassVerify();", True)
            Exit Sub
        End If

#Region "Update Code"
        Dim sqlConnection1 As New System.Data.SqlClient.SqlConnection(connection)
        Dim cmd As New System.Data.SqlClient.SqlCommand
        cmd.CommandType = System.Data.CommandType.Text
        cmd.CommandText = "UPDATE users SET fname=@fname,lname=@lname,companyName=@company,phone1= @phone1,phone2= @phone2,email=@email,address1=@address1,address2=@address2,city=@city,state=@state,zip=@zip,username=@user,password=@pass WHERE username='" & Session("Username") & "'"
        cmd.Parameters.AddWithValue("@fname", Me.Tfname.Text)
        cmd.Parameters.AddWithValue("@lname", Me.Tlname.Text)
        cmd.Parameters.AddWithValue("@company", Me.Tcompany.Text)
        cmd.Parameters.AddWithValue("@phone1", Me.Tphone1.Text)
        cmd.Parameters.AddWithValue("@phone2", Me.Tphone2.Text)
        cmd.Parameters.AddWithValue("@email", Me.Temail.Text)
        cmd.Parameters.AddWithValue("@address1", Me.Taddress1.Text)
        cmd.Parameters.AddWithValue("@address2", Me.Taddress2.Text)
        cmd.Parameters.AddWithValue("@city", Me.Tcity.Text)
        cmd.Parameters.AddWithValue("@state", Me.Tstate.Text)
        cmd.Parameters.AddWithValue("@zip", Me.Tzip.Text)
        cmd.Parameters.AddWithValue("@user", Me.Tusern.Text)
        cmd.Parameters.AddWithValue("@pass", Me.Tpassword1.Text)
        cmd.Connection = sqlConnection1
        sqlConnection1.Open()
        cmd.ExecuteNonQuery()
        sqlConnection1.Close()
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessUpdate();", True)
#End Region

    End Sub
End Class