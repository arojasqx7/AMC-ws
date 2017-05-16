<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="musicsearch.aspx.vb" Inherits="AMC_ws.musicsearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
.mycheckbox
    {
        margin-left:25px;
    } 
.mycheckbox input[type="checkbox"] 
    { 
        margin-right: 5px; 
    }
</style>

<script src="js/jquery-2.2.3.min.js"></script>
    <script type="text/javascript">
    $(function () {
        $('[id*=T_mainsearch]').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            ,source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/musicsearch.aspx/GetTracks") %>',
                    data: "{ 'prefix': '" + request + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        items = [];
                        map = {};
                        $.each(data.d, function (i, item) {
                            var id = item.split('-')[1];
                            var name = item.split('-')[0];
                            map[name] = { id: id, name: name };
                            items.push(name);
                        });
                        response(items);
                        $(".dropdown-menu").css("height", "auto");
                    },
                });
            },
            updater: function (item) {
                $('[id*=hfTrackId]').val(map[item].id);
                return item;
            }
        });
    });
</script>

    <script>
        var objChkd;
        function HandleOnCheck() {
            var chkLst = document.getElementById('CheckBoxList1');
            if (objChkd && objChkd.checked)
                objChkd.checked = false; objChkd = event.srcElement;
        }
    </script>

    <div class="bodyBg">
      <!-- InstanceBeginEditable name="Edit-content" -->
      <!-- content -->
        <div class="content container">
            <div class="container">
                <div class="row">
                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <div class="subTitle">
                            <h3 class="subH2">Music Search</h3>
                        </div>
                    </section>
                    <section class="col-sm-2"></section>
                </div>
                <br />
                <br />
                <div class="container">
                    <div class="row">
                        <section class="col-sm-2"></section>
                        <section class="col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Select Filter</h3>
                                    <span class="pull-right" style="margin-top: -15px;"><i class="glyphicon glyphicon-filter"></i></span>
                                </div>

                                <div class="panel-body">

                                     <div style="display: inline-flex;">
                                        <div class="form-group">
                                            <label>Quick Search</label>
                                            <div class="input-group">
                                                <asp:TextBox ID="T_mainsearch" CssClass="form-control" placeholder="Search..." runat="server" autocomplete="off" Style="width: 400px;"> </asp:TextBox>
                                                <asp:HiddenField ID="hfTrackId" runat="server" />
                                                <asp:Button ID="B_Search" runat="server" Text="GO" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div style="display: inline-flex; margin-top: 25px;">
                                        <asp:CheckBox ID="CheckStyleGenre" Text="Style or Genre" runat="server"/>
                                        <asp:CheckBox ID="CheckComposer" Text="Composer" runat="server" CssClass="mycheckbox" />
                                        <asp:CheckBox ID="CheckAlbum" Text="Album" runat="server" CssClass="mycheckbox" />
                                        <asp:LinkButton ID="LinkButton1" runat="server" Style="margin-left: 60px;" OnClick="LinkButton1_Click">Show Filter</asp:LinkButton>
                                    </div>

                                    <div style="display: inline-flex; margin-top: 25px;">
                                        <asp:DropDownList ID="DD_style" CssClass="form-control" runat="server" DataSourceID="SqlGenre" DataTextField="name" AppendDataBoundItems="true" Style="width: 200px;" Visible="false">
                                            <asp:ListItem Text="Select a style or Genre" Value="" />
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlGenre" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT name FROM map_genres ORDER BY name"></asp:SqlDataSource>

                                        <div class="form-group" style="margin-left: 40px;">
                                            <asp:DropDownList ID="DD_tempo" CssClass="form-control" runat="server" DataSourceID="Sqltempo" DataTextField="name" DataValueField="name" Style="width: 200px;" Visible="false"></asp:DropDownList>
                                            <asp:SqlDataSource ID="Sqltempo" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT 'Select a Tempo' AS name UNION ALL SELECT DISTINCT name FROM map_tempos_tracks"></asp:SqlDataSource>
                                        </div>

                                        <div class="form-group" style="margin-left: 10px;">
                                            <asp:LinkButton ID="btnSearchStyle" runat="server" CssClass="btn btn-primary" Visible="false">
                                                <span aria-hidden="true" class="glyphicon glyphicon-search"></span>
                                            </asp:LinkButton>
                                        </div>
                                    </div>

                                    <div style="display: inline-flex; margin-top: 25px;">
                                        <div class="form-group">
                                            <asp:DropDownList ID="DD_Composer" class="form-control" runat="server" DataSourceID="SqlComposer" DataTextField="ComposerName" DataValueField="ComposerName" Style="width: 200px;" Visible="false"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlComposer" ConnectionString='<%$ ConnectionStrings:AMC %>' SelectCommand="SELECT 'Select a Composer' AS ComposerName UNION ALL SELECT DISTINCT [ComposerName] FROM [V_Composers]"></asp:SqlDataSource>
                                        </div>

                                        <div class="form-group" style="margin-left: 10px;">
                                            <asp:LinkButton ID="btnSearchComposers" runat="server" CssClass="btn btn-primary" Visible="false">
                                                <span aria-hidden="true" class="glyphicon glyphicon-search"></span>
                                            </asp:LinkButton>
                                        </div>
                                    </div>

                                    <div style="display: inline-flex; margin-top: 25px;">
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="DD_Album" runat="server" DataSourceID="SqlAlbum" DataTextField="Album" DataValueField="Album" Style="width: 200px;" Visible="false"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlAlbum" ConnectionString='<%$ ConnectionStrings:AMC %>' SelectCommand="SELECT 'Select a Album' AS Album UNION ALL SELECT DISTINCT [Album] FROM [V_Album]"></asp:SqlDataSource>
                                        </div>

                                        <div class="form-group" style="margin-left: 10px;">
                                            <asp:LinkButton ID="btnSearchAlbums" runat="server" CssClass="btn btn-primary" Visible="false">
                                                <span aria-hidden="true" class="glyphicon glyphicon-search"></span>
                                            </asp:LinkButton>
                                        </div>
                                    </div>

                                    <div style="display: inline-flex; margin-top: 25px;">
                                        <div class="form-group">
                                            <asp:Label ID="LblCheck" runat="server" Text="You need to check a filter!" CssClass="text-info" Visible="false"></asp:Label>
                                        </div>
                                    </div>

                                     <div style="display: inline-flex; margin-top: 25px;">
                                        <div class="form-group">
                                            <asp:Label ID="lblCheckAll" runat="server" Text="You cannot check all filters at the same time!" CssClass="text-info" Visible="false"></asp:Label>
                                        </div>
                                    </div>

                                     <div style="display: inline-flex; margin-top: 25px;">
                                        <div class="form-group">
                                            <asp:Label ID="lblOneFilter" runat="server" Text="You need to check only one filter!" CssClass="text-info" Visible="false"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </section>
                    </div>
                  </div> <!-- end container panel -->

                <div class="row">   <!-- Grid for Quick search -->
                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <br />
                        <br />
                        <asp:GridView ID="GV_tracks" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" Style="text-align: center; margin-top: 0px;" DataKeyNames="id" DataSourceID="SqlTrackInfo" HeaderStyle-BackColor="#1A6ECD" HeaderStyle-ForeColor="White">
                            <Columns>

                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="false" />

                                <asp:TemplateField HeaderText="Track Name">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("title") %>'
                                            CommandArgument='<%# Bind("id") %>'>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="30%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>

                                <asp:BoundField DataField="descrip" HeaderText="Description" SortExpression="descrip">
                                    <ItemStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>

                                <asp:BoundField DataField="instruments" HeaderText="Instruments" HeaderStyle-CssClass="colpad" SortExpression="instruments">
                                    <ItemStyle CssClass="colpad" Width="30%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Save">
                                    <ItemTemplate>
                                        <!-- Open select project pop up -->
                                        <asp:LinkButton ID="lnkSelect" runat="server" CssClass="btn btn-danger" CommandName="Select" OnClick="lnkSelect_Click">
                                 <span class="glyColor glyphicons glyphicon glyphicon-folder-open" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" ForeColor="White" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Download">

                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_songMain" CssClass="btn btn-info" runat="server"
                                            CommandArgument='<%# Bind("id") %>'>
                                <span class="glyphicons glyphicon glyphicon-save"/>
                                        </asp:LinkButton>

                                    </ItemTemplate>
                                    <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" />
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlTrackInfo" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [id], [title], [descrip], [instruments] FROM [tracks] WHERE ([title] = @title)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="T_mainsearch" Name="title" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </section>
                </div>  <!-- End Grid for Quick search -->

                <div class="row"><!-- Grid for Style & Genre -->
                    
                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <br />
                        <br />
                        <asp:GridView ID="GridStylesGenre" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" Style="text-align: center; margin-top: 0px;" HeaderStyle-BackColor="#1A6ECD" HeaderStyle-ForeColor="White"></asp:GridView>
                    </section>
                </div>
            </div>

            <div class="form-group"> <br>

            </div>
            <div> <br/>
            </div>
            <div class="row">
              <section class="col-sm-3 col-sm-offset-1"> <a class="btn-group subhead-blue"

                  href="#"> <img src="images/licensing-hp-icon.png" class="img-responsive center-block"

                    alt="headphoneIcon"> </a> </section>
              <section class="col-sm-3"> <a class="btn-group subhead-blue" href="#">
                  <img src="images/licensing-bass-icon.png" class="img-responsive center-block"

                    alt="bassIcon"> </a> </section>
              <section class="col-sm-3"> <a class="btn-group subhead-blue" href="#">
                  <img src="images/licensing-mic-icon.png" class="img-responsive center-block"

                    alt="micIcon"> </a> </section>
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
<%--                        <div class="input-group" style="margin-left: 10px;">

                            <asp:GridView ID="GridProjectList" runat="server" CssClass="table table-bordered" DataSourceID="SqlprojectList_Grid" AutoGenerateColumns="false">
                           <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkRow" runat="server"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="projectName" HeaderText="Project"/>
                           </Columns>
                           </asp:GridView>

                            <asp:SqlDataSource ID="SqlprojectList_Grid" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [projects].[projectName] FROM [projects] JOIN [users] ON [projects].[fk_userID] = [users].[id] WHERE ([users].[username] =@username) ORDER BY [projects].[projectName]">
                              <SelectParameters>
                                  <asp:SessionParameter Name="username" SessionField="Username" />
                              </SelectParameters>
                             </asp:SqlDataSource>

                            <br />
                            <asp:Button ID="btnAddProjects" runat="server" Text="Add" CssClass="btn btn-success" Width="200px" OnClick="btnAddProjects_Click" />
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
        <!-- Termina Pop up-->

      </div>

    <script>
     function openModal() {
            $('#ProjectList').modal('show');
        }
    </script>
</asp:Content>
