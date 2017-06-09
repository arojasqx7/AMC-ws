﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_Admin.Master" CodeBehind="CDsTracks.aspx.vb" Inherits="AMC_ws.CDsTracks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bodyBg">
        <div class="content container">
            <div class="container">
                <div class="row">
                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <div class="subTitle">
                            <h2 class="subH2">CD's & Tracks</h2>
                        </div>
                    </section>

                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <br />
                                <button id="btnAddCD" runat="server" type="button" class="btn btn-search" data-toggle="modal" data-target="#newCD" style="margin-left: 90px;"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Add a CD </button>
                                <button id="btnAddTrack" runat="server" type="button" class="btn btn-search" data-toggle="modal" data-target="#newTrack" style="margin-left: 20px;"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Add a Track </button>
                                <button id="Button1" runat="server" type="button" class="btn btn-search" data-toggle="modal" data-target="#ViewIDTrack" style="margin-left: 20px;"> View ID numbers of Tracks</button>
                            </div>
                        </div>
                    </section>

                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <br />
                                <asp:DropDownList ID="DropDownCDS" runat="server" DataSourceID="SqlCDS" AppendDataBoundItems="true" CssClass="form-control" style="margin-left: 90px;" DataTextField="cdResult" DataValueField="id" OnSelectedIndexChanged="DropDownCDS_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false">
                                    <asp:ListItem Text="Select CD to edit any information" Value="" />
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlCDS" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [id], CONCAT([cd_number] ,' - ', [cd_title]) AS cdResult FROM [cd] ORDER BY [cd_number]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </section>

                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <br />
                        <asp:GridView ID="GridCDSelected" runat="server" AutoGenerateColumns="False" DataKeyNames="id" style="margin-left:110px;" DataSourceID="SqlCDSelected2" Width="590px" CssClass="table table-bordered" ShowHeader="False" BackColor="LightGray" Font-Bold="True" Visible="false">
                            <Columns> 
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="false"/>
                                <asp:BoundField DataField="cd_number" HeaderText="cd_number" SortExpression="cd_number" ItemStyle-Width="20%"/>
                                <asp:BoundField DataField="cd_title" HeaderText="cd_title" SortExpression="cd_title" ItemStyle-Width="60%" />
                                <asp:BoundField DataField="fk_publisher" HeaderText="fk_publisher" SortExpression="fk_publisher" Visible="false"/>
                                <asp:BoundField DataField="descrip" HeaderText="descrip" SortExpression="descrip" Visible="false"/>
                                <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger" DeleteText="Delete CD"/>
                             </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlCDSelected2" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" DeleteCommand="DELETE FROM [cd] WHERE [id] = @id" SelectCommand="SELECT * FROM [cd] WHERE ([id] = @id)" >
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="cd_number" Type="String" />
                                <asp:Parameter Name="cd_title" Type="String" />
                                <asp:Parameter Name="fk_publisher" Type="Int64" />
                                <asp:Parameter Name="descrip" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownCDS" Name="id" PropertyName="SelectedValue" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:GridView ID="GridTracksInCD" runat="server" style="margin-left:110px;" AutoGenerateColumns="False" DataSourceID="SqlTracksInCD" Width="590px" Visible="False" CssClass="table table-bordered" AlternatingRowStyle-BackColor="#d3d3d3" ShowHeader="False">
