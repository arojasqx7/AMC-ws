Public Class composer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        FillData()
    End Sub
    Sub FillData()

        Dim T_composers = New DataSet2TableAdapters.composersTableAdapter()
        Dim W_composers = T_composers.GetData()

        Me.G_composer.DataSource = W_composers
        Me.G_composer.DataBind()

    End Sub

    Protected Sub G_composer_SelectedIndexChanged(sender As Object, e As EventArgs) Handles G_composer.SelectedIndexChanged

    End Sub

    Private Sub G_composer_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles G_composer.PageIndexChanging
        G_composer.PageIndex = e.NewPageIndex
        FillData()
    End Sub
End Class