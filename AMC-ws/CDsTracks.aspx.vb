Imports System.Data.SqlClient
Imports System.IO

Public Class CDsTracks
    Inherits System.Web.UI.Page

#Region "Conn String"
    Dim connection As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"
#End Region

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
        Response.Redirect("CDsTracks.aspx")
    End Sub

    Protected Sub DropDownCDS_SelectedIndexChanged(sender As Object, e As EventArgs)
        GridCDSelected.Visible = True
        GridTracksInCD.Visible = True
    End Sub


    Protected Sub GridTracksInCD_SelectedIndexChanged(sender As Object, e As EventArgs)
        ScriptManager.RegisterStartupScript(Me, Page.GetType(), "Popup", "openModalEditTrack();", True)
        hd_trackID.Value = GridTracksInCD.SelectedRow.Cells(0).Text
        HiddenFieldTrackIDToComposer.Value = GridTracksInCD.SelectedRow.Cells(0).Text
        DropDownCD_Edit.SelectedItem.Text = DropDownCDS.SelectedItem.Text
        txtTrackNo_Edit.Text = GridTracksInCD.SelectedRow.Cells(1).Text
        txtTrackTitle_Edit.Text = GridTracksInCD.SelectedRow.Cells(2).Text
        txtTrackDesc_Edit.Text = GridTracksInCD.SelectedRow.Cells(4).Text.Replace("&nbsp;", "")
        txtStyles_Edit.Text = GridTracksInCD.SelectedRow.Cells(5).Text.Replace("&nbsp;", "")
        txtKeywords_Edit.Text = GridTracksInCD.SelectedRow.Cells(6).Text.Replace("&nbsp;", "")
        txtInstruments_Edit.Text = GridTracksInCD.SelectedRow.Cells(7).Text.Replace("&nbsp;", "")
        lblTrackName.Text = txtTrackTitle_Edit.Text
        lblTrackNameInClips.Text = txtTrackTitle_Edit.Text
        'HiddenFieldIDSoundClip.Value = GridClips.SelectedRow.Cells(0).Text
    End Sub

    Protected Sub btnApplyEdit_Click(sender As Object, e As EventArgs)
        'Me.hd_trackID.Value = GridTracksInCD.SelectedRow.Cells(0).Text
        Dim sqlConnection1 As New SqlClient.SqlConnection(connection)
        Dim cmd As New SqlClient.SqlCommand
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "UPDATE [tracks] SET [fk_cd_id] = '" & DropDownCD_Edit.SelectedItem.Value & "', [track_number] = '" & txtTrackNo_Edit.Text & "', [title] = '" & txtTrackTitle_Edit.Text & "', [descrip] = '" & txtTrackDesc_Edit.Text & "', [sounds_like] = '" & txtStyles_Edit.Text & "', [keywords] = '" & txtKeywords_Edit.Text & "', [instruments] = '" & txtInstruments_Edit.Text & "' WHERE [id]='" & hd_trackID.Value & "'"
        cmd.Connection = sqlConnection1
        sqlConnection1.Open()
        cmd.ExecuteNonQuery()
        GridTracksInCD.DataBind()
        GridCDSelected.DataBind()
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "SuccessUpdated();", True)
        sqlConnection1.Close()
    End Sub

    Protected Sub LinkAddComposers_Click(sender As Object, e As EventArgs)
        ScriptManager.RegisterStartupScript(Me, Page.GetType(), "Popup", "openModalEditComposer();", True)
    End Sub

    Protected Sub btnAddComposerToTrack_Click(sender As Object, e As EventArgs)
        Dim t_MapComposersTracks = New DataSet2.map_composers_tracksDataTable()
        Dim adapter3 = New DataSet2TableAdapters.map_composers_tracksTableAdapter()
        adapter3.Insert(HiddenFieldTrackIDToComposer.Value, DropDownComposersToAdd.SelectedItem.Value)
        ScriptManager.RegisterStartupScript(Me, Page.GetType(), "Popup", "ComposerAdded();", True)
        GridEditComposersInList.DataBind()
    End Sub

    Protected Sub LinkSoundClips_Click(sender As Object, e As EventArgs)
        ScriptManager.RegisterStartupScript(Me, Page.GetType(), "Popup", "openModalSoundClips();", True)
    End Sub

    Protected Sub btnAddClip_Click(sender As Object, e As EventArgs)
        Dim t_MapClips = New DataSet2.map_clipsDataTable()
        Dim adapter4 = New DataSet2TableAdapters.map_clipsTableAdapter()
        Dim filename As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
        adapter4.Insert(HiddenFieldTrackIDToComposer.Value, DropClipLength.SelectedItem.Value, DropDigFormat.SelectedItem.Value, txtClipDuration.Text)
        FileUpload1.PostedFile.SaveAs((Server.MapPath("~/SoundClips/") + filename))
        ScriptManager.RegisterStartupScript(Me, Page.GetType(), "Popup", "ClipAdded();", True)
        Response.Redirect("CDsTracks.aspx")
    End Sub


End Class