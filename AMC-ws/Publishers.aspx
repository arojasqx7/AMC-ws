<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_Admin.Master" CodeBehind="Publishers.aspx.vb" Inherits="AMC_ws.Publishers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
        /*gridview*/
        .table table  tbody  tr  td a ,
        .table table  tbody  tr  td  span {
        position: relative;
        float: left;
        padding: 6px 12px;

        margin-left: -1px;
        line-height: 1.42857143;
        color: #337ab7;
        text-decoration: none;
        background-color: #fff;
        border: 1px solid #ddd;
        }

        .table table > tbody > tr > td > span {
        z-index: 3;
        color: #fff;
        cursor: default;
        background-color: #337ab7;
        border-color: #337ab7;
        }

        .table table > tbody > tr > td:first-child > a,
        .table table > tbody > tr > td:first-child > span {
        margin-left: 0;
        border-top-left-radius: 4px;
        border-bottom-left-radius: 4px;
        }

        .table table > tbody > tr > td:last-child > a,
        .table table > tbody > tr > td:last-child > span {
        border-top-right-radius: 4px;
        border-bottom-right-radius: 4px;
        }

        .table table > tbody > tr > td > a:hover,
        .table   table > tbody > tr > td > span:hover,
        .table table > tbody > tr > td > a:focus,
        .table table > tbody > tr > td > span:focus {
        z-index: 2;
        color: #23527c;
        background-color: #eee;
        border-color: #ddd;
        }
        /*end gridview */
        </style>

    <div class="bodyBg"> 
        <div class="content container">
            <div class="container">
                <div class="row">
                    <section class="col-sm-1"> </section>
                    <section class="col-sm-9">
                        <div class="subTitle">
                            <h2 class="subH2">Publishers</h2>
                        </div>
                    </section>

                 <section class="col-sm-1"> </section>
                    <section class="col-sm-9">
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <br />
                                    <button id="btnAddPublisher" runat="server" type="button" class="btn btn-search" data-toggle="modal" data-target="#newPublisher" style="margin-left:90px;"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New Publisher </button>
                                </div>
                            </div>
                        </section>

                   <section class="col-sm-9" style="margin-left:100px;">
                         <br />
                       <asp:GridView ID="GridPublishers" runat="server" EnableViewState="True"  AutoGenerateColumns="False" DataSourceID="SqlPublishers" Width="500px" CssClass="table table-bordered" DataKeyNames="id">
                           <Columns>                             
                               <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="false" Visible="false"/>
                               <asp:BoundField DataField="name" HeaderText="Publisher Name" SortExpression="name" />
                               <asp:BoundField DataField="alias" HeaderText="Alias" SortExpression="alias" />
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="UpdateLink" runat="server" CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>
                                  &nbsp;<asp:LinkButton ID="CancelLink" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ControlStyle ForeColor="Blue" />
                               </asp:TemplateField>
                               <asp:CommandField ShowDeleteButton="True" ControlStyle-ForeColor="Red">      
                                <ControlStyle ForeColor="Red"></ControlStyle>
                               </asp:CommandField>
                           </Columns>
                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlPublishers" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT * FROM [publishers] ORDER BY [name]" DeleteCommand="DELETE FROM [publishers] WHERE [id] = @id" UpdateCommand="UPDATE [publishers] SET [name] = @name, [alias] = @alias WHERE [id] = @id">
                             <DeleteParameters>
                                 <asp:Parameter Name="id" Type="Int64" />
                             </DeleteParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="name" Type="String" />
                                 <asp:Parameter Name="alias" Type="String" />
                                 <asp:Parameter Name="id" Type="Int64" />
                             </UpdateParameters>
                         </asp:SqlDataSource>
                    </section>
                    </div>
                </div>
            </div>

                <!--New Publisher -->
            <div class="modal fade" id="newPublisher">
              <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header song_sel_panel-header"> 
                      <button type="button" class="close" data-dismiss="modal">×</button>
                      <h3 class="modal-title"> <span class="glyphicon glyphicon-check"></span>        Add new Publisher</h3>
                    </div>

                    <div class="modal-body">

                        <div class="input-group">
                            <label>Performance Society:</label>
                            <asp:TextBox ID="txtPerformance" runat="server" class="form-control" placeholder="Performance Society.."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="txtPerformance"
                                ErrorMessage="Performance Society is a required field."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>

                            <br />
                            <label>Publisher:</label>
                            <asp:TextBox ID="txtPublisher" runat="server" class="form-control" placeholder="Publisher.."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtPublisher"
                                ErrorMessage="Publisher is a required field."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>

                             <br />
                            <div style="margin-top:50px;"><asp:Button ID="btnAdd" runat="server" Text="Add Publisher" CssClass="btn btn-success form-control" OnClick="btnAdd_Click" /></div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
                <!-- Termina Pop up-->

        </div>

     <script src="dist/sweetalert.min.js"></script>
    <script>
        function SuccessAdded() {
            swal({
                title: 'Publisher Added',
                text: 'Your publisher has been created',
                type: 'success'
            });
        }
    </script>

</asp:Content>
