<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="accountpin.aspx.vb" Inherits="AMC_ws.accountpin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ErrorPin() {
            swal({
                title: 'PIN',
                text: 'User PIN invalid',
                type: 'error'
            });
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bodyBg" style="height:500px;"> 
    <div class="content container">
        <div class="container">
          <div class="row">
            <section class="col-sm-1"> </section>
            <section class="col-sm-9">
              <div class="subTitle">
                <h2 class="subH2">Account PIN Verification</h2>
              </div>
              <br>
              <div class="container">
                <div class="col-sm-4">
                  <h4>Enter PIN to continue:</h4>
                </div>
                <div class="input-group col-xs-2"> 
                        <div class="input-group"> 
                            <asp:TextBox ID="T_userPin2" runat="server" class="form-control" placeholder="Pin" TextMode="Password"></asp:TextBox>
                            <div class="input-group-btn">
                                <asp:Button ID="B_confPin" runat="server" class="btn btn-search" Text="Confirm" />
                            </div> 
                        </div>
                      </div>
                        <br />
                        
                            <asp:Button ID="B_forgotPin" runat="server" class="btn btn-warning" Text="I Forgot My PIN" style="margin-left:15px;"/>
                        
                            

                      </div>
                    

                    
                </div>

          </div>
        </div>
      </div>
</asp:Content>
