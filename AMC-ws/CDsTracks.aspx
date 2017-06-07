<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_Admin.Master" CodeBehind="CDsTracks.aspx.vb" Inherits="AMC_ws.CDsTracks" %>

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
                                <asp:DropDownList ID="DropDownCDS" runat="server" DataSourceID="SqlCDS" AppendDataBoundItems="true" CssClass="form-control" style="margin-left: 90px;" DataTextField="cdResult" DataValueField="id">
                                    <asp:ListItem Text="Select CD to edit any information" Value="" />
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlCDS" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [id], CONCAT([cd_number] ,' - ', [cd_title]) AS cdResult FROM [cd] ORDER BY [cd_number]"></asp:SqlDataSource>
                            </div>
                        </div>
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

                    <div class="modal-body" style="width:600px;">

                        <div class="input-group" style="width:560px;">
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
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox1" runat="server" Text="Acoustic"/>  </div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox4" runat="server" Text="Heavy Suspense"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox5" runat="server" Text="Religious"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox2" runat="server" Text="Adult Contemporary"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox3" runat="server" Text="Heroic"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox6" runat="server" Text="Rock"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox7" runat="server" Text="Adventure"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox8" runat="server" Text="Hip Hop"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox9" runat="server" Text="Rock Ballads"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox10" runat="server" Text="Americana"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox11" runat="server" Text="Historic"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox12" runat="server" Text="Rock-Light"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox13" runat="server" Text="Atmospheric"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox14" runat="server" Text="Holiday"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox15" runat="server" Text="Rock-Hard"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox16" runat="server" Text="Ballads"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox17" runat="server" Text="Horror"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox18" runat="server" Text="Rock-Metal"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox19" runat="server" Text="Big Band"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox20" runat="server" Text="Hymns"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox21" runat="server" Text="Rock-Southern"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox22" runat="server" Text="Bluegrass"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox23" runat="server" Text="Inspirational"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox24" runat="server" Text="Romantic"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox25" runat="server" Text="Blues"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox26" runat="server" Text="Jazz"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox27" runat="server" Text="Sad"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox28" runat="server" Text="Calypso"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox29" runat="server" Text="Large Group"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox30" runat="server" Text="Sci-Fi"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox31" runat="server" Text="Caribbean"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox32" runat="server" Text="Latin"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox33" runat="server" Text="Science"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox34" runat="server" Text="Children"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox35" runat="server" Text="Latin Jazz"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox36" runat="server" Text="Sexy"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox37" runat="server" Text="Christmas"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox38" runat="server" Text="Latin Pop"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox39" runat="server" Text="Small Group"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox40" runat="server" Text="Classical"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox41" runat="server" Text="Latin Rock"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox42" runat="server" Text="Solo Instruments"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox43" runat="server" Text="Comedy"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox44" runat="server" Text="Light Drama"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox45" runat="server" Text="Soul"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox46" runat="server" Text="Contemporary"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox47" runat="server" Text="Light News"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox48" runat="server" Text="Soulful"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox49" runat="server" Text="Corporate"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox50" runat="server" Text="Light Rock"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox51" runat="server" Text="Southern Rock"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox52" runat="server" Text="Country"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox53" runat="server" Text="Light Suspense"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox54" runat="server" Text="Spanish"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox55" runat="server" Text="Dance"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox56" runat="server" Text="Nature"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox57" runat="server" Text="Sports"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox58" runat="server" Text="Drama"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox59" runat="server" Text="New Age"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox60" runat="server" Text="Sports Rock"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox61" runat="server" Text="Drama-Light"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox62" runat="server" Text="News"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox63" runat="server" Text="Suspense"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox64" runat="server" Text="Drama-Medium"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox65" runat="server" Text="News-Light"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox66" runat="server" Text="Suspense-Light"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox67" runat="server" Text="Drama-Heavy"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox68" runat="server" Text="News-Medium"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox69" runat="server" Text="Suspense-Medium"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox70" runat="server" Text="Easy Listening"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox71" runat="server" Text="News-Heavy"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox72" runat="server" Text="Suspense-Heavy"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox73" runat="server" Text="Electronica"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox74" runat="server" Text="Nostalgia"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox75" runat="server" Text="Swing"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox76" runat="server" Text="Exotic"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox77" runat="server" Text="Orchestal"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox78" runat="server" Text="Symphonic"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox79" runat="server" Text="Extreme Sports"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox80" runat="server" Text="Panoramic"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox81" runat="server" Text="Techno"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox82" runat="server" Text="Ethereal"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox83" runat="server" Text="Pastoral"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox84" runat="server" Text="Technology"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox85" runat="server" Text="Fantasy"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox86" runat="server" Text="Patriotic"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox87" runat="server" Text="Theatrical"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox88" runat="server" Text="Fashion"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox89" runat="server" Text="Period Music"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox90" runat="server" Text="Underscore"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox91" runat="server" Text="Folk"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox92" runat="server" Text="Political"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox93" runat="server" Text="Urban"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox94" runat="server" Text="Foreign Lands"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox95" runat="server" Text="Pop"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox96" runat="server" Text="Vocals"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox97" runat="server" Text="Funk"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox98" runat="server" Text="Production Elements"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox99" runat="server" Text="Well Known"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox100" runat="server" Text="Funky"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox101" runat="server" Text="Psychedelic"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox102" runat="server" Text="Western"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox103" runat="server" Text="Gospel"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox104" runat="server" Text="Quirky"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox105" runat="server" Text="World Music"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox106" runat="server" Text="Happy"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox107" runat="server" Text="Rap"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox108" runat="server" Text="Zany"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox109" runat="server" Text="Hard Rock"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox110" runat="server" Text="R&B"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox111" runat="server" Text="Heart Warming"/></div>
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox112" runat="server" Text="Reggae"/></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox113" runat="server" Text="Heavy Drama"/></div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-4"><asp:CheckBox ID="CheckBox114" runat="server" Text="Heavy Metal"/></div>
                                            </div>
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
              <div class="modal-dialog modal-sm" style="width:620px;">
                <div class="modal-content" style="width:620px;">
                    <div class="modal-header song_sel_panel-header"> 
                      <button type="button" class="close" data-dismiss="modal">×</button>
                      <h3 class="modal-title"> <span class="glyphicon glyphicon-music"></span>        Add new Track</h3>
                    </div>

                    <div class="modal-body" style="width:620px;">

                        <div class="input-group" style="width:590px;">
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
                                                <div class="row">
                                                    <asp:CheckBox ID="CheckBox229" runat="server" Text="Slow Tempo" />
                                                </div>
                                                <div class="row">
                                                    <asp:CheckBox ID="CheckBox230" runat="server" Text="Slow / Mid Tempo" />
                                                </div>
                                                <div class="row">
                                                    <asp:CheckBox ID="CheckBox231" runat="server" Text="Mid Tempo" />
                                                </div>
                                                <div class="row">
                                                    <asp:CheckBox ID="CheckBox232" runat="server" Text="Mid / Up Tempo" />
                                                </div>
                                                <div class="row">
                                                    <asp:CheckBox ID="CheckBox233" runat="server" Text="Up Tempo" />
                                                </div>
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
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox115" runat="server" Text="Acoustic" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox116" runat="server" Text="Heavy Suspense" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox117" runat="server" Text="Religious" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox118" runat="server" Text="Adult Contemporary" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox119" runat="server" Text="Heroic" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox120" runat="server" Text="Rock" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox121" runat="server" Text="Adventure" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox122" runat="server" Text="Hip Hop" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox123" runat="server" Text="Rock Ballads" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox124" runat="server" Text="Americana" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox125" runat="server" Text="Historic" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox126" runat="server" Text="Rock-Light" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox127" runat="server" Text="Atmospheric" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox128" runat="server" Text="Holiday" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox129" runat="server" Text="Rock-Hard" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox130" runat="server" Text="Ballads" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox131" runat="server" Text="Horror" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox132" runat="server" Text="Rock-Metal" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox133" runat="server" Text="Big Band" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox134" runat="server" Text="Hymns" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox135" runat="server" Text="Rock-Southern" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox136" runat="server" Text="Bluegrass" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox137" runat="server" Text="Inspirational" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox138" runat="server" Text="Romantic" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox139" runat="server" Text="Blues" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox140" runat="server" Text="Jazz" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox141" runat="server" Text="Sad" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox142" runat="server" Text="Calypso" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox143" runat="server" Text="Large Group" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox144" runat="server" Text="Sci-Fi" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox145" runat="server" Text="Caribbean" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox146" runat="server" Text="Latin" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox147" runat="server" Text="Science" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox148" runat="server" Text="Children" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox149" runat="server" Text="Latin Jazz" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox150" runat="server" Text="Sexy" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox151" runat="server" Text="Christmas" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox152" runat="server" Text="Latin Pop" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox153" runat="server" Text="Small Group" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox154" runat="server" Text="Classical" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox155" runat="server" Text="Latin Rock" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox156" runat="server" Text="Solo Instruments" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox157" runat="server" Text="Comedy" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox158" runat="server" Text="Light Drama" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox159" runat="server" Text="Soul" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox160" runat="server" Text="Contemporary" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox161" runat="server" Text="Light News" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox162" runat="server" Text="Soulful" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox163" runat="server" Text="Corporate" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox164" runat="server" Text="Light Rock" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox165" runat="server" Text="Southern Rock" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox166" runat="server" Text="Country" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox167" runat="server" Text="Light Suspense" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox168" runat="server" Text="Spanish" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox169" runat="server" Text="Dance" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox170" runat="server" Text="Nature" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox171" runat="server" Text="Sports" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox172" runat="server" Text="Drama" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox173" runat="server" Text="New Age" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox174" runat="server" Text="Sports Rock" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox175" runat="server" Text="Drama-Light" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox176" runat="server" Text="News" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox177" runat="server" Text="Suspense" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox178" runat="server" Text="Drama-Medium" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox179" runat="server" Text="News-Light" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox180" runat="server" Text="Suspense-Light" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox181" runat="server" Text="Drama-Heavy" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox182" runat="server" Text="News-Medium" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox183" runat="server" Text="Suspense-Medium" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox184" runat="server" Text="Easy Listening" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox185" runat="server" Text="News-Heavy" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox186" runat="server" Text="Suspense-Heavy" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox187" runat="server" Text="Electronica" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox188" runat="server" Text="Nostalgia" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox189" runat="server" Text="Swing" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox190" runat="server" Text="Exotic" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox191" runat="server" Text="Orchestal" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox192" runat="server" Text="Symphonic" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox193" runat="server" Text="Extreme Sports" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox194" runat="server" Text="Panoramic" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox195" runat="server" Text="Techno" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox196" runat="server" Text="Ethereal" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox197" runat="server" Text="Pastoral" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox198" runat="server" Text="Technology" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox199" runat="server" Text="Fantasy" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox200" runat="server" Text="Patriotic" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox201" runat="server" Text="Theatrical" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox202" runat="server" Text="Fashion" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox203" runat="server" Text="Period Music" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox204" runat="server" Text="Underscore" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox205" runat="server" Text="Folk" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox206" runat="server" Text="Political" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox207" runat="server" Text="Urban" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox208" runat="server" Text="Foreign Lands" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox209" runat="server" Text="Pop" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox210" runat="server" Text="Vocals" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox211" runat="server" Text="Funk" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox212" runat="server" Text="Production Elements" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox213" runat="server" Text="Well Known" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox214" runat="server" Text="Funky" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox215" runat="server" Text="Psychedelic" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox216" runat="server" Text="Western" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox217" runat="server" Text="Gospel" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox218" runat="server" Text="Quirky" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox219" runat="server" Text="World Music" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox220" runat="server" Text="Happy" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox221" runat="server" Text="Rap" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox222" runat="server" Text="Zany" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox223" runat="server" Text="Hard Rock" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox224" runat="server" Text="R&B" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox225" runat="server" Text="Heart Warming" /></div>
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox226" runat="server" Text="Reggae" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox227" runat="server" Text="Heavy Drama" /></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:CheckBox ID="CheckBox228" runat="server" Text="Heavy Metal" /></div>
                                                </div>
                                            </div>
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
