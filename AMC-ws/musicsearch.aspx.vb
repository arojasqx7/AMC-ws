Public Class musicsearch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.IsPostBack Then

        Else
            Me.T_mainsearch.Attributes.Add("onkeypress", "button_click(this,'" + Me.B_Search.ClientID + "')")

        End If
    End Sub

    Private Sub B_Search_Click(sender As Object, e As EventArgs) Handles B_Search.Click
        Dim searchtext As String
        Dim T_search = New AMC_ws.DataSet1TableAdapters.SearchTableAdapter()
        searchtext = "%" & Me.T_mainsearch.Value & "%"
        Replace(searchtext, "", "%")
        Try
            Dim T_tracks As New AMC_ws.DataSet1.SearchDataTable()
            T_tracks.Constraints.Clear()
            T_search.FillByText(T_tracks, searchtext)
            Me.TrackList.DataSource = T_tracks
            TrackList.DataBind()
        Catch ex As Exception

        End Try




    End Sub

    Private Sub BSearch_Album_Click(sender As Object, e As EventArgs) Handles BSearch_Album.Click
        Dim searchtext As String
        Dim T_search = New AMC_ws.DataSet1TableAdapters.SearchTableAdapter()
        searchtext = "%" & Me.T_keyword.Text & "%"
        Replace(searchtext, "", "%")
        Try
            Dim T_tracks As New AMC_ws.DataSet1.SearchDataTable()
            T_tracks.Constraints.Clear()
            T_search.FillByAlbum(T_tracks, Me.DD_Album.Text)
            Me.TrackList.DataSource = T_tracks
            TrackList.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub BSearch_Composer_Click(sender As Object, e As EventArgs) Handles BSearch_Composer.Click
        Dim searchtext As String
        Dim T_search = New AMC_ws.DataSet1TableAdapters.SearchTableAdapter()
        searchtext = "%" & Me.T_keyword.Text & "%"
        Replace(searchtext, "", "%")
        Try
            Dim T_tracks As New AMC_ws.DataSet1.SearchDataTable()
            T_tracks.Constraints.Clear()
            T_search.FillByComposer(T_tracks, Me.DD_Composer.Text)
            Me.TrackList.DataSource = T_tracks
            TrackList.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub BSearch_Genre_Click(sender As Object, e As EventArgs) Handles BSearch_Genre.Click
        Dim searchtext As String
        Dim T_search = New AMC_ws.DataSet1TableAdapters.SearchTableAdapter()
        searchtext = "%" & Me.T_keyword.Text & "%"
        Replace(searchtext, "", "%")
        Try
            Dim T_tracks As New AMC_ws.DataSet1.SearchDataTable()
            T_tracks.Constraints.Clear()
            T_search.FillByGenre(T_tracks, searchtext, Me.DD_style.Text, Me.DD_tempo.Text)
            Me.TrackList.DataSource = T_tracks
            TrackList.DataBind()
        Catch ex As Exception

        End Try
    End Sub
End Class