<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="WaitingConfirmation.aspx.vb" Inherits="AMC_ws.WaitingConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bodyBg" style="height: 500px;">
        <div style="margin-left: 400px;">
            <br />
              <h2>Account Activation</h2>
            <p>
                Thanks for your registration, our administrator will review your request. 
            </p>
            <p>
                If you have any questions or require further assistance please call us directly at <b>516.764.1466</b>
                <br />
                <i>American Music Company</i>
            </p>
            <br />
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-info" OnClick="btnBack_Click" />
        </div>
    </div>
</asp:Content>
