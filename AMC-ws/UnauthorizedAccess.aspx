<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="UnauthorizedAccess.aspx.vb" Inherits="AMC_ws.UnauthorizedAccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bodyBg" style="height: 500px;">
        <div style="margin-left: 400px;">
            <br />
            <h2>Unauthorized Access</h2>
            <p>
                You have attempted to access a page that you are not authorized to view.
            </p>
            <p>
                If you have any questions, please contact the site administrator.
            </p>
        </div>
    </div>
</asp:Content>
