<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="musicsearch.aspx.vb" Inherits="AMC_ws.musicsearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script>
    function EnterEvent(e) {
        if (e.keyCode == 13) {
            document.getElementById(objBtnID).focus();
            document.getElementById(objBtnID).click();
        }
    }
</script>
    <div class="bodyBg">
      <!-- InstanceBeginEditable name="Edit-content" -->
      <!-- content -->
      <div class="content container">
        <div class="container">
          <div class="row">
            <section class="col-sm-1"> </section>
            <section class="col-sm-9">
              <div class="subTitle">
                <h2 class="subH2">Music Search</h2>
              </div>
            </section>
            <section class="col-sm-2"> </section>
          </div>
          <br />
          <br />
          <div class="container">
            <div class="row">
              <section class="col-sm-1"> </section>
              <section class="col-sm-9">
                <h2>Quick Search</h2>
                <div id="custom-search-input">
                  <div class="input-group col-md-12">
                      <input class="search-query form-control"
                      placeholder="Search" type="text" id="T_mainsearch" runat="server" onkeypress="return EnterEvent(event)" /><asp:Button ID="B_Search" runat="server" Text="Search" />
&nbsp;<span class="input-group-btn">
                      <button class="btn btn-danger" type="button"> 
                          <span class=" glyphicon glyphicon-search"></span>
                      </button> </span> 

                  </div>
                </div>
               </section>
             
            </div>
              
              <section class="col-sm-2"> </section>
            </div>
            <br />
            <br />
            <div class="row">
              <section class="col-sm-1"> </section>
              <section class="col-sm-9">
                <div>
                  <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"> <a role="tab" data-toggle="tab"

                        href="#genreSearch">Style or Genre</a> </li>
                    <li role="presentation"> <a role="tab" data-toggle="tab" href="#composerSearch">Composer</a>
                    </li>
                    <li role="presentation"> <a role="tab" data-toggle="tab" href="#albumSearch">Album</a>
                    </li>
                    <li role="presentation"> <a role="tab" data-toggle="tab" href="#titleSearch">Track
                        Title</a> </li>
                  </ul>
                </div>
                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane active" id="genreSearch">
                    <div class="form-group">
                      <div class=" form-inline col-sm-10 col-sm-offset-2 center-block">               
                            <asp:DropDownList ID="DD_style" CssClass="form-control" runat="server" DataSourceID="SqlGenre" DataTextField="name"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlGenre" runat="server" ConnectionString="<%$ ConnectionStrings:db0007ConnectionString %>" SelectCommand="SELECT 'Select a Style or Genre' AS name UNION ALL SELECT name FROM map_genres"></asp:SqlDataSource>
                          <asp:DropDownList ID="DD_tempo" CssClass="form-control" runat="server" DataSourceID="Sqltempo" DataTextField="name" DataValueField="name"></asp:DropDownList>
                            <asp:SqlDataSource ID="Sqltempo" runat="server" ConnectionString="<%$ ConnectionStrings:db0007ConnectionString %>" SelectCommand="SELECT 'Select a Tempo' AS name UNION ALL SELECT DISTINCT name FROM map_tempos_tracks"></asp:SqlDataSource>
                          <asp:TextBox ID="T_keyword" CssClass="form-control" runat="server"></asp:TextBox>
                          <class="input-group-btn">
                          <asp:Button ID="BSearch_Genre" runat="server" CssClass="btn btn-search" Text="GO"></asp:Button>
                        </class="input-group-btn"></div>
                    </div>
                  </div>
                  <div role="tabpanel" class="tab-pane" id="composerSearch">
                    <div class="form-group">
                     
                          <asp:DropDownList ID="DD_Composer" class="form-control" runat="server" DataSourceID="SqlComposer" DataTextField="ComposerName" DataValueField="ComposerName"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlComposer" ConnectionString='<%$ ConnectionStrings:db0007ConnectionString %>' SelectCommand="SELECT 'Select a Composer' AS ComposerName UNION ALL SELECT DISTINCT [ComposerName] FROM [V_Composers]"></asp:SqlDataSource>
<asp:Button ID="BSearch_Composer" runat="server" Text="GO" />
                    </div>
                  </div>
                  <div role="tabpanel" class="tab-pane" id="albumSearch">
                    <div class="form-group">
                   
                          <asp:DropDownList class="form-control" ID="DD_Album" runat="server" DataSourceID="SqlAlbum" DataTextField="Album" DataValueField="Album"></asp:DropDownList>

                          <asp:SqlDataSource runat="server" ID="SqlAlbum" ConnectionString='<%$ ConnectionStrings:db0007ConnectionString %>' SelectCommand="SELECT 'Select a Album' AS Album UNION ALL SELECT DISTINCT [Album] FROM [V_Album]"></asp:SqlDataSource>
                          <asp:Button ID="BSearch_Album" runat="server" Text="GO" />
                        
                    </div>
                  </div>
                  <div role="tabpanel" class="tab-pane" id="titleSearch">
                    <div class="form-group">
                      <div class=" form-inline col-sm-10 col-sm-offset-2 center-block">
                        <input class="form-control" id="inputTitle"

                          placeholder="Track Title" type="text" /> <button class="btn btn-search">GO</button>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
              <section class="col-sm-2"> 
                  <asp:GridView ID="TrackList" runat="server">
                  </asp:GridView>
                </section>
            </div>
            <div class="form-group"> <br>

            </div>
            <div> <br>
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
        </div>
      </div>
</asp:Content>
