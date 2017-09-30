<%@ Page Title="Music Catalog | American Music Company" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="catalog.aspx.vb" Inherits="AMC_ws.catalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bodyBg" style="height:720px;">
      <div class="content container">
        <div class="container">
          <div class="row">
            <section class="col-sm-1"> </section>
            <section class="col-sm-9">
              <div class="subTitle">
                <h2 class="subH2">Music Catalog</h2>
              </div>
            
             <div class="container-fluid">       
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" emptydatatext="No data available." allowpaging="true" PageSize="5">
                 <pagersettings  mode="Numeric" position="Bottom" pagebuttoncount="10" />
                 <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center"/>
                  <Columns>
                      <asp:TemplateField HeaderText="">
                          <ItemTemplate>
                              <div class="catalogBox code col-sm-12">                               
                                <div class="col-sm-10"> 
                                    <a >                                 
                                        <h5 class="project">
                                            <span class="glyphicon glyphicon-cd" aria-hidden="true"></span>
                                            <asp:LinkButton ID="Label2" runat="server" Text='<%# Eval("cd_number") + " - " + Eval("cd_title")%>'
                                                CommandArgument='<%# Bind("id") %>'  OnClick="Label1_Click"></asp:LinkButton>
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
                 <br />
            </div>  
           </section>            
                                            
        </div>
      </div>

    </div>
    </div>
</asp:Content>
