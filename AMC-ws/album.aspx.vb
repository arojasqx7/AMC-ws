﻿Imports System.Data.SqlClient
Imports System.Web.UI.WebControls

Public Class album
    Inherits System.Web.UI.Page

    Dim connection As String = "Server=172.24.16.68\PROD;Database=amc-staging;User Id=amcuser;Password=amccma;"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BindTracks()
    End Sub

    Sub BindTracks()
        Dim idAlbum As String = Request.QueryString("idAlbum")
        Dim L_idAlbum = Long.Parse(idAlbum)
        Dim T_cd = New DataSet2TableAdapters.cdTableAdapter()
        Dim W_cd = T_cd.GetDataById(L_idAlbum)
        T_albumTitle.Text = W_cd(0).cd_title
        T_trackId.Text = W_cd(0).id
        Dim Dt_tracks = New DataSet2TableAdapters.tracksTableAdapter() 'datatable
        Dim T_tracks = Dt_tracks.GetData(L_idAlbum) 'datasource
        GV_tracks.DataSource = T_tracks
        GV_tracks.DataBind()
    End Sub

    Protected Sub GV_tracks_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GV_tracks.PageIndex = e.NewPageIndex
        BindTracks()
    End Sub

    Protected Sub OnSelectedIndexChanged(sender As Object, e As EventArgs)
        Dim row As GridViewRow = GV_tracks.SelectedRow
        Me.Label1.Text = TryCast(row.FindControl("T_title"), LinkButton).Text
        Me.Label2.Text = TryCast(row.FindControl("T_ID"), LinkButton).Text
    End Sub

    Protected Sub track_Click(sender As Object, e As EventArgs)
#Region "Track Click Code"
        Dim lno As LinkButton = sender
        Dim Track_cd = New AMC_ws.DataSet2TableAdapters.map_clipsTableAdapter()
        Dim T_track = Track_cd.GetData(lno.CommandArgument)
        Dim FileName = "/clips/" & T_track(0).fk_trackID & "_30.mp3"
        ClientScript.RegisterStartupScript(Me.GetType(), "LoadSong", "cargarCancion('" & FileName & "');", True)
        Dim Dt_tracks = New DataSet2TableAdapters.tracksTableAdapter()
        Dim T_tracks = Dt_tracks.GetDataByTrackID(lno.CommandArgument)
        Me.L_titlePlayer.Text = T_tracks(0).title
#End Region
    End Sub

    Protected Sub T_songMain(sender As Object, e As EventArgs)
#Region "Song Code"
        If (Session("fullname") IsNot Nothing) Then
            Dim lno As LinkButton = sender
            Dim Track_cd = New DataSet2TableAdapters.map_clipsTableAdapter()
            Dim T_mp3 = Track_cd.GetDataByFormat(lno.CommandArgument, "mp3")
            Dim T_wav = Track_cd.GetDataByFormat(lno.CommandArgument, "wav")
            Me.G_mp3.DataSource = T_mp3
            G_mp3.DataBind()
            Me.G_wav.DataSource = T_wav
            G_wav.DataBind()
            Dim Dt_tracks = New DataSet3TableAdapters.trackDownloadInfoTableAdapter()
            Dim T_tracks = Dt_tracks.GetData(lno.CommandArgument)
            Me.T_titlePop.Text = T_tracks(0).title
            'Me.T_trackId.Text = T_tracks(1).cd_number
            'Me.T_compPop.Text = T_tracks(0).fname & " " & T_tracks(0).lname
            Me.T_pubPop.Text = T_tracks(0)._alias & " " & T_tracks(0).name
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "songS", "$('#songS').modal();", True)
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ErrorLogin();", True)
        End If
#End Region
    End Sub

    Protected Sub track_Click_download(sender As Object, e As EventArgs)
#Region "Track Click Code"
        Dim conn As SqlConnection = New SqlConnection(connection)
        Dim userID As Int32
        Dim loginID As Int32
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand("SELECT TOP 1 [users].[id] FROM [users] WHERE [users].[username] ='" & Session("Username") & "'", conn)
        Dim cmd2 As SqlCommand = New SqlCommand("SELECT (MAX([userlogins].[id])+1) from [userlogins]", conn)
        userID = cmd.ExecuteScalar()
        loginID = cmd2.ExecuteScalar()
        conn.Close()
        Dim lno As LinkButton = sender
        Dim destFileName = lno.CommandArgument
        Dim Pos_g = InStr(destFileName, "_30.mp3")
        Dim FK_trackID As Long = lno.CommandArgument
        Dim cancion = destFileName + "_30.mp3"
        Dim DT_download = New DataSet2TableAdapters.map_downloadTableAdapter()
        DT_download.Insert(FK_trackID, userID, Now.Date, loginID, cancion)
        Response.ContentType = "APPLICATION/OCTET-STREAM"
        Dim Header As [String] = "Attachment; Filename=" & cancion
        Response.AppendHeader("Content-Disposition", Header)
        Dim Dfile As New System.IO.FileInfo(Server.MapPath("/clips/" & cancion))
        Response.WriteFile(Dfile.FullName)
        Response.[End]()
#End Region
    End Sub

    Protected Sub lnkSelect_Click(sender As Object, e As EventArgs)
        If (Session("fullname") IsNot Nothing) Then
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "openModal();", True)
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "ErrorLogin();", True)
        End If
    End Sub

    Protected Sub btnAddProjects_Click(sender As Object, e As EventArgs)
#Region "Add Projects Code"
        Dim sqlCon As New SqlConnection(connection)
        Dim t_id = Me.Label2.Text

        For Each row As GridViewRow In GridProjectList.Rows
            If row.RowType = DataControlRowType.DataRow Then
                Dim chkRow As CheckBox = TryCast(row.Cells(0).FindControl("chkRow"), CheckBox)
                If chkRow.Checked Then
                    Dim projectId = row.Cells(1)  'Tratar de convertir el ID y no el nombre del proyecto..
                    sqlCon.Open()
                    Dim cmd0 As New SqlCommand("SELECT [fk_projectID],[fk_trackID],[fk_userID] FROM [map_projects] WHERE [fk_projectID]=@fk_projectID AND [fk_trackID]=@fk_trackID AND [fk_userID]= (SELECT TOP 1 [users].[id] FROM [users] WHERE [users].[username] = @userName)", sqlCon)
                    cmd0.Parameters.AddWithValue("@fk_projectID", projectId.Text)
                    cmd0.Parameters.AddWithValue("@fk_trackID", t_id)
                    cmd0.Parameters.AddWithValue("@userName", Session("Username"))
                    Dim reader0 As SqlDataReader = cmd0.ExecuteReader()
                    If (reader0.HasRows) Then
                        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "TrackExists();", True)
                    Else
                        sqlCon.Close()
                        sqlCon.Open()
                        Dim cmd1 As New SqlCommand("INSERT INTO map_projects (fk_projectID,fk_trackID,fk_userID) SELECT [projects].[id],[tracks].[id],[users].[id] FROM [projects],[tracks],[users] WHERE [projects].[id] ='" & projectId.Text & "' AND [tracks].[id]='" & t_id & "' AND [users].[username] ='" & Session("Username") & "'", sqlCon)
                        cmd1.ExecuteNonQuery()
                        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Popup", "AddSuccess();", True)
                    End If
                    sqlCon.Close()
                End If
            End If
        Next
#End Region
    End Sub


End Class