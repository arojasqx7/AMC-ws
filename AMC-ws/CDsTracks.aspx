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
                                <button id="Button1" runat="server" type="button" class="btn btn-search" data-toggle="modal" data-target="#newTrack" style="margin-left: 20px;"> View ID numbers of Tracks</button>
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

                        <div class="input-group" style="width:550px;">
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
                                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Style / Genre </a>
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
                                        </div>
                                    </div>
                                </div>
                            </div>

                             <br />
                            <div style="margin-top:75px;"><asp:Button ID="btnAdd" runat="server" Text="Add CD" CssClass="btn btn-success form-control"/></div>
                        </div>
                        
                    </div>
                </div>
                </div>
            </div>
                <!-- Termina Pop up-->

    </div>
</asp:Content>
