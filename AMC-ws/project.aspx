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
                            <h4>Here is an easy and simple way for you to save all of your various music searches. Create your own project folders instantly. Manage your own files and keep track of your clients music jobs. It's as quick as snapping your fingers!</h4>
                        </div>         
                    </section>                  
                </div>
                
                <div class="row">
                     <section class="col-sm-offset-2">
                         <br />
                         <br />
                         <asp:GridView ID="GridProjects" runat="server" AutoGenerateColumns="False" DataSourceID="Sqlproject_Grid" Width="500px" CssClass="table table-bordered" style="text-align:center; margin-top: 0px;" DataKeyNames="id" ShowHeader="False" BackColor="#4d88ff" ForeColor="White" >
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

                         <asp:GridView ID="GridTracksInProject" runat="server" AutoGenerateColumns="False" Width="500px" CssClass="table table-bordered" Style="text-align: center; margin-top: 0px;" ShowHeader="False" Height="16px" AlternatingRowStyle-BackColor="#d3d3d3" OnRowDeleting="GridTracksInProject_RowDeleting" DataKeyNames="fk_trackID" OnRowDataBound="GridTracksInProject_RowDataBound">
                             <AlternatingRowStyle BackColor="LightGray"></AlternatingRowStyle>
                             <Columns>
                                 <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title">
                                     <ItemStyle Width="70%" HorizontalAlign="Center" VerticalAlign="Top" />
                                     </asp:BoundField>
                                 <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-danger" DeleteText="Remove" />
                             </Columns>
                         </asp:GridView>

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

    <script>
         function SuccessDelete() {
             swal("Project Delete", "Your project has been deleted successfully!", "success")
         }

         function ValidateEmptyFolder() {
             swal("Project Creation", "You need to fill project name field!", "warning")
         }

         function ProjectExists() {
             swal("Project Creation", "This project already exists!", "warning")
         }
    </script>
</asp:Content>
