<%@ Page Title="American Music Company" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="album.aspx.vb" Inherits="AMC_ws.album" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .song_sel_panel-header {
            color: #ffffff;
            background-color: #1A6ECD;
        }

        .song_sel_panel-footer {
            color: #CC1635;
            background-color: #ebebeb;
        }

        .glyColor {
            color: white;
        }

        .colpad {
            padding-left: 5px;
        }
        .hiddencol
          {
            display: none;
          }
        .Headerpad
        {
            padding-left: 5px;
        }
    </style>

    <div class="bodyBg" style="height:500px;">
        <div class="content container">
            <div class="container">
                <div class="row">
                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <div class="subTitle">
                            <h2 class="subH2">
                                <asp:Label ID="T_albumTitle" runat="server" Text="Label"></asp:Label></h2>
                        </div>
                        <div class="container col-sm-12">
                            <asp:GridView ID="GV_tracks" runat="server" AutoGenerateColumns="False" GridLines="None" OnSelectedIndexChanged ="OnSelectedIndexChanged" DataKeyNames="id">
                                <Columns>

                                    <asp:TemplateField HeaderText="Id" Visible="false">
                                        <ItemTemplate>
                                        <asp:LinkButton ID="T_ID" runat="server" Text='<%# Bind("id") %>' CommandArgument='<%# Bind("id") %>'>
                                        </asp:LinkButton>
                                       </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:BoundField DataField="track_number" HeaderText="Track #">
                                        <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:BoundField>                        
                                    
                                    <asp:TemplateField HeaderText="Track Name">
                                        <ItemTemplate>
                                            <span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
                                            <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("title") %>'
                                                CommandArgument='<%# Bind("id") %>' OnClick="track_Click">
                                            </asp:LinkButton>
                                           <%-- <asp:Label ID="T_duration" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle Width="30%" HorizontalAlign="Left" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                     
                                    <asp:BoundField DataField="descrip" HeaderText="Description">
                                        <ItemStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Top" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="instruments" HeaderText="Instruments" HeaderStyle-CssClass="colpad">
                                        <ItemStyle CssClass="colpad" Width="30%" HorizontalAlign="Left" VerticalAlign="Top" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Save">
                                        <ItemTemplate>
                                            <!-- Open select project pop up -->
                                            <asp:LinkButton ID="lnkSelect" runat="server" CssClass="btn btn-warning" CommandName="Select" OnClick="lnkSelect_Click" style="margin-bottom:5px;">
                                                <span class="glyColor glyphicons glyphicon glyphicon-folder-open" />
                                             </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" ForeColor="White" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Download">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="T_songMain" CssClass="btn btn-info" runat="server"
                                                CommandArgument='<%# Bind("id") %>' OnClick="T_songMain" >
                                                <span class="glyphicons glyphicon glyphicon-save"/>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>  
                                    
