<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="welcome.aspx.vb" Inherits="AMC_ws.welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bodyBg">
    <div class="content container">
        <div class="container">
          <div class="row">
            <section class="col-sm-1"> </section>
            <section class="col-sm-9">
              <div class="subTitle">
                <h2 class="subH2">Hello <asp:Label ID="L_fullname" runat="server" Text="Label"></asp:Label>!</h2>
              </div>
              <br/>
              <blockquote>
                Our website is at your command. You can start right away
                searching for that great tune, or you can go back to a project
                that you were already working on, open a new project folder, go
                to the download center and retrieve your music, track your music
                licensing, view our entire music catalog, see our newest music
                releases or simply change your personal information.
                <br/>
                    <br/>
                If you have any questions or require further assistance please
                call us directly at <b>516.764.1466</b> and someone will assist
                you right away. Thank you for choosing American Music Company.
                   <br/>
                    <br/>
                Great customer service, that's what American Music Company is
                all about!
               <br/>
                 <br/>
                Our office hours are Monday thru Friday, 7:30am to 8:00pm
                eastern </blockquote>
            </section>
            <section class="col-sm-2"> </section>
          </div>
        </div>
        <div class="col-sm-12">
          <h1 class="brandBody"><i>"Music that skips a beat!"</i></h1>
        </div>
        <div class="container">
          <div class="row">
            <section class="col-sm-3 col-sm-offset-1"> <a href="#"> <img src="images/contact-mail-icon.png"

                  class="img-responsive center-block" alt="mailContact"> </a> </section>
            <section class="col-sm-3"> <a href="musicsearch.html"> <img src="images/contact-email-icon.png"

                  class="img-responsive center-block" alt="emailContact"> </a>
            </section>
            <section class="col-sm-3"> <a href="join.html"> <img src="images/contact-phone-icon.png"

                  class="img-responsive center-block" alt="phoneContact"> </a>
            </section>
          </div>
        </div>
      </div>
        <img src="images/saxsiluette.png" class="bgCor"

        alt="cornerImg">
        </div>
</asp:Content>
