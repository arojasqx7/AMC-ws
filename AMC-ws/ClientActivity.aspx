<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_Admin.Master" CodeBehind="ClientActivity.aspx.vb" Inherits="AMC_ws.ClientActivity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/bootstrap-datetimepicker.css" rel="stylesheet" />

        <div class="bodyBg">
        <div class="content container">
            <div class="container">
                <div class="row">
                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <div class="subTitle">
                            <h2 class="subH2">Client Activity</h2>
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
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control" Width="300px" style="margin-left:25px;" DataTextField="NAME" DataValueField="NAME"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT * FROM [COMPANIES] ORDER BY [NAME]"></asp:SqlDataSource>
                                    <asp:Button ID="btnApply" runat="server" Text="Apply" CssClass="btn btn-primary" style="margin-left:20px;" OnClick="btnApply_Click"/> 

                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="col-sm-1"></section>
                    <section class="col-sm-9" style="margin-left:100px;">
                        <br />
                        <asp:GridView ID="GridClientActivity" runat="server" AutoGenerateColumns="False" DataSourceID="SqlUserActivityInfo" Width="374px" Visible="False" CssClass="table table-bordered table-hover">
                            <Columns>
                                <asp:BoundField DataField="Dated" HeaderText="Dated" SortExpression="Dated" />
                                <asp:BoundField DataField="Logins" HeaderText="Logins" SortExpression="Logins" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlUserActivityInfo" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT DISTINCT(CONVERT(VARCHAR(40),[userlogins].[dated],101)) AS Dated, COUNT([userlogins].[dated]) AS Logins FROM [userlogins] INNER JOIN [users] ON [userlogins].[userid] = [users].[id] WHERE ([users].[companyName] = @companyName) GROUP BY CONVERT(VARCHAR(40),[userlogins].[dated],101) ORDER BY 1">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="companyName" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </section>                  
                    </div>
                </div>
            </div>
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

    </script>
</asp:Content>
