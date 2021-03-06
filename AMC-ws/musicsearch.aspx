﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="musicsearch.aspx.vb" Inherits="AMC_ws.musicsearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/TablesStyle.css" rel="stylesheet" />
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
    .hiddencol
    {
        display: none;
    }
</style>

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
                                                <asp:LinkButton ID="BtnSearch" runat="server" CssClass="btn btn-primary" OnClick="B_Search_Click">
                                                    <span aria-hidden="true" class="glyphicon glyphicon-search"></span>
                                                    </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div style="display: inline-flex; margin-top: 25px;">
                                        <asp:CheckBox ID="CheckStyleGenre" Text="Style or Genre" AutoPostBack="true" runat="server" OnCheckedChanged="CheckStyleGenre_CheckedChanged"/>
                                        <asp:CheckBox ID="CheckComposer" Text="Composer" runat="server" AutoPostBack="true" CssClass="mycheckbox" OnCheckedChanged="CheckComposer_CheckedChanged" />
                                        <asp:CheckBox ID="CheckAlbum" Text="Album" runat="server" CssClass="mycheckbox" AutoPostBack="true" OnCheckedChanged="CheckAlbum_CheckedChanged"/>
                                    </div>

                                    <div style="display: inline-flex; margin-top: 25px;">
                                        <asp:DropDownList ID="DD_style" CssClass="form-control" runat="server" DataSourceID="SqlGenre" DataTextField="name" AppendDataBoundItems="true" Style="width: 200px;" Visible="false">
                                            <asp:ListItem Text="Select a style or Genre" Value="" />
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlGenre" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT DISTINCT name FROM map_genres ORDER BY name"></asp:SqlDataSource>

                                        <div class="form-group" style="margin-left: 40px;">
                                            <asp:DropDownList ID="DD_tempo" CssClass="form-control" runat="server" DataSourceID="Sqltempo" DataTextField="name" DataValueField="name" Style="width: 200px;" Visible="false"></asp:DropDownList>
                                            <asp:SqlDataSource ID="Sqltempo" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT 'Select a Tempo' AS name UNION ALL SELECT DISTINCT name FROM map_tempos_tracks"></asp:SqlDataSource>
                                        </div>

                                        <div class="form-group" style="margin-left: 10px;">
                                            <asp:LinkButton ID="btnSearchStyle" runat="server" CssClass="btn btn-primary" Visible="false" OnClick="btnSearchStyle_Click">
                                                <span aria-hidden="true" class="glyphicon glyphicon-search"></span>
                                            </asp:LinkButton>
                                        </div>
                                    </div>

                                    <div style="display: inline-flex; margin-top: 25px;">
                                        <div class="form-group">
                                            <asp:DropDownList ID="DD_Composer" class="form-control" runat="server" DataSourceID="SqlComposer"  DataTextField="fullname" DataValueField="fullname" Style="width: 200px;" Visible="false" AppendDataBoundItems="true">
                                                <asp:ListItem Text="Select a Composer" Value="" />
                                            </asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlComposer" ConnectionString='<%$ ConnectionStrings:AMC %>' SelectCommand="SELECT DISTINCT CONCAT([fname],' ',[lname]) AS fullname FROM [composers] ORDER BY CONCAT([fname],' ',[lname])"></asp:SqlDataSource>
                                        </div>

                                        <div class="form-group" style="margin-left: 10px;">
                                            <asp:LinkButton ID="btnSearchComposers" runat="server" CssClass="btn btn-primary" Visible="false" OnClick="btnSearchComposers_Click">
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
                                            <asp:LinkButton ID="btnSearchAlbums" runat="server" CssClass="btn btn-primary" Visible="false" OnClick="btnSearchAlbums_Click">
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

                <br />
                <div class="row">   <!-- Grid for Quick search -->
                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <asp:GridView ID="GV_tracks" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnSelectedIndexChanged ="OnSelectedIndexChanged" DataSourceID="SqlTrackInfo" HeaderStyle-ForeColor="Black" Visible="false" PageSize="10" AllowPaging="true" GridLines="None">
                           <pagersettings  mode="Numeric" position="Bottom" pagebuttoncount="10" />
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center"/>
                             <Columns>
                                <asp:TemplateField HeaderText="Id" Visible="false">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_ID" runat="server" Text='<%# Bind("id") %>' CommandArgument='<%# Bind("id") %>'>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Track Name">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("title") %>'
                                            CommandArgument='<%# Bind("id") %>' OnClick="T_title_Click">
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
                                        <asp:LinkButton ID="lnkSelect" runat="server" CssClass="btn btn-warning" CommandName="Select" OnClick="lnkSelect_Click">
                                 <span class="glyColor glyphicons glyphicon glyphicon-folder-open" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" ForeColor="White" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Download">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_songMain" CssClass="btn btn-info" runat="server"
                                            CommandArgument='<%# Bind("id") %>' CommandName="Select" OnClick="T_songMain_Click">
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
                        <asp:GridView ID="GridStylesGenre" runat="server" AutoGenerateColumns="False" HeaderStyle-ForeColor="Black" DataKeyNames="id" DataSourceID="SqlStylesGenre" OnSelectedIndexChanged ="OnSelectedIndexChanged2" Visible="false" PageSize="10" AllowPaging="true" GridLines="None">
                          <pagersettings  mode="Numeric" position="Bottom" pagebuttoncount="10" />
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center"/>
                              <Columns>
                                <asp:TemplateField HeaderText="Id" Visible="false">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_ID" runat="server" Text='<%# Bind("id") %>' CommandArgument='<%# Bind("id") %>'>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Track Name">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("title") %>'
                                            CommandArgument='<%# Bind("id") %>' OnClick="T_title_Click">
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="30%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>

                                <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre">
                                    <ItemStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Tempo" HeaderText="Tempo" SortExpression="Tempo">
                                     <ItemStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Save">
                                    <ItemTemplate>
                                        <!-- Open select project pop up -->
                                        <asp:LinkButton ID="lnkSelect" runat="server" CssClass="btn btn-warning" CommandName="Select" OnClick="lnkSelect_Click">
                                 <span class="glyColor glyphicons glyphicon glyphicon-folder-open" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" ForeColor="White" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Download">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_songMain" CssClass="btn btn-info" runat="server"
                                            CommandArgument='<%# Bind("id") %>' CommandName="Select" OnClick="T_songMain_Click">
                                <span class="glyphicons glyphicon glyphicon-save"/>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" />
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlStylesGenre" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [id], [Genre], [title], [Tempo] FROM [View_StylesGenre] WHERE (([Genre] = @Genre) AND ([Tempo] = @Tempo))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DD_style" Name="Genre" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="DD_tempo" Name="Tempo" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </section>
                </div> <!-- End Grid Style & Genre-->

                <div class="row"><!-- Grid for Albums -->
                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">  
                        <asp:GridView ID="GridCDs" runat="server" AutoGenerateColumns="False" HeaderStyle-ForeColor="Black" DataSourceID="SqlCDs" OnSelectedIndexChanged ="OnSelectedIndexChanged3" Visible="false" PageSize="10" AllowPaging="true" GridLines="None">
                         <pagersettings  mode="Numeric" position="Bottom" pagebuttoncount="10" />
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center"/>
                              <Columns>
                               <asp:TemplateField HeaderText="Id" Visible="false">
                                   <ItemTemplate>
                                       <asp:LinkButton ID="T_ID" runat="server" Text='<%# Bind("id") %>' CommandArgument='<%# Bind("id") %>'>
                                       </asp:LinkButton>
                                   </ItemTemplate>
                               </asp:TemplateField>

                                <asp:BoundField DataField="cd_title" HeaderText="CD" SortExpression="cd_title">
                                    <ItemStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Track Name">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("title") %>'
                                            CommandArgument='<%# Bind("id") %>' OnClick="T_title_Click">
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
                                        <asp:LinkButton ID="lnkSelect" runat="server" CssClass="btn btn-warning" CommandName="Select" OnClick="lnkSelect_Click">
                                 <span class="glyColor glyphicons glyphicon glyphicon-folder-open" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" ForeColor="White" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Download">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_songMain" CssClass="btn btn-info" runat="server"
                                            CommandArgument='<%# Bind("id") %>' CommandName="Select" OnClick="T_songMain_Click">
                                <span class="glyphicons glyphicon glyphicon-save"/>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                         <asp:SqlDataSource ID="SqlCDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [tracks].[id],[cd].[cd_title],[tracks].[title], [tracks].[descrip], [tracks].[instruments] FROM [tracks] JOIN [cd] ON [tracks].[fk_cd_id] = [cd].[id] WHERE ([cd].[cd_title] = @cd_title)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DD_Album" Name="cd_title" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </section>
                </div> <!-- End Grid Albums-->

                <div class="row"><!-- Grid for Composers -->
                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">  
                        <asp:GridView ID="GridComposers" runat="server" AutoGenerateColumns="False" HeaderStyle-ForeColor="Black" DataSourceID="SqlComposers" Visible="False" DataKeyNames="id" OnSelectedIndexChanged ="OnSelectedIndexChanged4" PageSize="10" AllowPaging="true" GridLines="None">
                           <pagersettings  mode="Numeric" position="Bottom" pagebuttoncount="10" />
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center"/>
                            <Columns>
                               <asp:TemplateField HeaderText="Id" Visible="false">
                                   <ItemTemplate>
                                       <asp:LinkButton ID="T_ID" runat="server" Text='<%# Bind("id") %>' CommandArgument='<%# Bind("id") %>'>
                                       </asp:LinkButton>
                                   </ItemTemplate>
                               </asp:TemplateField>
                              
                                <asp:BoundField DataField="cd_title" HeaderText="CD" SortExpression="cd_title">
                                    <ItemStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Track Name">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="T_title" runat="server" Text='<%# Bind("title") %>'
                                            CommandArgument='<%# Bind("id") %>' OnClick="T_title_Click">
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="30%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>

                                <asp:BoundField DataField="name" HeaderText="Publisher Name" SortExpression="name">
                                    <ItemStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Save">
                                    <ItemTemplate>
                                        <!-- Open select project pop up -->
                                        <asp:LinkButton ID="lnkSelect" runat="server" CssClass="btn btn-warning" CommandName="Select" OnClick="lnkSelect_Click">
                                 <span class="glyColor glyphicons glyphicon glyphicon-folder-open" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" ForeColor="White" />
                                </asp:TemplateField>

                               <asp:TemplateField HeaderText="Download">
                                   <ItemTemplate>
                                       <asp:LinkButton ID="T_songMain" CssClass="btn btn-info" runat="server"
                                           CommandArgument='<%# Bind("id") %>' CommandName="Select" OnClick="T_songMain_Click">
                                <span class="glyphicons glyphicon glyphicon-save"/>
                                       </asp:LinkButton>
                                   </ItemTemplate>
                                   <ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Top" />
                               </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                         <asp:SqlDataSource ID="SqlComposers" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [id],[cd_title], [title], [name] FROM [View_Composers] WHERE ([ComposerName] = @ComposerName)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DD_Composer" Name="ComposerName" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </section>
                </div> <!-- End Grid Composers-->

            </div>

            <div class="form-group">
                <br/>
            </div>
            <div>
                <br />
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
                        <strong><span class="glyphicon glyphicon-music"></span>
                        <asp:Label ID="Label1" runat="server" Text="Label" Style="margin-left: 30px;" /></strong>
                        <asp:Label ID="Label2" runat="server" Text="Label" Style="margin-left: 30px;" Visible="false" />
                        <br />
                        <br />
                        <div class="input-group" style="margin-left: 10px;">

                            <asp:GridView ID="GridProjectList" runat="server" CssClass="table table-bordered" DataSourceID="SqlprojectList_Grid" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkRow" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:BoundField DataField="id" HeaderText="Id" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                    <asp:BoundField DataField="projectName" HeaderText="Project" />
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

        <div class="modal fade" id="DownloadPopUp" align="left">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header song_sel_panel-header" style="background-color: #1A6ECD;color:#fff;">
                        <div>
                            <button type="button" class="close" data-dismiss="modal">×</button>
                            <h3 class="modal-title" align="left">
                                <asp:Label ID="T_titlePop" runat="server"></asp:Label>
                            </h3>
                            <h5><i>
                                <asp:Label ID="T_trackId" runat="server" Visible="false"></asp:Label></i> </h5>
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
                                                        CommandArgument='<%# Bind("id") %>' OnClick="track_Click_download_Click">
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
                                                        CommandArgument='<%# Bind("id") %>'>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>

                    </div>
                    <div class="modal-footer song_sel_panel-footer" style="background-color: #ebebeb;color: #CC1635;">
                        <h6>Only one music file may be downloaded at a time.</h6>
                    </div>
                </div>
            </div>
        </div>

         <!--Pop Up Player-->
        <div class="modal fade" id="PlayerPop" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header song_sel_panel-header">
                        <button type="button" class="close" data-dismiss="modal" onclick="wavesurfer.toggleMute();return false">X</button>
                        <h3 class="modal-title" style="text-align:center;">  <asp:Label ID="L_titlePlayer" runat="server"></asp:Label></h3>
                    </div>
                    <div class="modal-body">
                        <!-- Define los elementos HTML donde waveform se cargara -->
                        <div id="Player">
                            <div id="waveform" style="text-align: center; color: royalblue;font-size: 16px;">
                                
                            </div>
                            <br />
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

    <style type="text/css">
        #Player {
            align-content: center;
                }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.4/wavesurfer.min.js"></script>
    <script>
        var wavesurfer = WaveSurfer.create({
            container: '#waveform',
            waveColor: 'blue',
            progressColor: 'red',
            height: 80,
            width: 1000
        });

        function cargarCancion(Cancion) {
            wavesurfer.load(Cancion);
            wavesurfer.on('ready', function () {
                wavesurfer.playPause();
            });
        }
        function openModal() {
            $('#ProjectList').modal('show');
        }

        function openDownloadModal() {
            $('#DownloadPopUp').modal('show');
        }

        function openPlayer() {
            $('#PlayerPop').modal('show');
        }

        function ErrorLogin() {
            swal({
                title: 'Log In',
                text: 'You must be logged in to use this feature',
                type: 'error'
            });
        }

        function AddSuccess() {
            swal({
                title: 'Track Added!',
                text: 'The track selected was added successfully to project(s)',
                type: 'success'
            });
        }

        function TrackExists() {
            swal("Track to Project", "This track already exists in this project!", "warning")
        }
    </script>
</asp:Content>
