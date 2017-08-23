Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports System.Drawing
Imports System.Configuration
Imports System.Data.SqlClient


Public Class AMC_master
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim pageName As String = Path.GetFileName(Request.Path)
        If (Session("fullname") IsNot Nothing) Then
            Me.bt_login.Visible = False
            Me.m_usuario.Visible = True
            Me.L_UserName.Text = Session("fullname")
            Me.m_joinus.Visible = False

        Else
            Me.m_usuario.Visible = False
        End If
    End Sub

    Protected Sub LB_Logout_Click(sender As Object, e As EventArgs) Handles LB_Logout.Click
        Session.Abandon()
        Session.RemoveAll()
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub LB_PinVer_Click(sender As Object, e As EventArgs) Handles LB_PinVer.Click
        Response.Redirect("accountpin.aspx")
    End Sub

    Private Sub LB_Project_Click(sender As Object, e As EventArgs) Handles LB_Project.Click
        Response.Redirect("project.aspx")
    End Sub

    Protected Sub LogIn_Click(sender As Object, e As EventArgs)
        Dim t_user = New DataSet2.usersDataTable()
        Dim adapter = New DataSet2TableAdapters.usersTableAdapter()
        adapter.Fill(t_user, Me.username1.Text, Me.password1.Text)
        If (t_user.Count() > 0) Then
            Me.L_UserName.Text = t_user(0).fullname
            Session("fullname") = t_user(0).fullname
            Session("username") = t_user(0).username
            Session("email") = t_user(0).email
            Session("pin") = t_user(0).accountpin
            Session("type") = t_user(0).type
            Session.Timeout = 10
            Me.m_usuario.Visible = True
            Me.bt_login.Visible = False

            Dim strHostName As String
            Dim strIPAddress As String
            strHostName = System.Net.Dns.GetHostName()
            strIPAddress = System.Net.Dns.GetHostByName(strHostName).AddressList(0).ToString()
            Dim userloggin = New DataSet2TableAdapters.userloginsTableAdapter
            userloggin.Insert(t_user(0).id, Now, strIPAddress)
            Dim type = t_user(0).type
            Dim standing = t_user(0).standing

            If type = 0 And standing = 1 Then
                Response.Redirect("welcome.aspx")

            ElseIf standing = 2 Then
                Me.m_usuario.Visible = False
                Me.bt_login.Visible = True
                Session.Abandon()
                Session.RemoveAll()
                Response.Redirect("WaitingConfirmation.aspx")

            ElseIf type = 8 Then
                Response.Redirect("Users.aspx")

            End If
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ErrorLogin();", True)

        End If
    End Sub

    Protected Sub B_subEmail_Click(sender As Object, e As EventArgs)
        Dim Username As String = String.Empty
        Dim Password As String = String.Empty
        Using conn As New SqlConnection("Data Source=andrey.sapiens.co.cr;Initial Catalog=AMC;User ID=sa;Password=sa.1.29")
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT username,password FROM users WHERE email = @email"
                cmd.Parameters.AddWithValue("@email", useremail.Text.Trim())
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    If sdr.Read() Then
                        Username = sdr("username").ToString()
                        Password = sdr("password").ToString()
                    End If
                End Using
                conn.Close()
            End Using
        End Using
        If Not String.IsNullOrEmpty(Password) Then
            Dim mm As New MailMessage("josue.victorioso77@gmail.com", useremail.Text.Trim)
            mm.Subject = "Password Recovery - No-Reply"
            mm.Body = String.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You!!!", Username, Password)
            mm.IsBodyHtml = True
            Dim smtp As New SmtpClient()
            smtp.Host = "smtp.gmail.com"
            smtp.EnableSsl = True
            Dim NetworkCred As New NetworkCredential()
            NetworkCred.UserName = "josue.victorioso77@gmail.com"
            NetworkCred.Password = "dioseslaluzdemivida"
            smtp.UseDefaultCredentials = False
            smtp.Credentials = NetworkCred
            smtp.Port = 25
            smtp.Send(mm)
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "PasswordSent();", True)
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "PasswordNotSent();", True)
        End If
    End Sub

End Class