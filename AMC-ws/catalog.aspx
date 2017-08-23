<%@ Page Title="Music Catalog | American Music Company" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="catalog.aspx.vb" Inherits="AMC_ws.catalog" %>
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
    <div class="bodyBg" style="height:600px;">
      <!-- InstanceBeginEditable name="Edit-content" -->
      <!-- content -->
      <div class="content container">
        <div class="container">
          <div class="row">
            <section class="col-sm-1"> </section>
            <section class="col-sm-9">
              <div class="subTitle">
                <h2 class="subH2">Music Catalog</h2>
              </div>
            
             <div class="container-fluid">       
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None"
                emptydatatext="No data available." 
                allowpaging="true" PageSize="5">
        
                 <pagersettings  mode="Numeric"
                    position="Bottom"           
                    pagebuttoncount="10" />

                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />

                  <Columns>
                      <asp:TemplateField HeaderText="">
                          <ItemTemplate>
                              <div class="catalogBox code col-sm-12">                               
                                <div class="col-sm-10"> 
                                    <a >                                 
                                        <h5 class="project">
                                            <span class="glyphicon glyphicon-cd" aria-hidden="true"></span>
                                            <asp:LinkButton ID="Label2" runat="server" Text='<%# Bind("cd_number") %>'
                                                CommandArgument='<%# Bind("id") %>'  OnClick="Label1_Click"></asp:LinkButton> - 
                                            <asp:LinkButton ID="Label1" runat="server" Text='<%# Bind("cd_title") %>' 
                                                CommandArgument='<%# Bind("id") %>' OnClick="Label1_Click">

                                            </asp:LinkButton>
                                        </h5>
                                    </a> 
                                </div>
                                <div class="catalogBody col-sm-11 col-sm-offset-1">
                                    <p><asp:Label ID="Label3" runat="server" Text='<%# Bind("descrip") %>'></asp:Label></p>
                                </div>
                              </div>
                          </ItemTemplate>
                      </asp:TemplateField>
                  </Columns>
              </asp:GridView>
            </div>  
           </section>            
                                            
        </div>
      </div>

    </div>
    </div>
</asp:Content>
