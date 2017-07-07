<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_Admin.Master" CodeBehind="Users.aspx.vb" Inherits="AMC_ws.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
     .hidden
     {
         display:none;
     }
</style>

     <div class="bodyBg"> 
        <div class="content container">
            <div class="container">
                <div class="row">
                    <section class="col-sm-1"> </section>
                    <section class="col-sm-9">
                        <div class="subTitle">
                            <h2 class="subH2">Users</h2>
                        </div>
                    </section>

                    <section class="col-sm-1"> </section>
                    <section class="col-sm-9">
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <br />
                                    <div class="form-group" style="margin-left: 90px; display:inline-flex;">
                                        <label >Select Filter:</label>
                                        <asp:DropDownList ID="DropUserType" runat="server" CssClass="form-control" AppendDataBoundItems="true" style="margin-left: 20px;" AutoPostBack="true" OnSelectedIndexChanged="DropUserType_SelectedIndexChanged" CausesValidation="false">
                                            <asp:ListItem Text="Select User Type" Value="" />
                                            <asp:ListItem Text="Blanket" Value="0" />
                                            <asp:ListItem Text="Per Use" Value="1" />
                                            <asp:ListItem Text="Leads" Value="2" />
                                            <asp:ListItem Text="View All" Value="" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </section>

                    <section class="col-sm-1"></section>
                    <section class="col-sm-9">
                        <br />
                        <asp:GridView ID="GridUserBlanket" runat="server" style="margin-left:110px;" Width="590px" CssClass="table table-bordered" AlternatingRowStyle-BackColor="#d3d3d3" AutoGenerateColumns="False" DataKeyNames="id" OnSelectedIndexChanged="GridUserBlanket_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="LightGray"></AlternatingRowStyle>
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                <asp:BoundField DataField="UserCompany" HeaderText="User" SortExpression="UserCompany" />
                                <asp:BoundField DataField="ConvertedDate" HeaderText="Created" SortExpression="ConvertedDate" />
                                <asp:BoundField DataField="phone1" HeaderText="Phone 1" SortExpression="phone1" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                <asp:BoundField DataField="address1" HeaderText="address1" SortExpression="address1" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                <asp:BoundField DataField="accountpin" HeaderText="accountpin" SortExpression="accountpin" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                <asp:BoundField DataField="comments" HeaderText="comments" SortExpression="comments" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                <asp:BoundField DataField="LastLogin" HeaderText="Last Login" SortExpression="LastLogin"/>
                                <asp:BoundField DataField="totalLogins" HeaderText="totalLogins" SortExpression="totalLogins" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                                <asp:ButtonField Text="View Details" CommandName="Select"/>
                            </Columns>
                        </asp:GridView>        
                    </section>

                    </div>
                </div>
            </div>

                 <!--Pop Up User Info-->
            <div class="modal fade" id="UserInfo">
              <div class="modal-dialog modal-sm" style="width:700px;">
                <div class="modal-content" style="width:750px;">
                    <div class="modal-header song_sel_panel-header"> 
                      <button type="button" class="close" data-dismiss="modal">×</button>
                      <h3 class="modal-title"> <span class="glyphicon glyphicon-stats"></span>        User Information</h3>
                    </div>

                    <div class="modal-body" style="width:700px;">  
                        <div class="input-group" style="width:700px;">
                            
                            <asp:FormView ID="FormView1" runat="server">
                                <ItemTemplate>
                                    <table border="0">
                                        <tr class="hidden">
                                            <td class="col-sm-2"><label>ID:</label></td>
                                            <td class="col-sm-10">
                                            <asp:HiddenField ID="lblID" Value='<%# Eval("id") %>' runat="server"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-2"><label>Company & User:</label></td>
                                            <td class="col-sm-10">
                                                <%# Eval("UserCompany") %>
                                            </td>
                                            <td class="col-sm-2"><label>User Type:</label> </td>
                                            <td class="col-sm-10">
                                                <asp:DropDownList ID="DropUserTypeToUpdate" runat="server" CssClass="form-control" style="width:160px;" CausesValidation="false">
                                                     <asp:ListItem Text="Blanket" Value="0" />
                                                     <asp:ListItem Text="Per Use" Value="1" />
                                                     <asp:ListItem Text="Leads"   Value="2" />
                                                 </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-2"><label>Created Date:</label> </td>
                                            <td class="col-sm-10">
                                                <%# Eval("ConvertedDate") %>
                                            </td>
                                            <td class="col-sm-2"><label style="margin-top:10px;">User Status:</label> </td>
                                            <td class="col-sm-10">
                                                <asp:DropDownList ID="DropUserStatus" runat="server" CssClass="form-control" style="width:160px;margin-top:10px;">
                                                     <asp:ListItem Text="Active" Value="1" />
                                                     <asp:ListItem Text="Not Active" Value="2" />
                                                 </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-2"><label>Phone:</label> </td>
                                            <td class="col-sm-10">
                                                <%# Eval("phone1") %>
                                            </td>
                                            <td class="col-sm-2"><label style="width:100px;margin-top:25px;">User Activity:</label> </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-2"><label>Address:</label> </td>
                                            <td class="col-sm-10">
                                                <%# Eval("address1") %>
                                            </td>
                                            <td class="col-sm-2"><label style="width:100px;margin-left:20px;">Logins:</label> </td>
                                            <td class="col-sm-10">
                                                <%# Eval("totalLogins") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-2"><label>Username:</label> </td>
                                            <td class="col-sm-10">
                                                <%# Eval("username") %>
                                            </td>
                                            <td class="col-sm-2"><label style="width:100px;margin-left:20px;">Last Login:</label> </td>
                                            <td class="col-sm-10">
                                                <%# Eval("LastLogin") %>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td class="col-sm-2"><label>Password:</label> </td>
                                            <td class="col-sm-10">
                                                <%# Eval("password") %>
                                            </td>
                                             <td class="col-sm-2"><label style="width:100px; margin-left:20px;">Downloads:</label> </td>
                                             <td class="col-sm-10">
                                                 24
                                             </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-2"><label>Account PIN:</label> </td>
                                            <td class="col-sm-10">
                                                <%# Eval("accountpin") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-2"><label>Comments:</label> </td>
                                            <td class="col-sm-10">
                                                <%# Eval("comments") %>
                                            </td>
                                        </tr>
                                         <tr>
                                             <td class="col-sm-2"><asp:LinkButton ID="btnUpdateUserInfo" runat="server" CssClass="btn btn-primary" style="margin-top:40px;" OnClick="btnUpdateUserInfo_Click">Update This User</asp:LinkButton></td>
                                             <td class="col-sm-10"><asp:LinkButton ID="btnDeleteUser" runat="server" CssClass="btn btn-danger" style="margin-top:40px;" OnClick="btnDeleteUser_Click">Delete This User</asp:LinkButton></td>
                                             <td class="col-sm-2"><asp:LinkButton ID="btnViewLicenses" runat="server" CssClass="btn btn-warning" style="margin-top:40px;">View Licenses</asp:LinkButton></td>
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

    <script src="dist/sweetalert.min.js"></script>
            <script>
            function openModalUserInfo() {
                $('#UserInfo').modal('show');
            }
                    
            function SuccessUpdated() {
                swal({
                    title: 'user Updated',
                    text: 'User has been updated sucessfully',
                    type: 'success'
                });
            }

            function SuccessDeleted() {
                swal({
                    title: 'user Deleted',
                    text: 'User has been deleted sucessfully',
                    type: 'success'
                });
            }
        </script>
</asp:Content>
