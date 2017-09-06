 <%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="project.aspx.vb" Inherits="AMC_ws.project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bodyBg" style="height:850px;"> 
        <div class="content container">
            <div class="container">
                <div class="row">
                    <section class="col-sm-1"> </section>
                    <section class="col-sm-9">
                        <div class="subTitle">
                            <h2 class="subH2">My Projects</h2>
                        </div>
                    </section>
                    <br />

                    <section class="col-sm-offset-2">  
                           
                        <div class="col-sm-4" style="margin-top:10px;">
                            <button id="B_newFolder" runat="server" type="button" class="btn btn-search"
                            data-toggle="modal" data-target="#newProject"> <span class="glyphicon glyphicon-plus"
                            aria-hidden="true"></span> New Project Folder </button>
                            <br />
                            <br />

                        <h5>Select Project Folder:</h5>     
                          <asp:DropDownList ID="DD_project1" runat="server" DataSourceID="sqlProyectos" DataTextField="projectName" AppendDataBoundItems="true" DataValueField="projectName" AutoPostBack="true" OnSelectedIndexChanged="DD_project_SelectedIndexChanged" style="width:165px;height:32px;border-radius:4px;" >
                                      <asp:ListItem Text="Choose a Project" Value="" />  
                          </asp:DropDownList>
                                <asp:SqlDataSource ID="sqlProyectos" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [projects].[projectName] FROM [projects] JOIN [users] ON [projects].[fk_userID] = [users].[id] WHERE ([users].[username] =@username) AND [projects].[projectName] IS NOT NULL ORDER BY [projects].[projectName]">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="username" SessionField="Username" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                        </div>   
                        
                        <div class="col-sm-4">
                            <h5>Here is an easy and simple way for you to save all of your various music searches. Create your own project folders instantly. Manage your own files and keep track of your clients music jobs. It's as quick as snapping your fingers!</h5>
                        </div>         
                    </section>                  
                </div>
                
                <div class="row">
                     <section class="col-sm-offset-2">
                         <br />
                         <br />
                         <asp:GridView ID="GridProjects" runat="server" AutoGenerateColumns="False" DataSourceID="Sqlproject_Grid" Width="400px" CssClass="table table-bordered" style="text-align:center; margin-top: 0px;" DataKeyNames="id" ShowHeader="False" BackColor="#4d88ff" ForeColor="White" >
                             <Columns >
                                 <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="false"/>
                                 <asp:BoundField DataField="projectName" HeaderText="PROJECT NAME" SortExpression="projectName" HeaderStyle-CssClass="text-center" >
                                 <HeaderStyle CssClass="text-center" />
                                     <ItemStyle Width="70%" HorizontalAlign="Center" VerticalAlign="Top" />
                                 </asp:BoundField>
                                 <asp:TemplateField ShowHeader="False">
                                     <ItemTemplate>
                                         <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Remove" OnClick="Button1_Click"/>
                                     </ItemTemplate>
                                     <ControlStyle CssClass="btn btn-danger" />
                                 </asp:TemplateField>
                             </Columns>

                         </asp:GridView>

                         <asp:SqlDataSource ID="Sqlproject_Grid" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [projectName],[id] FROM [projects] WHERE (([projectName] = @projectName) AND ([fk_userID] = (SELECT TOP 1 [users].[id] FROM [users] WHERE [users].[username] = @userName) ))">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="DD_project1" Name="projectName" PropertyName="SelectedValue" Type="String"  /> 
                                 <asp:SessionParameter Name="userName" SessionField="Username" Type="String" />
                             </SelectParameters>
                         </asp:SqlDataSource>

                         <asp:GridView ID="GridTracksInProject" runat="server" AutoGenerateColumns="False" Width="400px" CssClass="table table-bordered" Style="text-align: center; margin-top: 0px;" ShowHeader="False" Height="16px" AlternatingRowStyle-BackColor="#d3d3d3" OnRowDeleting="GridTracksInProject_RowDeleting" DataKeyNames="fk_trackID" OnRowDataBound="GridTracksInProject_RowDataBound">
                             <AlternatingRowStyle BackColor="LightGray"></AlternatingRowStyle>
                             <Columns>
                                 <asp:TemplateField HeaderText="Track Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("title") %>' CommandArgument='<%# Bind("fk_trackID") %>' OnClick="T_title_Click">
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="70%" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>

                                 <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-danger" DeleteText="Remove" />
                             </Columns>
                         </asp:GridView>
                          </section>
                              
                    <section class="col-sm-1"> </section>
                        <section class="col-sm-offset-2">                <!-- Define los elementos HTML donde waveform se cargara -->
                         <div id="Player" style="width:500px;">
                             <div id="waveform" style="text-align: center; color: royalblue; font-size: 16px;">
                                 <h5><asp:Label ID="L_titlePlayer" runat="server" ForeColor="RoyalBlue"></asp:Label></h5>
                             </div>
                             <br />
                             <div class="controls" style="text-align: center;width:500px;">
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
                     </section>

                </div>
            </div>
        </div>

        <!--New Project Folder-->
            <div class="modal fade" id="newProject">
              <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header song_sel_panel-header"> 
                      <button type="button" class="close" data-dismiss="modal">×</button>
                      <h3 class="modal-title"> <span class="glyphicon glyphicon-folder-open"></span>        Add new Project</h3>
                    </div>

                    <div class="modal-body">  
                         <h6>Add your favorite songs to your project folder</h6>      
                        <div class="input-group"> 
                            <asp:TextBox ID="T_newfolder" runat="server" class="form-control" placeholder="New Project Folder..."></asp:TextBox>
                            <div class="input-group-btn">
                                <asp:Button ID="B_addfolder" runat="server" class="btn btn-search" Text="+" />
                            </div> 
                        </div>
                    </div>
                </div>
                </div>
            </div>
        <!-- Termina Pop up-->
    </div>
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

         function SuccessDelete() {
             swal("Project Delete", "Your project has been deleted successfully!", "success")
         }
         function FolderAdded() {
             swal("Folder Added!", "Your folder has been added successfully!", "success","timer:1000")
             }
         function ValidateEmptyFolder() {
             swal("Project Creation", "You need to fill project name field!", "warning")
         }
         function ProjectExists() {
             swal("Project Creation", "This project already exists!", "warning")
         }
    </script>
</asp:Content>
