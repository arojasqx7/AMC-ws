Public Class Composers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Dim t_composer = New AMC_ws.DataSet2.composersDataTable()
        Dim adapter = New AMC_ws.DataSet2TableAdapters.composersTableAdapter()
        adapter.Insert(txtFirstName.Text, txtMiddleInitial.Text, txtLastName.Text, DropDownPublishers.SelectedItem.Value, txtBio.Text)
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessAdded();", True)
        Response.Redirect("Composers.aspx")
    End Sub
End Class