<AlternatingRowStyle BackColor="LightGray"></AlternatingRowStyle>
                            <Columns>
                                 <asp:BoundField DataField="track_number" HeaderText="Track #" SortExpression="track_number" HeaderStyle-Width="20%" ItemStyle-Width="20%" >
                                    <HeaderStyle Width="20%"></HeaderStyle>
                                    <ItemStyle Width="20%"></ItemStyle>
                                 </asp:BoundField>
                                 <asp:BoundField DataField="title" HeaderText="Track Name" SortExpression="title" />
                                 <asp:HyperLinkField Text="Details" />
                                 <asp:HyperLinkField Text="Composers" />
                                 <asp:HyperLinkField Text="Sound Clips" />
                                 <asp:HyperLinkField Text="Delete" ControlStyle-ForeColor="Red"/>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlTracksInCD" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [track_number], [title] FROM [tracks] WHERE ([fk_cd_id] = @fk_cd_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownCDS" Name="fk_cd_id" PropertyName="SelectedValue" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </section>
                </div>
            </div>
        </div>

            <!--New CD -->
            <div class="modal fade" id="newCD">
              <div class="modal-dialog modal-sm" style="width:600px;">
                <div class="modal-content" style="width:600px;">
                    <div class="modal-header song_sel_panel-header"> 
                      <button type="button" class="close" data-dismiss="modal">×</button>
                      <h3 class="modal-title"> <span class="glyphicon glyphicon-cd"></span>        Add new CD</h3>
                    </div>

                    <div class="modal-body" style="width:610px;">

                        <div class="input-group" style="width:575px;">
                            <label>Catalog Number:</label>
                            <asp:TextBox ID="txtCatalogNo" runat="server" class="form-control" placeholder="Catalog Number.."></asp:TextBox>

                            <br />
                            <label style="margin-top:10px;">CD Title:</label>
                            <asp:TextBox ID="txtCDTitle" runat="server" class="form-control" placeholder="CD Title.." ></asp:TextBox>

                            <br />
                            <label style="margin-top:10px;">Publisher:</label>
                            <asp:DropDownList ID="DropDownPublishers"  DataSourceID="SqlPublisherAlias" runat="server" class="form-control" AppendDataBoundItems="true" DataTextField="alias" DataValueField="id">
                                <asp:ListItem Text="Choose Publisher" Value="" />
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlPublisherAlias" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [id], [alias] FROM [publishers]"></asp:SqlDataSource>

                            <br />
                            <label style="margin-top:10px;">Description:</label>
                            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="form-control" placeholder="Description..."></asp:TextBox>

                            <br />
                            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin-top:70px;">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingOne">
                                        <h4 class="panel-title">
                                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> <span class="glyphicon glyphicon-sort"></span>   Style / Genre </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                        <div class="panel-body">
                                            <asp:Table ID="Table1" runat="server" >
                                                <asp:TableRow> 
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox1" runat="server" Text="Acoustic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox4" runat="server" Text="Heavy Suspense"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox5" runat="server" Text="Religious"/></asp:TableCell>
                                                </asp:TableRow>
                                               <asp:TableRow> 
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox2" runat="server" Text="Adult Contemporary"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox3" runat="server" Text="Heroic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox6" runat="server" Text="Rock"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox7" runat="server" Text="Adventure"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox8" runat="server" Text="Hip Hop"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox9" runat="server" Text="Rock Ballads"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox10" runat="server" Text="Americana"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox11" runat="server" Text="Historic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox12" runat="server" Text="Rock-Light"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox13" runat="server" Text="Atmospheric"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox14" runat="server" Text="Holiday"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox15" runat="server" Text="Rock-Hard"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox16" runat="server" Text="Ballads"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox17" runat="server" Text="Horror"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox18" runat="server" Text="Rock-Metal"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox19" runat="server" Text="Big Band"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox20" runat="server" Text="Hymns"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox21" runat="server" Text="Rock-Southern"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox22" runat="server" Text="Bluegrass"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox23" runat="server" Text="Inspirational"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox24" runat="server" Text="Romantic"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox25" runat="server" Text="Blues"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox26" runat="server" Text="Jazz"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox27" runat="server" Text="Sad"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox28" runat="server" Text="Calypso"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox29" runat="server" Text="Large Group"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox30" runat="server" Text="Sci-Fi"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox31" runat="server" Text="Caribbean"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox32" runat="server" Text="Latin"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox33" runat="server" Text="Science"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox34" runat="server" Text="Children"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox35" runat="server" Text="Latin Jazz"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox36" runat="server" Text="Sexy"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox37" runat="server" Text="Christmas"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox38" runat="server" Text="Latin Pop"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox39" runat="server" Text="Small Group"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox40" runat="server" Text="Classical"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox41" runat="server" Text="Latin Rock"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox42" runat="server" Text="Solo Instruments"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox43" runat="server" Text="Comedy"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox44" runat="server" Text="Light Drama"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox45" runat="server" Text="Soul"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox46" runat="server" Text="Contemporary"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox47" runat="server" Text="Light News"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox48" runat="server" Text="Soulful"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox49" runat="server" Text="Corporate"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox50" runat="server" Text="Light Rock"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox51" runat="server" Text="Southern Rock"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox52" runat="server" Text="Country"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox53" runat="server" Text="Light Suspense"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox54" runat="server" Text="Spanish"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox55" runat="server" Text="Dance"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox56" runat="server" Text="Nature"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox57" runat="server" Text="Sports"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox58" runat="server" Text="Drama"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox59" runat="server" Text="New Age"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox60" runat="server" Text="Sports Rock"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox61" runat="server" Text="Drama-Light"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox62" runat="server" Text="News"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox63" runat="server" Text="Suspense"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox64" runat="server" Text="Drama-Medium"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox65" runat="server" Text="News-Light"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox66" runat="server" Text="Suspense-Light"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox67" runat="server" Text="Drama-Heavy"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox68" runat="server" Text="News-Medium"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox69" runat="server" Text="Suspense-Medium"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox70" runat="server" Text="Easy Listening"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox71" runat="server" Text="News-Heavy"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox72" runat="server" Text="Suspense-Heavy"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox73" runat="server" Text="Electronica"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox74" runat="server" Text="Nostalgia"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox75" runat="server" Text="Swing"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox76" runat="server" Text="Exotic"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox77" runat="server" Text="Orchestal"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox78" runat="server" Text="Symphonic"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox79" runat="server" Text="Extreme Sports"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox80" runat="server" Text="Panoramic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox81" runat="server" Text="Techno"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox82" runat="server" Text="Ethereal"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox83" runat="server" Text="Pastoral"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox84" runat="server" Text="Technology"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox85" runat="server" Text="Fantasy"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox86" runat="server" Text="Patriotic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox87" runat="server" Text="Theatrical"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox88" runat="server" Text="Fashion"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox89" runat="server" Text="Period Music"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox90" runat="server" Text="Underscore"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox91" runat="server" Text="Folk"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox92" runat="server" Text="Political"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox93" runat="server" Text="Urban"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox94" runat="server" Text="Foreign Lands"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox95" runat="server" Text="Pop"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox96" runat="server" Text="Vocals"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox97" runat="server" Text="Funk"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox98" runat="server" Text="Prod.Elements"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox99" runat="server" Text="Well Known"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox100" runat="server" Text="Funky"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox101" runat="server" Text="Psychedelic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox102" runat="server" Text="Western"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox103" runat="server" Text="Gospel"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox104" runat="server" Text="Quirky"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox105" runat="server" Text="World Music"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox106" runat="server" Text="Happy"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox107" runat="server" Text="Rap"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox108" runat="server" Text="Zany"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox109" runat="server" Text="Hard Rock"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox110" runat="server" Text="R&B"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox111" runat="server" Text="Heart Warming"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox112" runat="server" Text="Reggae"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox113" runat="server" Text="Heavy Drama"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox114" runat="server" Text="Heavy Metal"/></asp:TableCell>
                                                </asp:TableRow>
                                              </asp:Table>
                                          </div>
                                    </div>
                                </div>
                            </div>

                             <br />
                            <div><asp:Button ID="btnAdd" runat="server" Text="Add CD" CssClass="btn btn-success form-control" OnClick="btnAdd_Click"/></div>
                        </div>
                        
                    </div>
                </div>
                </div>
            </div>
                <!-- Termina Pop up-->


             <!--New Track -->
            <div class="modal fade" id="newTrack">
              <div class="modal-dialog modal-sm" style="width:640px;">
                <div class="modal-content" style="width:640px;">
                    <div class="modal-header song_sel_panel-header"> 
                      <button type="button" class="close" data-dismiss="modal">×</button>
                      <h3 class="modal-title"> <span class="glyphicon glyphicon-music"></span>        Add new Track</h3>
                    </div>

                    <div class="modal-body" style="width:600px;">

                        <div class="input-group" style="width:610px;">
                            <label>CD:</label>
                            <asp:DropDownList ID="DropCD2" runat="server" DataSourceID="SqlCDS2" AppendDataBoundItems="true" CssClass="form-control" DataTextField="cdResult" DataValueField="id">
                                <asp:ListItem Text="Select a CD" Value="" />
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlCDS2" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [id], CONCAT([cd_number] ,' - ', [cd_title]) AS cdResult FROM [cd] ORDER BY [cd_number]"></asp:SqlDataSource>

                            <br />
                            <label style="margin-top:10px;">Track Number:</label>
                            <asp:TextBox ID="txtTrackNo" runat="server" class="form-control" placeholder="Track Number.." TextMode="Number" MaxLength="2"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtTrackNo" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+" ForeColor="Red"></asp:RegularExpressionValidator>

                            <br />
                            <label style="margin-top:10px;">Track Title:</label>
                            <asp:TextBox ID="txtTrackTitle" runat="server" class="form-control" placeholder="Track Title.." ></asp:TextBox>

                            <br />
                            <label style="margin-top:10px;">Description:</label>
                            <asp:TextBox ID="txtDescTrack" runat="server" TextMode="MultiLine" class="form-control" placeholder="Description..."></asp:TextBox>

                            <br />

                            <div class="panel panel-default" style="margin-top: 70px;">
                                <div class="panel-heading" role="tab" id="headingFour">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseThree"><span class="glyphicon glyphicon-sort"></span>Tempo </a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                                    <div class="panel-body">
                                        <div id="collapseOne3" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFour">
                                            <div class="panel-body">
                                                <asp:Table ID="Table3" runat="server" >
                                                    <asp:TableRow> 
                                                        <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox229" runat="server" Text="Slow Tempo" /></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow> 
                                                        <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox230" runat="server" Text="Slow / Mid Tempo" /></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow> 
                                                        <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox231" runat="server" Text="Mid Tempo" /></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow> 
                                                        <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox232" runat="server" Text="Mid / Up Tempo" /></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow> 
                                                        <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox233" runat="server" Text="Up Tempo" /></asp:TableCell>
                                                    </asp:TableRow>
                                                 </asp:Table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><span class="glyphicon glyphicon-sort"></span>Genre</a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        <div id="collapseOne2" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                            <div class="panel-body">
                                             <asp:Table ID="Table2" runat="server" >
                                                <asp:TableRow> 
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox115" runat="server" Text="Acoustic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox116" runat="server" Text="Heavy Suspense"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox117" runat="server" Text="Religious"/></asp:TableCell>
                                                </asp:TableRow>
                                               <asp:TableRow> 
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox118" runat="server" Text="Adult Contemporary"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox119" runat="server" Text="Heroic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox120" runat="server" Text="Rock"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox121" runat="server" Text="Adventure"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox122" runat="server" Text="Hip Hop"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox123" runat="server" Text="Rock Ballads"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox124" runat="server" Text="Americana"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox125" runat="server" Text="Historic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox126" runat="server" Text="Rock-Light"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox127" runat="server" Text="Atmospheric"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox128" runat="server" Text="Holiday"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox129" runat="server" Text="Rock-Hard"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox130" runat="server" Text="Ballads"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox131" runat="server" Text="Horror"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox132" runat="server" Text="Rock-Metal"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox133" runat="server" Text="Big Band"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox134" runat="server" Text="Hymns"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox135" runat="server" Text="Rock-Southern"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox136" runat="server" Text="Bluegrass"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox137" runat="server" Text="Inspirational"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox138" runat="server" Text="Romantic"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox139" runat="server" Text="Blues"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox140" runat="server" Text="Jazz"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox141" runat="server" Text="Sad"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox142" runat="server" Text="Calypso"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox143" runat="server" Text="Large Group"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox144" runat="server" Text="Sci-Fi"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox145" runat="server" Text="Caribbean"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox146" runat="server" Text="Latin"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox147" runat="server" Text="Science"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox148" runat="server" Text="Children"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox149" runat="server" Text="Latin Jazz"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox150" runat="server" Text="Sexy"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox151" runat="server" Text="Christmas"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox152" runat="server" Text="Latin Pop"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox153" runat="server" Text="Small Group"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox154" runat="server" Text="Classical"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox155" runat="server" Text="Latin Rock"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox156" runat="server" Text="Solo Instruments"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox157" runat="server" Text="Comedy"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox158" runat="server" Text="Light Drama"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox159" runat="server" Text="Soul"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox160" runat="server" Text="Contemporary"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox161" runat="server" Text="Light News"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox162" runat="server" Text="Soulful"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox163" runat="server" Text="Corporate"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox164" runat="server" Text="Light Rock"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox165" runat="server" Text="Southern Rock"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox166" runat="server" Text="Country"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox167" runat="server" Text="Light Suspense"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox168" runat="server" Text="Spanish"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox169" runat="server" Text="Dance"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox170" runat="server" Text="Nature"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox171" runat="server" Text="Sports"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox172" runat="server" Text="Drama"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox173" runat="server" Text="New Age"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox174" runat="server" Text="Sports Rock"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox175" runat="server" Text="Drama-Light"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox176" runat="server" Text="News"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox177" runat="server" Text="Suspense"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox178" runat="server" Text="Drama-Medium"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox179" runat="server" Text="News-Light"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox180" runat="server" Text="Suspense-Light"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox181" runat="server" Text="Drama-Heavy"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox182" runat="server" Text="News-Medium"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox183" runat="server" Text="Suspense-Medium"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox184" runat="server" Text="Easy Listening"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox185" runat="server" Text="News-Heavy"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox186" runat="server" Text="Suspense-Heavy"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox187" runat="server" Text="Electronica"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox188" runat="server" Text="Nostalgia"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox189" runat="server" Text="Swing"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox190" runat="server" Text="Exotic"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox191" runat="server" Text="Orchestal"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox192" runat="server" Text="Symphonic"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox193" runat="server" Text="Extreme Sports"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox194" runat="server" Text="Panoramic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox195" runat="server" Text="Techno"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox196" runat="server" Text="Ethereal"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox197" runat="server" Text="Pastoral"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox198" runat="server" Text="Technology"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox199" runat="server" Text="Fantasy"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox200" runat="server" Text="Patriotic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox201" runat="server" Text="Theatrical"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox202" runat="server" Text="Fashion"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox203" runat="server" Text="Period Music"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox204" runat="server" Text="Underscore"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox205" runat="server" Text="Folk"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox206" runat="server" Text="Political"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox207" runat="server" Text="Urban"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox208" runat="server" Text="Foreign Lands"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox209" runat="server" Text="Pop"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox210" runat="server" Text="Vocals"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox211" runat="server" Text="Funk"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox212" runat="server" Text="Prod.Elements"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox213" runat="server" Text="Well Known"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox214" runat="server" Text="Funky"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox215" runat="server" Text="Psychedelic"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox216" runat="server" Text="Western"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox217" runat="server" Text="Gospel"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox218" runat="server" Text="Quirky"/></asp:TableCell>
                                                     <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox219" runat="server" Text="World Music"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox220" runat="server" Text="Happy"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox221" runat="server" Text="Rap"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox222" runat="server" Text="Zany"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox223" runat="server" Text="Hard Rock"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox224" runat="server" Text="R&B"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox225" runat="server" Text="Heart Warming"/></asp:TableCell>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox226" runat="server" Text="Reggae"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox227" runat="server" Text="Heavy Drama"/></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell CssClass="col-md-4"><asp:CheckBox ID="CheckBox228" runat="server" Text="Heavy Metal"/></asp:TableCell>
                                                </asp:TableRow>
                                              </asp:Table>
                                                
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <label >Instruments:</label>
                            <asp:TextBox ID="txtInstruments" runat="server" TextMode="MultiLine" class="form-control" placeholder="Instruments..."></asp:TextBox>

                            <br />
                            <label style="margin-top:10px;">Keywords:</label>
                            <asp:TextBox ID="txtKeywords" runat="server" TextMode="MultiLine" class="form-control" placeholder="Keywords..."></asp:TextBox>

                            <br />
                            <label style="margin-top:10px;">Style-A-Likes:</label>
                            <asp:TextBox ID="txtStyleLikes" runat="server" TextMode="MultiLine" class="form-control" placeholder="Style-A-Likes..."></asp:TextBox>

                             <br />
                            <div><asp:Button ID="btnAddTracktoBD" runat="server" Text="Add Track" CssClass="btn btn-success form-control" style="margin-top:25px;" OnClick="btnAddTracktoBD_Click"/></div>
                        </div>
                        
                    </div>
                </div>
                </div>
            </div>
                <!-- Termina Pop up-->

    </div>
</asp:Content>
