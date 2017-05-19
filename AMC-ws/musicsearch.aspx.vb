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

    Protected Sub OnSelectedIndexChanged(sender As Object, e As EventArgs)
        Dim row As GridViewRow = GV_tracks.SelectedRow
        Me.Label2.Text = TryCast(row.FindControl("T_ID"), LinkButton).Text
        Me.Label1.Text = TryCast(row.FindControl("T_title"), LinkButton).Text
    End Sub

    Protected Sub OnSelectedIndexChanged2(sender As Object, e As EventArgs)
        Dim row As GridViewRow = GridStylesGenre.SelectedRow
        Me.Label2.Text = TryCast(row.FindControl("T_ID"), LinkButton).Text
        Me.Label1.Text = TryCast(row.FindControl("T_title"), LinkButton).Text
    End Sub

    Protected Sub OnSelectedIndexChanged3(sender As Object, e As EventArgs)
        Dim row As GridViewRow = GridCDs.SelectedRow
        Me.Label2.Text = TryCast(row.FindControl("T_ID"), LinkButton).Text
        Me.Label1.Text = TryCast(row.FindControl("T_title"), LinkButton).Text
    End Sub

    Protected Sub OnSelectedIndexChanged4(sender As Object, e As EventArgs)
        Dim row As GridViewRow = GridComposers.SelectedRow
        Me.Label2.Text = TryCast(row.FindControl("T_ID"), LinkButton).Text
        Me.Label1.Text = TryCast(row.FindControl("T_title"), LinkButton).Text
    End Sub

    Protected Sub btnAddProjects_Click(sender As Object, e As EventArgs)
        Dim conn As String = "Data Source=.\SQLEXPRESS;Initial Catalog=AMC;Integrated Security=True;"
        Dim sqlCon As New SqlConnection(conn)
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
    End Sub

    Protected Sub CheckAlbum_CheckedChanged(sender As Object, e As EventArgs)
        If CheckAlbum.Checked = True Then
            Me.T_mainsearch.Text = ""
            Me.DD_style.Visible = False
            Me.DD_tempo.Visible = False
            Me.DD_Composer.Visible = False
            Me.btnSearchStyle.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.CheckStyleGenre.Checked = False
            Me.CheckComposer.Checked = False
            Me.GridComposers.Visible = False
            Me.GV_tracks.Visible = False
            Me.GridStylesGenre.Visible = False
            Me.DD_Album.Visible = True
            Me.btnSearchAlbums.Visible = True
            Me.GridCDs.Visible = True
        End If
    End Sub

    Protected Sub CheckStyleGenre_CheckedChanged(sender As Object, e As EventArgs)
        If CheckStyleGenre.Checked = True Then
            Me.T_mainsearch.Text = ""
            Me.DD_Composer.Visible = False
            Me.DD_Album.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.btnSearchAlbums.Visible = False
            Me.GridCDs.Visible = False
            Me.GV_tracks.Visible = False
            Me.GridComposers.Visible = False
            Me.CheckComposer.Checked = False
            Me.CheckAlbum.Checked = False
            Me.DD_tempo.Visible = True
            Me.DD_style.Visible = True
            Me.btnSearchStyle.Visible = True
            Me.GridStylesGenre.Visible = True
        End If
    End Sub

    Protected Sub CheckComposer_CheckedChanged(sender As Object, e As EventArgs)
        If CheckComposer.Checked = True Then
            Me.T_mainsearch.Text = ""
            Me.DD_style.Visible = False
            Me.DD_tempo.Visible = False
            Me.DD_Album.Visible = False
            Me.btnSearchStyle.Visible = False
            Me.btnSearchComposers.Visible = False
            Me.btnSearchAlbums.Visible = False
            Me.GridCDs.Visible = False
            Me.GV_tracks.Visible = False
            Me.GridStylesGenre.Visible = False
            Me.CheckAlbum.Checked = False
            Me.CheckStyleGenre.Checked = False
            Me.GridComposers.Visible = True
            Me.DD_Composer.Visible = True
            Me.btnSearchComposers.Visible = True
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
End Class