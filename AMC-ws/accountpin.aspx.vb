Public Class accountpin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("fullname") Is Nothing) Then
            Response.Redirect("default.aspx")
        End If
    End Sub

    Protected Sub B_forgotPin_Click(sender As Object, e As EventArgs) Handles B_forgotPin.Click
        Dim oMail = Server.CreateObject("CDONTS.NewMail")
        oMail.From = "info@americanmusicco.com"
        oMail.To = Session("email")
        oMail.BodyFormat = 0
        oMail.MailFormat = 0
        oMail.Subject = "American Music Company Reminder"
        oMail.Body = "This is a reminder of your American Music Company PIN. Your PIN is: " & Session("pin")
        oMail.Send
        oMail = Nothing
        Response.Write("<script>alert('Your PIN has been sent to your email address on file.');</script>")
    End Sub

    Private Sub B_confPin_Click(sender As Object, e As EventArgs) Handles B_confPin.Click


        If T_userPin2.Text = Session("pin") Then
            Session("pinit") = "X"
            Response.Redirect("myinfo.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ErrorPin();", True)
        End If

    End Sub

End Class