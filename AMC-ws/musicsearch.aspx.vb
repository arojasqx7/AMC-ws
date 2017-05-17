Imports System.Data.SqlClient
Imports System.Web.Services

Public Class musicsearch
    Inherits System.Web.UI.Page

#Region "Conn String"
    Dim connection As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"
#End Region
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub


    <WebMethod()>
    Public Shared Function GetTracks(prefix As String) As String()
        Dim tracks As New List(Of String)()
        Using conn As New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;")
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT [title], [id] FROM [tracks] where [title] like @SearchText + '%' ORDER BY [title]"
                cmd.Parameters.AddWithValue("@SearchText", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        tracks.Add(String.Format("{0}-{1}", sdr("title"), sdr("id")))
                    End While
                End Using
                conn.Close()
            End Using
        End Using
        Return tracks.ToArray()
    End Function

    Protected Sub lnkSelect_Click(sender As Object, e As EventArgs)
        If (Session("fullname") IsNot Nothing) Then
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "openModal();", True)
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ErrorLogin();", True)
        End If
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
        If CheckStyleGenre.Checked = True Then
            Me.T_mainsearch.Text = ""
            Me.LblCheck.Visible = False
            Me.DD_Composer.Visible = False
            Me.DD_Album.Visible = False
            Me.lblCheckAll.Visible = False
            Me.lblOneFilter.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.btnSearchAlbums.Visible = False
            Me.GridCDs.Visible = False
            Me.GV_tracks.Visible = False
            Me.GridComposers.Visible = False
            Me.DD_tempo.Visible = True
            Me.DD_style.Visible = True
            Me.btnSearchStyle.Visible = True
            Me.GridStylesGenre.Visible = True
        End If

        If CheckComposer.Checked = True Then
            Me.T_mainsearch.Text = ""
            Me.LblCheck.Visible = False
            Me.DD_style.Visible = False
            Me.DD_tempo.Visible = False
            Me.DD_Album.Visible = False
            Me.lblCheckAll.Visible = False
            Me.lblOneFilter.Visible = False
            Me.btnSearchStyle.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.btnSearchAlbums.Visible = False
            Me.GridCDs.Visible = False
            Me.GV_tracks.Visible = False
            Me.GridStylesGenre.Visible = False
            Me.GridComposers.Visible = True
            Me.DD_Composer.Visible = True
            Me.btnSearchComposers.Visible = True
        End If

        If CheckAlbum.Checked = True Then
            Me.T_mainsearch.Text = ""
            Me.LblCheck.Visible = False
            Me.DD_style.Visible = False
            Me.DD_tempo.Visible = False
            Me.DD_Composer.Visible = False
            Me.lblCheckAll.Visible = False
            Me.lblOneFilter.Visible = False
            Me.btnSearchStyle.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.DD_Album.Visible = True
            Me.btnSearchAlbums.Visible = True
        End If

        If CheckStyleGenre.Checked = False And CheckComposer.Checked = False And CheckAlbum.Checked = False Then
            Me.T_mainsearch.Text = ""
            Me.DD_style.Visible = False
            Me.DD_tempo.Visible = False
            Me.DD_Album.Visible = False
            Me.DD_Composer.Visible = False
            Me.lblCheckAll.Visible = False
            Me.lblOneFilter.Visible = False
            Me.btnSearchStyle.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.btnSearchAlbums.Visible = False
            Me.GridCDs.Visible = False
            Me.GV_tracks.Visible = False
            Me.GridStylesGenre.Visible = False
            Me.LblCheck.Visible = True
        End If

        If CheckStyleGenre.Checked = True And CheckComposer.Checked = True And CheckAlbum.Checked = True Then
            Me.T_mainsearch.Text = ""
            Me.DD_style.Visible = False
            Me.DD_tempo.Visible = False
            Me.DD_Album.Visible = False
            Me.DD_Composer.Visible = False
            Me.LblCheck.Visible = False
            Me.lblOneFilter.Visible = False
            Me.btnSearchStyle.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.btnSearchAlbums.Visible = False
            Me.GridCDs.Visible = False
            Me.GV_tracks.Visible = False
            Me.GridStylesGenre.Visible = False
            Me.lblCheckAll.Visible = True
        End If

        If CheckStyleGenre.Checked = True And CheckComposer.Checked = True And CheckAlbum.Checked = False Then
            Me.T_mainsearch.Text = ""
            Me.DD_style.Visible = False
            Me.DD_tempo.Visible = False
            Me.DD_Album.Visible = False
            Me.DD_Composer.Visible = False
            Me.LblCheck.Visible = False
            Me.lblCheckAll.Visible = False
            Me.btnSearchStyle.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.btnSearchAlbums.Visible = False
            Me.GridCDs.Visible = False
            Me.GV_tracks.Visible = False
            Me.GridStylesGenre.Visible = False
            Me.lblOneFilter.Visible = True
        End If

        If CheckStyleGenre.Checked = True And CheckComposer.Checked = False And CheckAlbum.Checked = True Then
            Me.T_mainsearch.Text = ""
            Me.DD_style.Visible = False
            Me.DD_tempo.Visible = False
            Me.DD_Album.Visible = False
            Me.DD_Composer.Visible = False
            Me.LblCheck.Visible = False
            Me.lblCheckAll.Visible = False
            Me.btnSearchStyle.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.btnSearchAlbums.Visible = False
            Me.GridCDs.Visible = False
            Me.GV_tracks.Visible = False
            Me.GridStylesGenre.Visible = False
            Me.lblOneFilter.Visible = True
        End If

        If CheckStyleGenre.Checked = False And CheckComposer.Checked = True And CheckAlbum.Checked = True Then
            Me.T_mainsearch.Text = ""
            Me.DD_style.Visible = False
            Me.DD_tempo.Visible = False
            Me.DD_Album.Visible = False
            Me.DD_Composer.Visible = False
            Me.LblCheck.Visible = False
            Me.lblCheckAll.Visible = False
            Me.btnSearchStyle.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.btnSearchAlbums.Visible = False
            Me.GridCDs.Visible = False
            Me.GV_tracks.Visible = False
            Me.GridStylesGenre.Visible = False
            Me.lblOneFilter.Visible = True
        End If
    End Sub

    Protected Sub B_Search_Click(sender As Object, e As EventArgs)
        Me.GV_tracks.Visible = True
        Me.GridCDs.Visible = False
        Me.GridStylesGenre.Visible = False
        Me.CheckAlbum.Checked = False
        Me.CheckComposer.Checked = False
        Me.CheckStyleGenre.Checked = False
        Me.DD_style.Visible = False
        Me.DD_tempo.Visible = False
        Me.DD_Album.Visible = False
        Me.DD_Composer.Visible = False
        Me.LblCheck.Visible = False
        Me.lblCheckAll.Visible = False
        Me.btnSearchStyle.Visible = False
        Me.btnSearchComposers.Visible = False
        Me.btnSearchAlbums.Visible = False
        Me.lblOneFilter.Visible = False
    End Sub

    Protected Sub btnSearchAlbums_Click(sender As Object, e As EventArgs)
        Me.T_mainsearch.Text = ""
        Me.GridCDs.Visible = True
        Me.GV_tracks.Visible = False
        Me.GridStylesGenre.Visible = False
    End Sub

    Protected Sub btnSearchComposers_Click(sender As Object, e As EventArgs)
        Me.T_mainsearch.Text = ""
        Me.GridCDs.Visible = False
        Me.GV_tracks.Visible = False
        Me.GridStylesGenre.Visible = False
        Me.GridComposers.Visible = True
    End Sub

    Protected Sub btnSearchStyle_Click(sender As Object, e As EventArgs)
        Me.T_mainsearch.Text = ""
        Me.GridCDs.Visible = False
        Me.GV_tracks.Visible = False
        Me.GridComposers.Visible = False
        Me.GridStylesGenre.Visible = True
    End Sub
End Class