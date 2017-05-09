 <%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="project.aspx.vb" Inherits="AMC_ws.project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bodyBg"> 
        <div class="content container">
            <div class="container">
                <div class="row">
                    <section class="col-sm-1"> </section>
                    <section class="col-sm-9">
                        <div class="subTitle">
                            <h2 class="subH2" style="text-align:center;">My Projects</h2>
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

                        <h4>Select Project Folder:</h4>     
                          <asp:DropDownList ID="DD_project" runat="server" DataSourceID="SqlProjects" DataTextField="projectName" DataValueField="projectName" style="width:165px;height:32px;border-radius:4px;">
                              <asp:ListItem>Choose a Project</asp:ListItem>
                          </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlProjects" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [projectName] FROM [projects] ORDER BY 1"></asp:SqlDataSource>
                        </div>   
                        
                        <div class="col-sm-4">
                            <h4>Here is an easy and simple way for you to save all of your various music searches. Create your own project folders instantly. Manage your own files and keep track of your clients music jobs. It's as quick as snapping your fingers!</h4>
                        </div>         
                    </section>                  
                </div>
                
                <br />
                <br />
                <div class="row">
                     <section class="col-sm-offset-2">
                         <h4>Hola</h4>
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

</asp:Content>
