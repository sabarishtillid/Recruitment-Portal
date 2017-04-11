<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CandidatesList.ascx.cs" Inherits="Recruitment_Portal.CandidatesList.CandidatesList" %>
<div id="newform" runat="server">

<div class="col-md-9 inner_cont">
    <div class="form-horizontal submt_form top-buffer">

         <div class="form-group">
            <asp:Label ID="lblvacancyname" runat="server" CssClass="col-md-6">Vacancy</asp:Label>
            <div class="col-md-6">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
          
            <asp:Label ID="LabelName" runat="server" Text="Label" CssClass="col-md-6">Candidate Name</asp:Label>

            <div class="col-md-6">
                <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
        </div>
  


   

<div class="form-group">
    <asp:Label ID="LabelDomain" runat="server" CssClass="col-md-6">Domain</asp:Label>
    <div class="col-md-6">
        <asp:DropDownList ID="drpdomain" runat="server" CssClass="form-control">
            <asp:ListItem>Please select the Domain</asp:ListItem>
            <asp:ListItem>Sharepoint</asp:ListItem>
            <asp:ListItem>Dot Net</asp:ListItem>
            <asp:ListItem>Admin</asp:ListItem>
            <asp:ListItem>Testing</asp:ListItem>
            <asp:ListItem>UI</asp:ListItem>
        </asp:DropDownList>
    </div>
</div>

<div class="form-group">
    <asp:Label ID="LabelExperience" runat="server" CssClass="col-md-6">Experience</asp:Label>
    <div class="col-md-6">
        <asp:TextBox ID="txtexperience" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>


<div class="form-group">
    <asp:Label ID="LabelSkillset" runat="server" Text="Label" CssClass="col-md-6">Skillset</asp:Label>
    <div class="col-md-6">
        <asp:TextBox ID="txtskillset" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>

<div class="form-group">
    <asp:Label ID="LabelCrtctc" runat="server" Text="Label" CssClass="col-md-6">Current CTC</asp:Label>
    <div class="col-md-6">
        <asp:TextBox ID="txtcrtctc" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>

<div class="form-group">
    <asp:Label ID="LabelExctc" runat="server" Text="Label" CssClass="col-md-6">Expected CTC</asp:Label>
    <div class="col-md-6">
        <asp:TextBox ID="txtexctc" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>

<div class="form-group">
    <asp:Label ID="LabelEmail" runat="server" Text="Label" CssClass="col-md-6">Email</asp:Label>
    <div class="col-md-6">
        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>

<div class="form-group">
    <asp:Label ID="LabelContact" runat="server" Text="Label" CssClass="col-md-6">Contact No</asp:Label>
    <div class="col-md-6">
        <asp:TextBox ID="txtcontact" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>

<div class="form-group">
    <asp:Label ID="LabelFileupload" runat="server" Text="Label" CssClass="col-md-6">Resume</asp:Label>
    <div class="col-md-6">
      
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
    </div>
</div>

<div class="form-group">
    <asp:Label ID="LabelSource" runat="server" Text="Label" CssClass="col-md-6">Source</asp:Label>
    <div class="col-md-6">
        <asp:TextBox ID="txtSource" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>

<div class="form-group">
    <asp:Label ID="LabelNoticeperiod" runat="server" Text="Label" CssClass="col-md-6">Notice Period</asp:Label>
    <div class="col-md-6">
        <asp:TextBox ID="txtNotice" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>

  



 <ul class="pull-right list-inline">
        <li>
            <asp:Button ID="btnsubmit" runat="server" OnClick="Button2_Click" CssClass="btn btn-default blu_btn" Text="Submit" /></li>
        <li>
            <asp:Button ID="btnclear" runat="server" OnClick="btnclear_Click"  CssClass="btn btn-default blu_btn" Text="Cancel" /></li>
    </ul>
          </div>
</div>
</div>



<asp:Button ID="BtnEmployee" runat="server" Text="Create Candidate " OnClick="BtnEmployee_Click" class="btn btn-default blu_btn" />
<br />
<br />

