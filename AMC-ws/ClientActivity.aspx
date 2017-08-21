<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_Admin.Master" CodeBehind="ClientActivity.aspx.vb" Inherits="AMC_ws.ClientActivity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
     .hidden
     {
         display:none;
     }
    </style>
    <link href="css/bootstrap-datetimepicker.css" rel="stylesheet" />
        <div class="bodyBg" style="height:800px;">
        <div class="content container">
            <div class="container">
                <div class="row">
                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <div class="subTitle">
                            <h2 class="subH2">Client Activity</h2>
                            <asp:Label ID="L_UserName" runat="server" Text="Label" Visible="false"></asp:Label>
                        </div>
                    </section>

                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <br />
                                <label style="margin-left:90px;">Please apply a filter below</label>
                                <br />
                                <div class="form-group" style="margin-left:90px;display:inline-flex;">
                                    <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control datetimepicker" Width="170px" placeholder="Date From"></asp:TextBox>
                                    <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control datetimepicker" Width="170px" placeholder="Date To" style="margin-left:25px;"></asp:TextBox>

                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control" Width="300px" style="margin-left:25px;" DataTextField="NAME" DataValueField="NAME" AppendDataBoundItems="true">
                                        <asp:ListItem Text="All" Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT * FROM [COMPANIES] ORDER BY [NAME]"></asp:SqlDataSource>
                                    
                                    <asp:Button ID="btnApply" runat="server" Text="Apply" CssClass="btn btn-primary" style="margin-left:20px;" OnClick="btnApply_Click"/> 

                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="col-sm-1"></section>
                    <section class="col-sm-9" style="margin-left:100px;">
                        <br />
                       <asp:GridView ID="GridClientActivity" runat="server" AutoGenerateColumns="False" Width="374px" Visible="False" CssClass="table table-bordered table-hover" OnSelectedIndexChanged="GridClientActivity_SelectedIndexChanged">
                            <Columns>
                               <%-- <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>--%>
                                <asp:BoundField  DataField="Dated" HeaderText="Dated" SortExpression="Dated" />
                                <asp:BoundField  DataField="Logins" HeaderText="Logins" SortExpression="Logins" />
                                <%--<asp:BoundField  DataField="Downloads" HeaderText="Downloads" SortExpression="Downloads" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>--%>
                                <asp:ButtonField Text="View Details" CommandName="Select"/>
                            </Columns>
                        </asp:GridView>
                        </section>                  
                    </div>
                </div>
            </div>

           <!--Pop Up User Info-->
            <div class="modal fade" id="UserInfo">
              <div class="modal-dialog modal-sm" style="width:500px;">
                <div class="modal-content" style="width:500px;">
                    <div class="modal-header song_sel_panel-header"> 
                      <button type="button" class="close" data-dismiss="modal">×</button>
                      <h3 class="modal-title"> <span class="glyphicon glyphicon-stats"></span>        Client Activity Information</h3>
                    </div>

                    <div class="modal-body" style="width:500px;">  
                        <div class="input-group" style="width:500px;">
                            <asp:FormView ID="FormView1" runat="server">
                                <ItemTemplate>
                                    <table border="0">
                                        <tr>
                                            <td class="col-sm-2"><label>Date:</label></td>
                                            <td class="col-sm-10">
                                                <%# Eval("Dated") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-2"><label>Logins:</label> </td>
                                            <td class="col-sm-10">
                                                <%# Eval("Logins") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-md-9"><label>Downloads History</label> </td>
                                        </tr>
                                        <tr>
                                            <asp:GridView ID="GridDownloadDetails" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover">
                                                <Columns>

                                                </Columns>
                                            </asp:GridView>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                </div>
              </div>
           </div>
        <!-- Termina Pop up-->
         </div>

    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/moment.js"></script>
    <script src="js/moment-with-locales.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>
    <script>
       $('.datetimepicker').datetimepicker({
       format: "MM/DD/YYYY",
       locale: 'es',
       widgetPositioning: {
       horizontal: 'auto',
       vertical: 'bottom'
      }
       });

       function openModalUserInfo() {
           $('#UserInfo').modal('show');
       }

    </script>
</asp:Content>
