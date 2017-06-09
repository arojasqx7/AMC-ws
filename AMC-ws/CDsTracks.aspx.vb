Imports System.Data.SqlClient

Public Class CDsTracks
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)

        Dim cdID As Int32
        Dim sql As String = "SELECT MAX(id) FROM [cd]"
        Using conn As New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;")
            Dim cmd As New SqlCommand(sql, conn)
            conn.Open()
            cdID = Convert.ToInt32(cmd.ExecuteScalar()) + 1 'almacena ID del PK
            conn.Close()
        End Using

        Dim t_CD = New AMC_ws.DataSet2.cdDataTable()
        Dim adapter = New AMC_ws.DataSet2TableAdapters.cdTableAdapter()
        Dim t_MapGenres = New AMC_ws.DataSet2.map_genresDataTable()
        Dim adapter2 = New AMC_ws.DataSet2TableAdapters.map_genresTableAdapter()
        adapter.Insert(txtCatalogNo.Text, txtCDTitle.Text, DropDownPublishers.SelectedItem.Value, txtDesc.Text)
        For Each row As TableRow In Me.Table1.Rows
            For Each cell As TableCell In row.Cells
                For Each ctrl As Control In cell.Controls
                    Dim box As CheckBox = TryCast(ctrl, CheckBox)
                    If box IsNot Nothing AndAlso box.Checked Then
                        adapter2.Insert(cdID, box.Text)
                    End If
                Next
            Next
        Next
        Response.Redirect("CDsTracks.aspx")
    End Sub

    Protected Sub btnAddTracktoBD_Click(sender As Object, e As EventArgs)

        Dim trackID As Int32
        Dim sql As String = "SELECT MAX(id) FROM [tracks]"
        Using conn As New SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;")
            Dim cmd As New SqlCommand(sql, conn)
            conn.Open()
            trackID = Convert.ToInt32(cmd.ExecuteScalar()) + 1 'almacena ID del PK
            conn.Close()
        End Using

        Dim t_tracks = New AMC_ws.DataSet2.tracksDataTable()
        Dim adapter = New AMC_ws.DataSet2TableAdapters.tracksTableAdapter()
        adapter.Insert(DropCD2.SelectedItem.Value, txtTrackNo.Text, txtTrackTitle.Text, txtDescTrack.Text, txtStyleLikes.Text, txtKeywords.Text, txtInstruments.Text)
        Dim t_map_genres_track = New AMC_ws.DataSet2.map_genres_tracksDataTable()
        Dim adapter2 = New AMC_ws.DataSet2TableAdapters.map_genres_tracksTableAdapter
        For Each row As TableRow In Me.Table2.Rows
            For Each cell As TableCell In row.Cells
                For Each ctrl As Control In cell.Controls
                    Dim box As CheckBox = TryCast(ctrl, CheckBox)
                    If box IsNot Nothing AndAlso box.Checked Then
                        adapter2.Insert(trackID, box.Text)
                    End If
                Next
            Next
        Next

        Dim t_map_tempos_track = New AMC_ws.DataSet2.map_tempos_tracksDataTable()
        Dim adapter3 = New AMC_ws.DataSet2TableAdapters.map_tempos_tracksTableAdapter()
        For Each row As TableRow In Me.Table3.Rows
            For Each cell As TableCell In row.Cells
                For Each ctrl As Control In cell.Controls
                    Dim box As CheckBox = TryCast(ctrl, CheckBox)
                    If box IsNot Nothing AndAlso box.Checked Then
                        adapter3.Insert(trackID, box.Text)
                    End If
                Next
            Next
        Next

        'ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessAdded();", True)
        Response.Redirect("CDsTracks.aspx")
    End Sub

    Protected Sub DropDownCDS_SelectedIndexChanged(sender As Object, e As EventArgs)
        GridCDSelected.Visible = True
        GridTracksInCD.Visible = True
    End Sub
End Class