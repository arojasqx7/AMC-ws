Imports System.Web
Imports System.IO
Public Class AMC_master
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim pageName As String = Path.GetFileName(Request.Path)
        If (Session("fullname") IsNot Nothing) Then
            Me.bt_login.Visible = False
            Me.bt_loginarrow.Visible = False
            Me.m_usuario.Visible = True
            Me.L_UserName.Text = Session("fullname")
            Me.m_joinus.Visible = False

        Else
            Me.m_usuario.Visible = False
        End If
    End Sub



    Private Sub signIn_Click(sender As Object, e As EventArgs) Handles signIn.Click
        Dim t_user = New AMC_ws.DataSet1.usersDataTable()
        Dim adapter = New AMC_ws.DataSet1TableAdapters.usersTableAdapter()
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
            Me.bt_loginarrow.Visible = False

            Dim strHostName As String
            Dim strIPAddress As String
            strHostName = System.Net.Dns.GetHostName()
            strIPAddress = System.Net.Dns.GetHostByName(strHostName).AddressList(0).ToString()
            Dim userloggin = New AMC_ws.DataSet1TableAdapters.userloginsTableAdapter
            userloggin.Insert(t_user(0).id, Now, strIPAddress)
            Dim type = t_user(0).type

            Select Case type
                Case "1"
                    Response.Redirect("welcome.aspx")
                Case "2"
                    Response.Redirect("Admin-Home.aspx")
            End Select



        Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ErrorLogin();", True)

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
End Class