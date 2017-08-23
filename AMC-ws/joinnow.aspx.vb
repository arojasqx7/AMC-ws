Public Class join_t
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)

        Exit Sub

    End Sub

    Protected Sub regSubmit_Click(sender As Object, e As EventArgs) Handles regSubmit.Click
        'validate required fields'
        'If Me.Tfname.Text = "" Or Me.Tlname.Text = "" Or Me.Taddress1.Text = "" Then Then
        'ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ErrorField();", True)
        'Exit Sub
        'End If '
        'validate username does not exist'

        Dim t_user = New DataSet2.usersDataTable()
        Dim adapter = New DataSet2TableAdapters.usersTableAdapter()
        adapter.FillByusername(t_user, Me.Tusern.Text)
        If (t_user.Count() > 0) Then
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ErrorUsername();", True)
            Exit Sub
        End If
        adapter.Insert(Me.Tfname.Text, Me.Tlname.Text, Me.Tcompany.Text, Me.Tphone1.Text, Me.Tphone2.Text, "", Me.Temail.Text, Me.Taddress1.Text, Me.Taddress2.Text, Me.Tcity.Text, Me.Tstate.Text, Me.Tzip.Text, Me.Tusern.Text, Me.Tpassword1.Text, 1, 2, "TEST", Now.Date, Me.DLcountry.SelectedValue, Me.Tpin1.Text, "User")
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessRegistration();", True)
    End Sub
End Class