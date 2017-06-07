<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_Admin.Master" CodeBehind="Composers.aspx.vb" Inherits="AMC_ws.Composers" %>
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
                            <h2 class="subH2">Composers</h2>
                        </div>
                    </section>

                 <section class="col-sm-1"> </section>
                    <section class="col-sm-9">
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <br />
                                    <button id="btnAddComposer" runat="server" type="button" class="btn btn-search" data-toggle="modal" data-target="#newComposer" style="margin-left:90px;"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New Composer </button>
                                </div>
                            </div>
                        </section>

                   <section class="col-sm-9" style="margin-left:100px;">
                         <br />
                       <asp:GridView ID="GridComposers" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlComposerss" Width="601px" AllowPaging="True" PageSize="10" CssClass="table table-bordered">
                           <Columns>
                               <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="false"/>
                               <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
                               <asp:BoundField DataField="middle_initial" HeaderText="middle_initial" SortExpression="middle_initial" Visible="false"/>
                               <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
                               <asp:BoundField DataField="fk_publisher" HeaderText="fk_publisher" SortExpression="fk_publisher" Visible="false" />
                               <asp:BoundField DataField="bio" HeaderText="bio" SortExpression="bio" Visible="false"/>
                               <asp:TemplateField ShowHeader="False">
                                   <EditItemTemplate>
                                       <asp:LinkButton ID="UpdateLink" runat="server" CausesValidation="false" CommandName="Update" Text="Update"></asp:LinkButton>
                                       &nbsp;<asp:LinkButton ID="CancelLink" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                       <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                   </ItemTemplate>
                                   <ControlStyle ForeColor="Blue" />
                               </asp:TemplateField>
                               <asp:CommandField ShowDeleteButton="True" ControlStyle-ForeColor="Red" >
                                <ControlStyle ForeColor="Red"></ControlStyle>
                               </asp:CommandField>
                            </Columns>
                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlComposerss" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" DeleteCommand="DELETE FROM [composers] WHERE [id] = @id" SelectCommand="SELECT DISTINCT (fname),(lname),id FROM [composers] ORDER BY [fname]" UpdateCommand="UPDATE [composers] SET [fname] = @fname, [middle_initial] = @middle_initial, [lname] = @lname, [fk_publisher] = @fk_publisher, [bio] = @bio WHERE [id] = @id">
                             <DeleteParameters>
                                 <asp:Parameter Name="id" Type="Int32" />
                             </DeleteParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="fname" Type="String" />
                                 <asp:Parameter Name="middle_initial" Type="String" />
                                 <asp:Parameter Name="lname" Type="String" />
                                 <asp:Parameter Name="fk_publisher" Type="Int64" />
                                 <asp:Parameter Name="bio" Type="String" />
                                 <asp:Parameter Name="id" Type="Int32" />
                             </UpdateParameters>
                         </asp:SqlDataSource>
                    </section>
                    </div>
                </div>
            </div>

                <!--New Publisher -->
            <div class="modal fade" id="newComposer">
              <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header song_sel_panel-header"> 
                      <button type="button" class="close" data-dismiss="modal">×</button>
                      <h3 class="modal-title"> <span class="glyphicon glyphicon-check"></span>        Add new Composer</h3>
                    </div>

                    <div class="modal-body">

                        <div class="input-group">
                            <label>First Name:</label>
                            <asp:TextBox ID="txtFirstName" runat="server" class="form-control" placeholder="First Name.."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="txtFirstName"
                                ErrorMessage="Required field."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>

                            <br />
                            <label style="margin-top:10px;">Middle Initial:</label>
                            <asp:TextBox ID="txtMiddleInitial" runat="server" class="form-control col-md-2" placeholder="Middle Initial.." MaxLength="1"></asp:TextBox>

                             <br />
                            <label style="margin-top:10px;">Last Name:</label>
                            <asp:TextBox ID="txtLastName" runat="server" class="form-control" placeholder="Last Name.."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtLastName"
                                ErrorMessage="Required field."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>

                            <br />
                            <label style="margin-top:10px;">Publisher:</label>
                            <asp:DropDownList ID="DropDownPublishers"  DataSourceID="SqlPublisherAlias" runat="server" class="form-control" AppendDataBoundItems="true" DataTextField="alias" DataValueField="id">
                                <asp:ListItem Text="Choose Publisher" Value="" />
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlPublisherAlias" runat="server" ConnectionString="<%$ ConnectionStrings:AMC %>" SelectCommand="SELECT [id], [alias] FROM [publishers]"></asp:SqlDataSource>

                            <br />
                            <label style="margin-top:10px;">Bio:</label>
                            <asp:TextBox ID="txtBio" runat="server" TextMode="MultiLine" class="form-control" placeholder="Bio..."></asp:TextBox>

                             <br />
                            <div style="margin-top:75px;"><asp:Button ID="btnAdd" runat="server" Text="Add Composer" CssClass="btn btn-success form-control" OnClick="btnAdd_Click"/></div>
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
                title: 'Composer Added',
                text: 'Your composer has been created',
                type: 'success'
            });
        }
    </script>
</asp:Content>
