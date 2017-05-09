<%@ Page Title="American Music Company" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="album.aspx.vb" Inherits="AMC_ws.album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .song_sel_panel-header{
            color: #ffffff;
            background-color: #1A6ECD;
        }
        .song_sel_panel-footer{
            color: #CC1635;
            background-color: #ebebeb;
        }
        .glyColor{
            color: white;
        }
        .colpad{
            padding-left: 5px;
        }
    </style>
    <div class="bodyBg">
        <div class="content container">
        <div class="container">
          <div class="row">
            <section class="col-sm-1"> </section>
            <section class="col-sm-9">
              <div class="subTitle">
                <h2 class="subH2"><asp:Label ID="T_albumTitle" runat="server" Text="Label"></asp:Label></h2>
              </div>
              <div class="container col-sm-12">
                <asp:GridView ID="GV_tracks" runat="server" AutoGenerateColumns="False" GridLines="None">
        <Columns>
            <asp:BoundField DataField="track_number" HeaderText="Track #" >
            <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Track Name">
                <ItemTemplate>
                    <span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span> 
                    <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("title") %>' 
                     CommandArgument='<%# Bind("id") %>' OnClick="track_Click">
                    </asp:LinkButton> <asp:Label ID="T_duration" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="30%" HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:BoundField DataField="descrip" HeaderText="Description" >
            <ItemStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="instruments" HeaderText="Instruments" HeaderStyle-CssClass="colpad" >
            <ItemStyle CssClass="colpad" Width="30%" HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Save">
                <ItemTemplate>
                    <asp:LinkButton ID="T_songSave" CssClass="btn btn-danger" runat="server"
                        
                        CommandArgument='<%# Bind("id") %>' OnClick="T_songMain">
                        <span class="glyColor glyphicons glyphicon glyphicon-folder-open"/>

                    </asp:LinkButton>

                   
                </ItemTemplate>
                <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" ForeColor="White" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Download">
                
                <ItemTemplate>
                    <asp:LinkButton ID="T_songMain" CssClass="btn btn-info" runat="server"
                        
                        CommandArgument='<%# Bind("id") %>' OnClick="T_songMain">
                        <span class="glyphicons glyphicon glyphicon-save"/>

                    </asp:LinkButton>

                   
                </ItemTemplate>
                <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

              <div class="modal fade" id="songS" align="left">
              <div class="modal-dialog modal-sm">
                <div class="modal-content">
                  <div class="modal-header song_sel_panel-header"> 
                      <div>
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3 class="modal-title" align="left">
                          <asp:Label ID="T_titlePop" runat="server"></asp:Label>
                        </h3>
                            <br />
                        <h5>
                         <i><asp:Label ID="T_trackId" runat="server"></asp:Label></i>  
                        </h5>
                      </div>
                      <div>
                          <h5>Compossed By: <asp:Label ID="T_compPop" runat="server"></asp:Label></h5>
                      </div>  
                      <div>
                          <h5>Published By: <asp:Label ID="T_pubPop" runat="server"></asp:Label></h5>
                      </div>               
                  </div>
                  <div class="modal-body">        
                      <table style="width: 100%;">
                          <tr>
                              <td><b>mp3</b></td>
                              <td><b>wav</b></td>                           
                          </tr>
                          <tr>
                              <td>
                                  <asp:GridView ID="G_mp3" ShowHeader="false" runat="server" AutoGenerateColumns="False" GridLines="None">
                                      <Columns>
                                          <asp:TemplateField HeaderText="Track Name">
                                            <ItemTemplate>
                                            <span class="glyphicons glyphicons-disk-save" aria-hidden="true"></span>
                                            <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("track_lenght") %>' 
                                             CommandArgument='<%# Bind("file_name") %>' OnClick="track_Click_download">
                                            </asp:LinkButton>                                        
                                            </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                  </asp:GridView>
                              </td>
                              <td>
                                  <asp:GridView ID="G_wav" ShowHeader="false" runat="server" AutoGenerateColumns="False" GridLines="None">
                                      <Columns>
                                          <asp:TemplateField HeaderText="Track Name">
                                            <ItemTemplate>
                                            <span class="glyphicons glyphicons-disk-save" aria-hidden="true"></span>
                                            <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("track_lenght") %>' 
                                             CommandArgument='<%# Bind("file_name") %>' OnClick="track_Click_download">
                                            </asp:LinkButton>                                        
                                            </ItemTemplate>
                                          </asp:TemplateField>
                                          
                                      </Columns>
                                  </asp:GridView>
                              </td>
                          </tr>
                          
                      </table>
                      
                  </div>
                  <div class="modal-footer song_sel_panel-footer"> 
                      <h6>Only one music file may be downloaded at a time.</h6>
                  </div>
                </div>
              </div>
            </div>

              </div>
              
                
                
            </section>

        </div>
    </div>
        </div>
     
        <style type="text/css">
                #Player {
                position: fixed;
                bottom: 0;
                margin-bottom: 50px;
                align-content: center;
                width: 100%;
                background-color:lightgrey;
                }
                a:link{cursor:pointer}a:link{color:#1a0dab}
              </style>
    <!-- Incluimos wavesurfer.js desde cdnjs -->
              <script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.4/wavesurfer.min.js"></script>
    <!-- Define los elementos HTML donde waveform se cargara -->
            <div id="Player">
                <div id="waveform">
                    <asp:Label ID="L_titlePlayer" runat="server"></asp:Label>
                </div>
                <div class="controls">
                    <button class="btn btn-primary" onclick="wavesurfer.skipBackward();return false">
                        <span class="glyphicon glyphicon-backward" aria-hidden="true"></span>         
                    </button>

                    <button class="btn btn-primary" onclick="wavesurfer.playPause();return false">
                        <span class="glyphicon glyphicon-play" aria-hidden="true"></span>
                        /
                        <span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
                    </button>
 
                    <button class="btn btn-primary" onclick="wavesurfer.skipForward();return false">
                        <span class="glyphicon glyphicon-forward" aria-hidden="true"></span>
                    </button>
 
                    <button class="btn btn-primary" onclick="wavesurfer.toggleMute();return false">
                        <span class="glyphicon glyphicon-volume-off" aria-hidden="true"></span>
                    </button>
                </div>
  <script>

    var wavesurfer = WaveSurfer.create({
    container: '#waveform',
    waveColor: 'blue',
    progressColor: 'red',
    height: 50
    });
 
    
    function cargarCancion(Cancion) {
        wavesurfer.load(Cancion);
        wavesurfer.on('ready', function () {
            wavesurfer.playPause();
        });
    }
  </script>
  <script type="text/javascript">
        function ErrorLogin() {
            swal({
                title: 'Loggin',
                text: 'You must be logged in to use this feature',
                type: 'error'
            });
        }
        
    </script>   
    </div>
              <span class="glyphicons glyphicons-download-alt"></span></div>
            </div> 
</asp:Content>
