<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AMC_master.Master" CodeBehind="myinfo.aspx.vb" Inherits="AMC_ws.myinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-horizontal" id="registrationForm"> 
    <div class="bodyBg"> 
    <div class="content container">
        <div class="container">
            <div class="row">
                <section class="col-sm-1"> </section>
                <section class="col-sm-9">
                  <div class="subTitle">
                    <h2 class="subH2">
                        <asp:Label ID="L_infoName" runat="server" Text="Label"></asp:Label> 
                        <asp:Label ID="L_infoLast" runat="server" Text="Label"></asp:Label>
                      </h2>
                  </div>
                </section>
                <section class="col-sm-10 col-sm-offset-2">
                    <div class="form-group">
                         
                             <br>
                             <fieldset>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label"
                                    id="LfName">* First Name</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="Tfname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                                          ControlToValidate="Tfname"
                                          ErrorMessage="First name is a required field."
                                          ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label"
                                    id="LlName">* Last Name</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="Tlname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                          ControlToValidate="Tlname"
                                          ErrorMessage="Last name is a required field."
                                          ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label"
                                    ID="Lcompany">Company</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="Tcompany" runat="server" class="form-control" placeholder="Company Name"></asp:TextBox>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label"
                                    ID="Laddress">* Address</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="Taddress1" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
                                        <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                                          ControlToValidate="Taddress1"
                                          ErrorMessage="Address is a required field."
                                          ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                 </div>
                                 <div class="form-group"> 
                                     <label class="col-sm-2 control-label"
                                      id="Laddress2"></label>
                                     <div class="col-sm-10">
                                        <asp:TextBox ID="Taddress2" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label"
                                    id="Lcity">* City</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="Tcity" runat="server" class="form-control" placeholder="City"></asp:TextBox>
                                        <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                                          ControlToValidate="Tcity"
                                          ErrorMessage="City is a required field."
                                          ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label"
                                    id="Lstate">State or Province</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="Tstate" runat="server" class="form-control" placeholder="State or Province"></asp:TextBox>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label"
                                    id="Lcountry">Country</label>
                                     <div class="col-sm-10">
                                        <asp:DropDownList ID="DLcountry" runat="server" class="form-control">
                                            <asp:ListItem>USA</asp:ListItem>
                                            <asp:ListItem>Albania</asp:ListItem>
                                          <asp:ListItem>Algeria</asp:ListItem>
                                          <asp:ListItem>American Samoa</asp:ListItem>
                                          <asp:ListItem>Andorra</asp:ListItem>
                                          <asp:ListItem>Angola</asp:ListItem>
                                          <asp:ListItem>Anguilla</asp:ListItem>
                                          <asp:ListItem>Antigua</asp:ListItem>
                                          <asp:ListItem>Antilles</asp:ListItem>
                                          <asp:ListItem>Argentina</asp:ListItem>
                                          <asp:ListItem>Armenia</asp:ListItem>
                                          <asp:ListItem>Aruba</asp:ListItem>
                                          <asp:ListItem>Australia</asp:ListItem>
                                          <asp:ListItem>Austria</asp:ListItem>
                                          <asp:ListItem>Azerbaijan</asp:ListItem>
                                          <asp:ListItem>Azores</asp:ListItem>
                                          <asp:ListItem>Bahamas</asp:ListItem>
                                          <asp:ListItem>Bahrain</asp:ListItem>
                                          <asp:ListItem>Bangladesh</asp:ListItem>
                                          <asp:ListItem>Barbados</asp:ListItem>
                                          <asp:ListItem>Barbuda</asp:ListItem>
                                          <asp:ListItem>Belgium</asp:ListItem>
                                          <asp:ListItem>Belize</asp:ListItem>
                                          <asp:ListItem>Belorus</asp:ListItem>
                                          <asp:ListItem>Benin</asp:ListItem>
                                          <asp:ListItem>Bermuda</asp:ListItem>
                                          <asp:ListItem>Bhutan</asp:ListItem>
                                          <asp:ListItem>Bolivia</asp:ListItem>
                                          <asp:ListItem>Bonaire</asp:ListItem>
                                          <asp:ListItem>Bosnia and Herzegovina</asp:ListItem>
                                          <asp:ListItem>Botswana</asp:ListItem>
                                          <asp:ListItem>Br. Virgin Islands</asp:ListItem>
                                          <asp:ListItem>Brazil</asp:ListItem>
                                          <asp:ListItem>Brunei</asp:ListItem>
                                          <asp:ListItem>Bulgaria</asp:ListItem>
                                          <asp:ListItem>Burkina Faso</asp:ListItem>
                                          <asp:ListItem>Burundi</asp:ListItem>
                                          <asp:ListItem>Caicos Island</asp:ListItem>
                                          <asp:ListItem>Cameroon</asp:ListItem>
                                          <asp:ListItem>Canada</asp:ListItem>
                                          <asp:ListItem>Canary Islands</asp:ListItem>
                                          <asp:ListItem>Cape Verde</asp:ListItem>
                                          <asp:ListItem>Cayman Islands</asp:ListItem>
                                          <asp:ListItem>Central African Republic</asp:ListItem>
                                          <asp:ListItem>Chad</asp:ListItem>
                                          <asp:ListItem>Channel Islands</asp:ListItem>
                                          <asp:ListItem>Chile</asp:ListItem>
                                          <asp:ListItem>China</asp:ListItem>
                                          <asp:ListItem>Colombia</asp:ListItem>
                                          <asp:ListItem>Commonwealth of Ind State</asp:ListItem>
                                          <asp:ListItem>Congo</asp:ListItem>
                                          <asp:ListItem>Cook Islands</asp:ListItem>
                                          <asp:ListItem>Cooper Island</asp:ListItem>
                                          <asp:ListItem>Costa Rica</asp:ListItem>
                                          <asp:ListItem>Cote d'Ivoire</asp:ListItem>
                                          <asp:ListItem>Croatia</asp:ListItem>
                                          <asp:ListItem>Curacao</asp:ListItem>
                                          <asp:ListItem>Cyprus</asp:ListItem>
                                          <asp:ListItem>Czech Republic</asp:ListItem>
                                          <asp:ListItem>Denmark</asp:ListItem>
                                          <asp:ListItem>Djibouti</asp:ListItem>
                                          <asp:ListItem>Dominica</asp:ListItem>
                                          <asp:ListItem>Dominican Republic</asp:ListItem>
                                          <asp:ListItem>Ecuador</asp:ListItem>
                                          <asp:ListItem>Egypt</asp:ListItem>
                                          <asp:ListItem>El Salvador</asp:ListItem>
                                          <asp:ListItem>England</asp:ListItem>
                                          <asp:ListItem>Equatorial Guinea</asp:ListItem>
                                          <asp:ListItem>Estonia</asp:ListItem>
                                          <asp:ListItem>Ethiopia</asp:ListItem>
                                          <asp:ListItem>Fiji</asp:ListItem>
                                          <asp:ListItem>Finland</asp:ListItem>
                                          <asp:ListItem>France</asp:ListItem>
                                          <asp:ListItem>French Guiana</asp:ListItem>
                                          <asp:ListItem>French Polynesia</asp:ListItem>
                                          <asp:ListItem>Futuna Island</asp:ListItem>
                                          <asp:ListItem>Gabon</asp:ListItem>
                                          <asp:ListItem>Gambia</asp:ListItem>
                                          <asp:ListItem>Georgia</asp:ListItem>
                                          <asp:ListItem>Germany</asp:ListItem>
                                          <asp:ListItem>Ghana</asp:ListItem>
                                          <asp:ListItem>Gibraltar</asp:ListItem>
                                          <asp:ListItem>Greece</asp:ListItem>
                                          <asp:ListItem>Grenada</asp:ListItem>
                                          <asp:ListItem>Grenland</asp:ListItem>
                                          <asp:ListItem>Guadeloupe</asp:ListItem>
                                          <asp:ListItem>Guam</asp:ListItem>
                                          <asp:ListItem>Guatemala</asp:ListItem>
                                          <asp:ListItem>Guinea</asp:ListItem>
                                          <asp:ListItem>Guinea-Bissau</asp:ListItem>
                                          <asp:ListItem>Guyana</asp:ListItem>
                                          <asp:ListItem>Haiti</asp:ListItem>
                                          <asp:ListItem>Holland</asp:ListItem>
                                          <asp:ListItem>Honduras</asp:ListItem>
                                          <asp:ListItem>Hong Kong</asp:ListItem>
                                          <asp:ListItem>Hungary</asp:ListItem>
                                          <asp:ListItem>Iceland</asp:ListItem>
                                          <asp:ListItem>India</asp:ListItem>
                                          <asp:ListItem>Indonesia</asp:ListItem>
                                          <asp:ListItem>Iran</asp:ListItem>
                                          <asp:ListItem>Iraq</asp:ListItem>
                                          <asp:ListItem>Ireland, Northern</asp:ListItem>
                                          <asp:ListItem>Ireland, Republic of</asp:ListItem>
                                          <asp:ListItem>Isle of Man</asp:ListItem>
                                          <asp:ListItem>Israel</asp:ListItem>
                                          <asp:ListItem>Italy</asp:ListItem>
                                          <asp:ListItem>Ivory Coast</asp:ListItem>
                                          <asp:ListItem>Jamaica</asp:ListItem>
                                          <asp:ListItem>Japan</asp:ListItem>
                                          <asp:ListItem>Jordan</asp:ListItem>
                                          <asp:ListItem>Jost Van Dyke Island</asp:ListItem>
                                          <asp:ListItem>Kampuchea</asp:ListItem>
                                          <asp:ListItem>Kazakhstan</asp:ListItem>
                                          <asp:ListItem>Kenya</asp:ListItem>
                                          <asp:ListItem>Kiribati</asp:ListItem>
                                          <asp:ListItem>Korea</asp:ListItem>
                                          <asp:ListItem>Korea, South</asp:ListItem>
                                          <asp:ListItem>Kosrae</asp:ListItem>
                                          <asp:ListItem>Kuwait</asp:ListItem>
                                          <asp:ListItem>Kyrgyzstan</asp:ListItem>
                                          <asp:ListItem>Laos</asp:ListItem>
                                          <asp:ListItem>Latvia</asp:ListItem>
                                          <asp:ListItem>Lebanon</asp:ListItem>
                                          <asp:ListItem>Lesotho</asp:ListItem>
                                          <asp:ListItem>Liberia</asp:ListItem>
                                          <asp:ListItem>Liechtenstein</asp:ListItem>
                                          <asp:ListItem>Lithuania</asp:ListItem>
                                          <asp:ListItem>Luxembourg</asp:ListItem>
                                          <asp:ListItem>Macau</asp:ListItem>
                                          <asp:ListItem>Macedonia</asp:ListItem>
                                          <asp:ListItem>Madagascar</asp:ListItem>
                                          <asp:ListItem>Madeira Islands</asp:ListItem>
                                          <asp:ListItem>Malagasy</asp:ListItem>
                                          <asp:ListItem>Malawi</asp:ListItem>
                                          <asp:ListItem>Malaysia</asp:ListItem>
                                          <asp:ListItem>Maldives</asp:ListItem>
                                          <asp:ListItem>Mali</asp:ListItem>
                                          <asp:ListItem>Malta</asp:ListItem>
                                          <asp:ListItem>Marshall Islands</asp:ListItem>
                                          <asp:ListItem>Martinique</asp:ListItem>
                                          <asp:ListItem>Mauritania</asp:ListItem>
                                          <asp:ListItem>Mauritius</asp:ListItem>
                                          <asp:ListItem>Mexico</asp:ListItem>
                                          <asp:ListItem>Micronesia</asp:ListItem>
                                          <asp:ListItem>Moldova</asp:ListItem>
                                          <asp:ListItem>Monaco</asp:ListItem>
                                          <asp:ListItem>Mongolia</asp:ListItem>
                                          <asp:ListItem>Montserrat</asp:ListItem>
                                          <asp:ListItem>Montenegro</asp:ListItem>
                                          <asp:ListItem>Morocco</asp:ListItem>
                                          <asp:ListItem>Mozambique</asp:ListItem>
                                          <asp:ListItem>Myanmar</asp:ListItem>
                                          <asp:ListItem>Namibia</asp:ListItem>
                                          <asp:ListItem>Nauru</asp:ListItem>
                                          <asp:ListItem>Nepal</asp:ListItem>
                                          <asp:ListItem>Netherlands</asp:ListItem>
                                          <asp:ListItem>Nevis</asp:ListItem>
                                          <asp:ListItem>Nevis (St. Kitts)</asp:ListItem>
                                          <asp:ListItem>New Caledonia</asp:ListItem>
                                          <asp:ListItem>New Zealand</asp:ListItem>
                                          <asp:ListItem>Nicaragua</asp:ListItem>
                                          <asp:ListItem>Niger</asp:ListItem>
                                          <asp:ListItem>Nigeria</asp:ListItem>
                                          <asp:ListItem>Niue</asp:ListItem>
                                          <asp:ListItem>Norfolk Island</asp:ListItem>
                                          <asp:ListItem>Norman Island</asp:ListItem>
                                          <asp:ListItem>Northern Mariana Islands</asp:ListItem>
                                          <asp:ListItem>Norway</asp:ListItem>
                                          <asp:ListItem>Oman</asp:ListItem>
                                          <asp:ListItem>Pakistan</asp:ListItem>
                                          <asp:ListItem>Palau</asp:ListItem>
                                          <asp:ListItem>Palestine</asp:ListItem>
                                          <asp:ListItem>Panama</asp:ListItem>
                                          <asp:ListItem>Papua New Guinea</asp:ListItem>
                                          <asp:ListItem>Paraguay</asp:ListItem>
                                          <asp:ListItem>Peru</asp:ListItem>
                                          <asp:ListItem>Philippines </asp:ListItem>
                                          <asp:ListItem>Poland</asp:ListItem>
                                          <asp:ListItem>Ponape</asp:ListItem>
                                          <asp:ListItem>Portugal</asp:ListItem>
                                          <asp:ListItem>Puerto Rico</asp:ListItem>
                                          <asp:ListItem>Qatar</asp:ListItem>
                                          <asp:ListItem>Reunion</asp:ListItem>
                                          <asp:ListItem>Romania</asp:ListItem>
                                          <asp:ListItem>Rota</asp:ListItem>
                                          <asp:ListItem>Russia</asp:ListItem>
                                          <asp:ListItem>Rwanda</asp:ListItem>
                                          <asp:ListItem>Saba</asp:ListItem>
                                          <asp:ListItem>Saipan</asp:ListItem>
                                          <asp:ListItem>San Marino</asp:ListItem>
                                          <asp:ListItem>Sao Tome</asp:ListItem>
                                          <asp:ListItem>Saudi Arabia</asp:ListItem>
                                          <asp:ListItem>Scotland</asp:ListItem>
                                          <asp:ListItem>Senegal</asp:ListItem>
                                          <asp:ListItem>Serbia</asp:ListItem>
                                          <asp:ListItem>Seychelles</asp:ListItem>
                                          <asp:ListItem>Sierra Leone</asp:ListItem>
                                          <asp:ListItem>Singapore</asp:ListItem>
                                          <asp:ListItem>Slovakia</asp:ListItem>
                                          <asp:ListItem>Slovenia</asp:ListItem>
                                          <asp:ListItem>Solomon Islands</asp:ListItem>
                                          <asp:ListItem>Somalia</asp:ListItem>
                                          <asp:ListItem>South Africa</asp:ListItem>
                                          <asp:ListItem>Spain</asp:ListItem>
                                          <asp:ListItem>Sri Lanka</asp:ListItem>
                                          <asp:ListItem>St. Barthelemy</asp:ListItem>
                                          <asp:ListItem>St. Christopher</asp:ListItem>
                                          <asp:ListItem>St. Croix</asp:ListItem>
                                          <asp:ListItem>St. Eustatius</asp:ListItem>
                                          <asp:ListItem>St. John</asp:ListItem>
                                          <asp:ListItem>St. Kitts</asp:ListItem>
                                          <asp:ListItem>St. Lucia</asp:ListItem>
                                          <asp:ListItem>St. Maarten</asp:ListItem>
                                          <asp:ListItem>St. Martin</asp:ListItem>
                                          <asp:ListItem>St. Thomas</asp:ListItem>
                                          <asp:ListItem>St. Vincent</asp:ListItem>
                                          <asp:ListItem>Sudan</asp:ListItem>
                                          <asp:ListItem>Suriname</asp:ListItem>
                                          <asp:ListItem>Swaziland</asp:ListItem>
                                          <asp:ListItem>Sweden</asp:ListItem>
                                          <asp:ListItem>Switzerland</asp:ListItem>
                                          <asp:ListItem>Syria</asp:ListItem>
                                          <asp:ListItem>Tahiti</asp:ListItem>
                                          <asp:ListItem>Taiwan</asp:ListItem>
                                          <asp:ListItem>Tajikistan</asp:ListItem>
                                          <asp:ListItem>Tanzania</asp:ListItem>
                                          <asp:ListItem>Thailand</asp:ListItem>
                                          <asp:ListItem>Tinian</asp:ListItem>
                                          <asp:ListItem>Togo</asp:ListItem>
                                          <asp:ListItem>Tonga</asp:ListItem>
                                          <asp:ListItem>Tortola</asp:ListItem>
                                          <asp:ListItem>Trinidad and Tobago</asp:ListItem>
                                          <asp:ListItem>Truk</asp:ListItem>
                                          <asp:ListItem>Tunisia</asp:ListItem>
                                          <asp:ListItem>Turkey</asp:ListItem>
                                          <asp:ListItem>Turkmenistan</asp:ListItem>
                                          <asp:ListItem>Turks and Caicos Islands</asp:ListItem>
                                          <asp:ListItem>Tuvalu</asp:ListItem>
                                          <asp:ListItem>U.S. Virgin Islands</asp:ListItem>
                                          <asp:ListItem>Uganda</asp:ListItem>
                                          <asp:ListItem>Ukraine</asp:ListItem>
                                          <asp:ListItem>United Arab Emirates</asp:ListItem>
                                          <asp:ListItem>United Kingdom</asp:ListItem>
                                          <asp:ListItem>Uruguay</asp:ListItem>
                                          <asp:ListItem>Uzbekistan</asp:ListItem>
                                          <asp:ListItem>Vanuatu</asp:ListItem>
                                          <asp:ListItem>Vatican City</asp:ListItem>
                                          <asp:ListItem>Venezuela</asp:ListItem>
                                          <asp:ListItem>Vietnam</asp:ListItem>
                                          <asp:ListItem>Virgin Islands (British)</asp:ListItem>
                                          <asp:ListItem>Virgin Islands (U.S.)</asp:ListItem>
                                          <asp:ListItem>Wake Island</asp:ListItem>
                                          <asp:ListItem>Wales</asp:ListItem>
                                          <asp:ListItem>Wallis Island</asp:ListItem>
                                          <asp:ListItem>Western Samoa</asp:ListItem>
                                          <asp:ListItem>Yap</asp:ListItem>
                                          <asp:ListItem>Yemen, Republic of</asp:ListItem>
                                          <asp:ListItem>Yugoslavia</asp:ListItem>
                                          <asp:ListItem>Zaire</asp:ListItem>
                                          <asp:ListItem>Zambia</asp:ListItem>
                                          <asp:ListItem>Zimbabwe</asp:ListItem>
                                         </asp:DropDownList>
                                                                                
                                          
                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                        id="Lzip">Zip Code</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="Tzip" runat="server" class="form-control" placeholder="Zip Code"></asp:TextBox>
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                        id="Lemail">* E-mail</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="Temail" runat="server" class="form-control" placeholder="email" TextMode="Email"></asp:TextBox>
                                            <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                                              ControlToValidate="Temail"
                                              ErrorMessage="Email is a required field."
                                              ForeColor="Red">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                        id="Lphone1">Telephone</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="Tphone1" runat="server" class="form-control" placeholder="Telephone" TextMode="Phone"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                        id="Lphone2"></label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="Tphone2" runat="server" class="form-control" placeholder="Telephone" TextMode="Phone"></asp:TextBox>
                                        </div>
                                    </div>
                                 </div>
                             </fieldset>
                    <br />
                    <fieldset>
                        <legend>Username / Password / PIN</legend>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                            id="Lusern">User Name</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="Tusern" runat="server" class="form-control" placeholder="User Name"></asp:TextBox>
                                <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server"
                                          ControlToValidate="Tusern"
                                          ErrorMessage="Username is a required field."
                                          ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div>
                            <h6>Password must be between 6 and 12 characters long</h6>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                            id="Lpassword1">Password</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="Tpassword1" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server"
                                          ControlToValidate="Tpassword1"
                                          ErrorMessage="Password is a required field."
                                          ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                            id="Lpassword2">Verify Password</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="Tpassword2" runat="server" class="form-control" placeholder="Verify Password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator id="RequiredFieldValidator8" runat="server"
                                          ControlToValidate="Tpassword2"
                                          ErrorMessage="Password is a required field."
                                          ForeColor="Red">
                                        </asp:RequiredFieldValidator>
                                <asp:CompareValidator id="comparePasswords" 
                                  runat="server"
                                  ControlToCompare="Tpassword1"
                                  ControlToValidate="Tpassword2"
                                  ErrorMessage="Your passwords do not match up!"
                                  ForeColor="Red"
                                  Display="Dynamic" />
                            </div>
                        </div>
                        <div>
                            <h6>PIN must be 4 numbers</h6>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                            id="Lpin1">Pin</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="Tpin1" runat="server" class="form-control" placeholder="Pin" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                            id="Lpin2">Verify Pin</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="Tpin2" runat="server" class="form-control" placeholder="Verify Pin" TextMode="Password"></asp:TextBox>
                            </div>
                            </div>
                        </fieldset><asp:Button ID="B_update" runat="server" Text="Update" CssClass="btn btn-search" />
                        <div class="form-group">
                            <div class="col-sm-10 col-sm-offset-2"> 
                                
                            </div>
                            
                         </div>
                        
                    </div>
                </section>          
            </div>
        </div>       
    </div>   

 </div>  
 <script src="dist/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
    <script type="text/javascript">
        function ErrorUsername() {
            swal({
                title: 'Username',
                text: 'Username already taken',
                type: 'error'
            });
        }
        function ErrorPassword() {
            swal({
                title: 'Invalid Password',
                text: 'Password invalid or does not match',
                type: 'error'
            });
        }
        function ErrorField() {
            swal({
                title: 'Required Field',
                text: '* Complete required field',
                type: 'error'
            });
        }
        function SuccessRegistration() {
            swal({
                title: 'Registration Submited',
                text: 'Your account has been created',
                type: 'success'
            },
                  function () {
                      window.location.href = 'default.aspx';
                  });
        }
    </script>
</asp:Content>
