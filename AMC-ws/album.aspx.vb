Imports System.Data.SqlClient

Public Class album
    Inherits System.Web.UI.Page

    Dim connection As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.GV_tracks.Rows.Count() <= 0 Then
            Dim idAlbum As String = Request.QueryString("idAlbum")
            Dim L_idAlbum = Long.Parse(idAlbum)
            Dim T_cd = New AMC_ws.DataSet1TableAdapters.cdTableAdapter()
            Dim W_cd = T_cd.GetDataById(L_idAlbum)
            Me.T_albumTitle.Text = W_cd(0).cd_title

            Dim Dt_tracks = New AMC_ws.DataSet1TableAdapters.tracksTableAdapter()

            Dim T_tracks = Dt_tracks.GetData(L_idAlbum)
            Me.GV_tracks.DataSource = T_tracks
            GV_tracks.DataBind()
            Me.BindGrid_ProjectList()
        End If
    End Sub

    Private Sub BindGrid_ProjectList()

        Using con As New SqlConnection(connection)
            Using cmd As New SqlCommand("SELECT [projects].[projectName] FROM [projects] JOIN [users] ON [projects].[fk_userID] = [users].[id] WHERE ([users].[username] = '" & Session("Username") & "') ORDER BY [projects].[projectName]")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        dt.Columns.Add("Action", GetType(Boolean))
                        sda.Fill(dt)
                        GridProjectList.DataSource = dt
                        GridProjectList.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub

    Protected Sub OnRowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim checkBox As CheckBox = TryCast(e.Row.Cells(0).Controls(0), CheckBox)
            checkBox.Enabled = True
        End If
    End Sub

    Protected Sub track_Click(sender As Object, e As EventArgs)
        Dim lno As LinkButton = sender
        Dim Track_cd = New AMC_ws.DataSet1TableAdapters.map_clipsTableAdapter()
        Dim T_track = Track_cd.GetData(lno.CommandArgument)
        Dim FileName = "/clips/" & T_track(0).fk_trackID & "_30.mp3"

        ClientScript.RegisterStartupScript(Me.GetType(), "LoadSong", "cargarCancion('" & FileName & "');", True)

        Dim Dt_tracks = New AMC_ws.DataSet1TableAdapters.tracksTableAdapter()

        Dim T_tracks = Dt_tracks.GetDataByid_track(lno.CommandArgument)
        Me.L_titlePlayer.Text = T_tracks(0).title
    End Sub


    Protected Sub T_songMain(sender As Object, e As EventArgs)
        'If (Session("fullname") IsNot Nothing) Then
        '    Dim lno As LinkButton = sender
        '    Dim Track_cd = New AMC_ws.DataSet1TableAdapters.map_clipsTableAdapter()
        '    Dim T_mp3 = Track_cd.GetDataByFormat(lno.CommandArgument, "mp3")
        '    Dim T_wav = Track_cd.GetDataByFormat(lno.CommandArgument, "wav")
        '    Me.G_mp3.DataSource = T_mp3
        '    G_mp3.DataBind()
        '    Me.G_wav.DataSource = T_wav
        '    G_wav.DataBind()

        '    Dim Dt_tracks = New AMC_ws.DataSet1TableAdapters.track_infoTableAdapter()
        '    Dim T_tracks = Dt_tracks.GetData(lno.CommandArgument)

        '    Me.T_titlePop.Text = T_tracks(0).title
        '    Me.T_trackId.Text = T_tracks(0).cd_number
        '    Me.T_compPop.Text = T_tracks(0).fname & " " & T_tracks(0).lname
        '    Me.T_pubPop.Text = T_tracks(0)._alias & " " & T_tracks(0).name
        '    ScriptManager.RegisterStartupScript(Me, Page.GetType, "songS", "$('#songS').modal();", True)

        'Else
        '    ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ErrorLogin();", True)
        'End If


    End Sub

    Protected Sub GV_tracks_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GV_tracks.SelectedIndexChanged

    End Sub
    Protected Sub track_Click_download(sender As Object, e As EventArgs)
        Dim lno As LinkButton = sender

        Dim destFileName = lno.CommandArgument
        Dim Pos_g = InStr(destFileName, "_") - 1
        Dim FK_trackID As Long = Mid(destFileName, 1, Pos_g)

        Dim Pos_p = InStr(destFileName, ".") - destFileName.Length
        Dim file_lenght As Long = Mid(destFileName, Pos_g + 2, Pos_p)

        Dim DT_download = New AMC_ws.DataSet1TableAdapters.map_downloadTableAdapter()
        'DT_download.Insert()

        Response.ContentType = "APPLICATION/OCTET-STREAM"
        Dim Header As [String] = "Attachment; Filename=" & destFileName
        Response.AppendHeader("Content-Disposition", Header)
        Dim Dfile As New System.IO.FileInfo(Server.MapPath("/clips/" & destFileName))
        Response.WriteFile(Dfile.FullName)
        'Don't forget to add the following line
        Response.[End]()

    End Sub
End Class