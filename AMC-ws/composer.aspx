<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="composer.aspx.vb" Inherits="AMC_ws.composer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .pagination-ys {
    /*display: inline-block;*/
    padding-left: 0;
    margin: 20px 0;
    border-radius: 4px;
}

.pagination-ys table > tbody > tr > td {
    display: inline;
}

.pagination-ys table > tbody > tr > td > a,
.pagination-ys table > tbody > tr > td > span {
    position: relative;
    float: left;
    padding: 8px 12px;
    line-height: 1.42857143;
    text-decoration: none;
    color: #dd4814;
    background-color: #ffffff;
    border: 1px solid #dddddd;
    margin-left: -1px;
}

.pagination-ys table > tbody > tr > td > span {
    position: relative;
    float: left;
    padding: 8px 12px;
    line-height: 1.42857143;
    text-decoration: none;    
    margin-left: -1px;
    z-index: 2;
    color: #aea79f;
    background-color: #f5f5f5;
    border-color: #dddddd;
    cursor: default;
}

.pagination-ys table > tbody > tr > td:first-child > a,
.pagination-ys table > tbody > tr > td:first-child > span {
    margin-left: 0;
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
}

.pagination-ys table > tbody > tr > td:last-child > a,
.pagination-ys table > tbody > tr > td:last-child > span {
    border-bottom-right-radius: 4px;
    border-top-right-radius: 4px;
}

.pagination-ys table > tbody > tr > td > a:hover,
.pagination-ys table > tbody > tr > td > span:hover,
.pagination-ys table > tbody > tr > td > a:focus,
.pagination-ys table > tbody > tr > td > span:focus {
    color: #97310e;
    background-color: #eeeeee;
    border-color: #dddddd;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bodyBg">
      <!-- InstanceBeginEditable name="Edit-content" -->
      <!-- content -->
      <div class="content container">
        <div class="container">
          <div class="row">
            <section class="col-sm-1"> </section>
            <section class="col-sm-9">
              <div class="subTitle">
                <h2 class="subH2">List of All Composer</h2>
              </div>
            
             <div class="container-fluid">  
                 <p>Here are the very talented group of artists who have played a major role in the sound of American Music Company. We are very proud to have them on our team! Every one of them is available through American Music Company for any custom and original music production that you may have.</p>              
                 <asp:GridView ID="G_composer" runat="server" AutoGenerateColumns="False" GridLines="None"
                emptydatatext="No data available." 
                allowpaging="true" PageSize="5">
        
                 <pagersettings  mode="Numeric"
                    position="top"           
                    pagebuttoncount="5" />

                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />

                  <Columns>
                      <asp:TemplateField HeaderText="">
                          <ItemTemplate>
                              <div class="catalogBox code col-sm-12">                               
                                <div class="col-sm-10">                                  
                                     <h5 class="project">
                                         <span class="glyphicon glyphicon-playlist" aria-hidden="true"></span>
                                         <asp:Label ID="L_compM" runat="server" Text='<%# Bind("fname") %>'></asp:Label> 
                                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("lname") %>'></asp:Label> - 
                                         <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            
                                     </h5>
                                </div>
                                <div class="catalogBody col-sm-11 col-sm-offset-1">
                                    <p><asp:Label ID="L_compBio" runat="server" Text='<%# Bind("bio") %>'></asp:Label></p>
                                </div>
                              </div>
                          </ItemTemplate>
                      </asp:TemplateField>
                  </Columns>
              </asp:GridView>
                 <br />
                 <div class="btn-group col-sm-offset-2" role="group"> 
                    <a href='javascript:history.go(-1)' class="btn btn-search"> 
                    <span class="glyphicon glyphicon-menu-left"
                    aria-hidden="true"></span> Back</a>
                 </div>
            </div>  
           </section>        
                          
                      
                  
                 
              
              
              
                  
                          
                      
                  
                 
              
        </div>
      </div>

    </div>
    </div> 
</asp:Content>
