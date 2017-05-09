Public Class myinfo
    Inherits System.Web.UI.Page
    Dim w_type As Integer
    Dim w_standing As Integer
    Dim w_comments As Integer
    Dim w_Original_id As Long
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim t_user = New AMC_ws.DataSet1.usersDataTable()
        Dim adapter = New AMC_ws.DataSet1TableAdapters.usersTableAdapter()

        If Session("pinit") <> "X" Then
            Response.Redirect("default.aspx")

        Else
            If Page.IsPostBack Then
            Else

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
            End If

        End If
    End Sub

    Private Sub B_update_Click(sender As Object, e As EventArgs) Handles B_update.Click
        Dim t_user = New AMC_ws.DataSet1.usersDataTable()
        Dim adapter = New AMC_ws.DataSet1TableAdapters.usersTableAdapter()
        If Me.Tpassword1.Text <> Me.Tpassword2.Text Then


            Exit Sub
        End If
        adapter.Update(Me.Tfname.Text, Me.Tlname.Text, Me.Tcompany.Text, Me.Tphone1.Text, Me.Tphone2.Text, "", Me.Temail.Text, Me.Taddress1.Text, Me.Taddress2.Text, Me.Tcity.Text, Me.Tstate.Text, Me.Tzip.Text, Me.Tusern.Text, Me.Tpassword1.Text, w_type, w_standing, w_comments, Now, Me.DLcountry.Text, Me.Tpin1.Text, w_Original_id)
    End Sub
End Class