<%--                                      <asp:TemplateField HeaderText="Play" HeaderStyle-CssClass="Headerpad">
                                        <ItemTemplate>
                                            <!-- Open select project pop up -->
                                            <asp:LinkButton ID="lnkPlayer" runat="server" CssClass="btn btn-warning" CommandName="Select" OnClick="lnkPlayer_Click">
                                                <span class="glyphicon glyphicon-play-circle" />
                                             </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" ForeColor="White" />
                                    </asp:TemplateField> --%>      

                                </Columns>
                            </asp:GridView>

                            <!-- Pop UP Download -->
                            <div class="modal fade" id="songS" align="left">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header song_sel_panel-header">
                                            <div>
                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                                <h3 class="modal-title" align="left">
                                                    <asp:Label ID="T_titlePop" runat="server"></asp:Label>
                                                </h3>
                                                <h5> <i><asp:Label ID="T_trackId" runat="server" Visible="false"></asp:Label></i> </h5>
                                            </div>
                                            <div>
                                                <h5>Published By:
                                                    <asp:Label ID="T_pubPop" runat="server"></asp:Label></h5>
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
                                                                        <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("clip_length") %>'
                                                                            CommandArgument='<%# Bind("id") %>' OnClick="track_Click_download">
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
                                                                        <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("clip_length") %>'
                                                                            CommandArgument='<%# Bind("id") %>' OnClick="track_Click_download">
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

        <!--New Project Folder-->
        <div class="modal fade" id="ProjectList">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header song_sel_panel-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3 class="modal-title"><span class="glyphicon glyphicon-floppy-save"></span>Save to Project</h3>
                    </div>

                    <div class="modal-body">
                        <h5>Choose a Project to add this Track to:</h5>
                        <strong><span class="glyphicon glyphicon-music"> </span><asp:Label ID="Label1" runat="server" Text="Label" style="margin-left: 30px;"/></strong>
                        <asp:Label ID="Label2" runat="server" Text="Label" style="margin-left: 30px;" Visible="false"/>
                         <br />
                        <br />
                        <div class="input-group" style="margin-left: 10px;">

                            <asp:GridView ID="GridProjectList" runat="server" CssClass="table table-bordered" DataSourceID="SqlprojectList_Grid" AutoGenerateColumns="false" DataKeyNames="id">
                           <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkRow" runat="server"/>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="id" HeaderText="Id" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>

                            <asp:BoundField DataField="projectName" HeaderText="Project"/>
                           </Columns>
                           </asp:GridView>

                            <asp:SqlDataSource ID="SqlprojectList_Grid" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [projects].[id],[projects].[projectName] FROM [projects] JOIN [users] ON [projects].[fk_userID] = [users].[id] WHERE ([users].[username] =@username) ORDER BY [projects].[projectName]">
                              <SelectParameters>
                                  <asp:SessionParameter Name="username" SessionField="Username" />
                              </SelectParameters>
                             </asp:SqlDataSource>

                            <br />
                            <asp:Button ID="btnAddProjects" runat="server" Text="Add" CssClass="btn btn-success" Width="200px" OnClick="btnAddProjects_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Termina Pop up-->

         <!--Pop Up Player-->
        <div class="modal fade" id="PlayerPop" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header song_sel_panel-header">
                        <button type="button" class="close" data-dismiss="modal" onclick="wavesurfer.toggleMute();return false">X</button>
                        <h3 class="modal-title"><span class="glyphicon glyphicon-volume-up"></span>   Song Player</h3>
                    </div>
                    <div class="modal-body">
                        <!-- Define los elementos HTML donde waveform se cargara -->
                        <div id="Player">
                            <div id="waveform" style="text-align: center; color: royalblue;font-size: 16px;">
                                <asp:Label ID="L_titlePlayer" runat="server"></asp:Label>
                            </div>
                            <div class="controls" style="text-align:center;">
                                <button class="btn btn-danger" onclick="wavesurfer.skipBackward();return false">
                                    <span class="glyphicon glyphicon-backward" aria-hidden="true"></span>
                                </button>

                                <button class="btn btn-primary" onclick="wavesurfer.playPause();return false">
                                    <span class="glyphicon glyphicon-play" aria-hidden="true"></span>
                                    /
                        <span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
                                </button>

                                <button class="btn btn-danger" onclick="wavesurfer.skipForward();return false">
                                    <span class="glyphicon glyphicon-forward" aria-hidden="true"></span>
                                </button>

                                <button class="btn btn-default" onclick="wavesurfer.toggleMute();return false">
                                    <span class="glyphicon glyphicon-volume-off" aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                        <!-- end div player -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Termina Pop up-->


    </div>
    <!-- End div main body -->


    <style type="text/css">
        #Player {
            /*position: fixed;
            bottom: 0;
            margin-bottom: 55px;*/
            align-content: center;            /*a:link{cursor:pointer}a:link{color:#1a0dab}*/
                }
    </style>

    <!-- Incluimos wavesurfer.js desde cdnjs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.4/wavesurfer.min.js"></script>


    <script>

        var wavesurfer = WaveSurfer.create({
            container: '#waveform',
            waveColor: 'blue',
            progressColor: 'red',
            height: 80,
            width:1000
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

        function AddSuccess() {
            swal({
                title: 'Track Added!',
                text:  'The track selected was added successfully to project(s)',
                type: 'success'
            });
        }

        function NoProjectChecked() {
            swal({
                title: 'No Project(s) Selected!',
                text:  'No project(s) checked to add track',
                type:  'warning'
            });
        }

        function TrackExists() {
            swal("Track to Project", "This track already exists in this project!", "warning")
        }

        function openModal() {
            $('#ProjectList').modal('show');
        }

        function openPlayer() {
            $('#PlayerPop').modal('show');
        }


    </script>

</asp:Content>
