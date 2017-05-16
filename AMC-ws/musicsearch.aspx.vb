Imports System.Data.SqlClient
Imports System.Web.Services

Public Class musicsearch
    Inherits System.Web.UI.Page

#Region "Conn String"
    Dim connection As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"
#End Region
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'CheckBoxList1.Attributes.Add("onclick", "return HandleOnCheck()")
    End Sub

    'Private Sub B_Search_Click(sender As Object, e As EventArgs) Handles B_Search.Click
    '    Dim searchtext As String
    '    Dim T_search = New AMC_ws.DataSet1TableAdapters.SearchTableAdapter()
    '    searchtext = "%" & Me.T_mainsearch.Text & "%"
    '    Replace(searchtext, "", "%")
    '    Try
    '        Dim T_tracks As New AMC_ws.DataSet1.SearchDataTable()
    '        T_tracks.Constraints.Clear()
    '        T_search.FillByText(T_tracks, searchtext)
    '        Me.TrackList.DataSource = T_tracks
    '        TrackList.DataBind()
    '    Catch ex As Exception

    '    End Try
    'End Sub

    'Private Sub BSearch_Album_Click(sender As Object, e As EventArgs) Handles BSearch_Album.Click
    '    Dim searchtext As String
    '    Dim T_search = New AMC_ws.DataSet1TableAdapters.SearchTableAdapter()
    '    searchtext = "%" & Me.T_keyword.Text & "%"
    '    Replace(searchtext, "", "%")
    '    Try
    '        Dim T_tracks As New AMC_ws.DataSet1.SearchDataTable()
    '        T_tracks.Constraints.Clear()
    '        T_search.FillByAlbum(T_tracks, Me.DD_Album.Text)
    '        Me.TrackList.DataSource = T_tracks
    '        TrackList.DataBind()
    '    Catch ex As Exception

    '    End Try
    'End Sub

    'Private Sub BSearch_Composer_Click(sender As Object, e As EventArgs) Handles BSearch_Composer.Click
    '    Dim searchtext As String
    '    Dim T_search = New AMC_ws.DataSet1TableAdapters.SearchTableAdapter()
    '    searchtext = "%" & Me.T_keyword.Text & "%"
    '    Replace(searchtext, "", "%")
    '    Try
    '        Dim T_tracks As New AMC_ws.DataSet1.SearchDataTable()
    '        T_tracks.Constraints.Clear()
    '        T_search.FillByComposer(T_tracks, Me.DD_Composer.Text)
    '        Me.TrackList.DataSource = T_tracks
    '        TrackList.DataBind()
    '    Catch ex As Exception

    '    End Try
    'End Sub

    'Private Sub BSearch_Genre_Click(sender As Object, e As EventArgs) Handles BSearch_Genre.Click
    '    Dim searchtext As String
    '    Dim T_search = New AMC_ws.DataSet1TableAdapters.SearchTableAdapter()
    '    searchtext = "%" & Me.T_keyword.Text & "%"
    '    Replace(searchtext, "", "%")
    '    Try
    '        Dim T_tracks As New AMC_ws.DataSet1.SearchDataTable()
    '        T_tracks.Constraints.Clear()
    '        T_search.FillByGenre(T_tracks, searchtext, Me.DD_style.Text, Me.DD_tempo.Text)
    '        Me.TrackList.DataSource = T_tracks
    '        TrackList.DataBind()
    '    Catch ex As Exception

    '    End Try
    'End Sub



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
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "openModal();", True)
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
            Me.DD_tempo.Visible = True
            Me.DD_style.Visible = True
            Me.btnSearchStyle.Visible = True
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
            Me.lblOneFilter.Visible = True
        End If
    End Sub
End Class