<div class="table-responsive RecruitmentTable" id="oGridBlock" runat="server">

    <asp:GridView ID="oGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowCancelingEdit="oGridView_RowCancelingEdit" OnScheduleInterview="oGridView_ScheduleInterview" AllowPaging="true" OnPageIndexChanging="oGridView_PageIndexChanging" 
        OnRowEditing="oGridView_RowEditing" OnRowUpdating="oGridView_RowUpdating" OnRowDeleting="oGridView_RowDeleting" CellPadding="5" ForeColor="#284775"  AllowSorting="True" CaptionAlign="Top" CssClass="table lats_submsn">

        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" VerticalAlign="Middle" />

        <Columns>
            <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                   <%-- <asp:Label ID="lblnID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>--%>
                      <asp:HyperLink ID="lblnID" runat="server" NavigateUrl='<%# Bind("ID", "/sitePages/Details.aspx?ID={0}") %>'
                    Text='<%# Bind("ID") %>' />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>


              <asp:TemplateField HeaderText="Vacancy" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                   <%-- <asp:DropDownList ID="txtnVacancy" runat="server" ></asp:DropDownList>--%>
                    <asp:Label ID="txtnVacancy" runat="Server" Text='<%# Bind("VacancyName") %>'></asp:Label>
                 </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblVacancy" runat="server" Text='<%# Bind("VacancyName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Candidate Name" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtname" runat="server" Text='<%# Bind("CandidateName") %>' width="125px" ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                   <%-- <asp:Label ID="lblname" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label>--%>
                     <asp:HyperLink ID="lblname" runat="server" NavigateUrl='<%# string.Format("/Pages/CandidateDetails.aspx?ID={0}&CandidateName={1}&Domain={2}&Experience={3}&SkillSets={4}&CurrentCTC={5}&ExpectedCTC={6}&Email={7}&ContactNo={8}&UploadedResume={9}&Source={10}&NoticePeriod={11}",
                    HttpUtility.UrlEncode(Eval("ID").ToString()), HttpUtility.UrlEncode(Eval("CandidateName").ToString()),HttpUtility.UrlEncode(Eval("Domain").ToString()),
                    HttpUtility.UrlEncode(Eval("Experience").ToString()), HttpUtility.UrlEncode(Eval("SkillSets").ToString()),
                    HttpUtility.UrlEncode(Eval("CurrentCTC").ToString()),HttpUtility.UrlEncode(Eval("ExpectedCTC").ToString()),
                    HttpUtility.UrlEncode(Eval("Email").ToString()),
                    HttpUtility.UrlEncode(Eval("ContactNo").ToString()),HttpUtility.UrlEncode(Eval("UploadedResume").ToString()),
                    HttpUtility.UrlEncode(Eval("Source").ToString()),
                    HttpUtility.UrlEncode(Eval("NoticePeriod").ToString()))%>'
                    Text='<%# Bind("CandidateName") %>' />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

          
            <asp:TemplateField HeaderText="Domain" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:DropDownList ID="drpdomain" runat="server" SelectedValue='<%# Bind("Domain") %>'>
                        <asp:ListItem>Sharepoint</asp:ListItem>
                        <asp:ListItem>Dot Net</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Testing</asp:ListItem>
                        <asp:ListItem>UI</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbldomain" runat="server" Text='<%# Bind("Domain") %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Experience" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtexperience"  runat="server" Text='<%# Bind("Experience") %>' width="125px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblExperience" runat="server" Text='<%# Bind("Experience") %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Skill Sets" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtskillset"  runat="server" Text='<%# Bind("SkillSets") %>' width="125px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblskillset" runat="server" Text='<%# Bind("SkillSets") %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>
          

           

            <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtemail" runat="server" Text='<%# Bind("Email") %>' width="125px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                   <%-- <asp:Label ID="lblemail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>--%>
                    <asp:HyperLink ID="lblemail" runat="server" Text='<%# Bind("Email")%>' NavigateUrl='<%# Bind("Email", "mailto:{0}") %>' /> 
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ContactNo" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtcontact" runat="server" Text='<%# Bind("ContactNo") %>' width="125px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblcontact" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

          
        

            <asp:TemplateField HeaderText="UploadedResume" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                  <%--  <asp:TextBox ID="txtresume" runat="server" Text='<%# Bind("UploadedResume") %>' width="125px"></asp:TextBox>--%>
                    <asp:FileUpload ID="FileUpload2" runat="server" FileName='<%# Bind("UploadedResume") %>'/> 
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDownload" Text = '<%# Bind("UploadedResume") %>' runat="server" OnClick="DownloadFile"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

           <asp:TemplateField HeaderText="Source" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtSource" runat="server" Text='<%# Bind("Source") %>' width="125px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSource" runat="server" Text='<%# Bind("Source") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="Notice Period" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtNotice" runat="server" Text='<%# Bind("NoticePeriod") %>' width="125px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblNotice" runat="server" Text='<%# Bind("NoticePeriod") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            
        

            <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Left" ShowHeader="false" ControlStyle-Width="50px">
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkUdpate" runat="server" Text="Update" CausesValidation="true" CommandName="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CausesValidation="true" CommandName="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="glyphicon glyphicon-edit" CausesValidation="true" CommandName="Edit"></asp:LinkButton>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Left" ShowHeader="false" ControlStyle-Width="50px">
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CausesValidation="false" CommandName="Delete"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server"  CssClass="glyphicon glyphicon-trash" CausesValidation="false" CommandName="Delete"></asp:LinkButton>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="ScheduleInterview" HeaderStyle-HorizontalAlign="Left" ShowHeader="false" ControlStyle-Width="50px">
                <EditItemTemplate>
                    <asp:HyperLink ID="lnkScheduleInterview" runat="server" Text="Schedule Interview" CausesValidation="false" ></asp:HyperLink>
                </EditItemTemplate>
                <ItemTemplate>
                     <asp:HyperLink ID="lnkScheduleInterview" runat="server" NavigateUrl='<%# string.Format("/Pages/ScheduleInterview.aspx?ID={0}",
                    HttpUtility.UrlEncode(Eval("ID").ToString()))%>' CssClass="glyphicon glyphicon-tasks"/>
                    
                               
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

        </Columns>

        <EditRowStyle BackColor="#999999" HorizontalAlign="Center" VerticalAlign="Middle" />
        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

    </asp:GridView>
</div>



