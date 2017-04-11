<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Submit.ascx.cs" Inherits="recruitmentportal.Submit.Submit" %>


<asp:HiddenField ID="hdnDownloadUrl" runat="server" />

<div id="newform" runat="server">
<p>
    Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
   
</p>
<p>
    Domain&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="drpdomain" runat="server" Height="18px" Width="127px">
        <asp:ListItem>Please select the Domain</asp:ListItem>
        <asp:ListItem>Sharepoint</asp:ListItem>
        <asp:ListItem>Dot Net</asp:ListItem>
        <asp:ListItem>Admin</asp:ListItem>
          <asp:ListItem>Testing</asp:ListItem>
        <asp:ListItem>UI</asp:ListItem>
    </asp:DropDownList>
     
</p>
    <p>
        Experience&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="txtexperience" runat="server"></asp:TextBox>
    </p>
    <p>
        Skill Sets&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:TextBox ID="txtskillset" runat="server"></asp:TextBox>
    </p>
<p>
    Current CTC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtcrtctc" runat="server"></asp:TextBox>
</p>
<p>
    Expected CTC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtexctc" runat="server"></asp:TextBox>
</p>
    <p>
        Interview Scheduled Date&Time&nbsp;&nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <SharePoint:DateTimeControl ID="DateTimeControl1" runat="server" />
        
    </p>
    
      Interviewer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <SharePoint:PeopleEditor ID="spPeoplePickerUserName" Width="200" runat="server" SelectionSet="User"     AllowEmpty="true" MultiSelect="false" AutoPostBack="false"/>
    <p>

    </p>
<p>
    Resume&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:FileUpload ID="FileUpload1" runat="server" />
    
</p>

<p>
    Remarks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtremark" runat="server" Height="51px" Width="123px"></asp:TextBox>
</p>
<p>
    &nbsp;Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
</p>
<p>
    Contact No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtcontact" runat="server"></asp:TextBox>
    
</p>
    <p>
    Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <asp:DropDownList ID="drpStatus" runat="server">
                        <asp:ListItem>Completed</asp:ListItem>
                        <asp:ListItem>Not Completed</asp:ListItem>
                        <asp:ListItem>On Hold</asp:ListItem>
       </asp:DropDownList>
     
</p>
<p>
    &nbsp;</p>
<div style="margin-left: 80px">
    <asp:Button ID="btnsubmit" runat="server" OnClick="Button2_Click" Text="Submit" style="height: 26px" BackColor="#0099FF" Font-Bold="True" Font-Italic="False" Font-Size="Small" ForeColor="Black"    />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnclear" runat="server" OnClick="btnclear_Click" Text="close"  CausesValidation="false" BackColor="#0099FF" Font-Bold="True" Font-Size="Small" ForeColor="Black"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<p style="margin-left: 80px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
</div>


<asp:Button ID="BtnEmployee" runat="server" Text="Schedule Interview" OnClick="BtnEmployee_Click" class="btn btn-default margin10" BackColor="#0099FF" Font-Bold="True" Font-Size="Small" ForeColor="Black" />

<br />

<br />

<div id="oGridBlock" runat="server">

    <asp:GridView ID="oGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowCancelingEdit="oGridView_RowCancelingEdit" AllowPaging="true" OnPageIndexChanging="oGridView_PageIndexChanging" 
        OnRowEditing="oGridView_RowEditing" OnRowUpdating="oGridView_RowUpdating" OnRowDeleting="oGridView_RowDeleting" CellPadding="5" ForeColor="#284775"  AllowSorting="True" CaptionAlign="Top">

        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" VerticalAlign="Middle" />

        <Columns>
            <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                </EditItemTemplate>

                <ItemTemplate>
                   <%-- <asp:Label ID="lblnID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>--%>
                    <asp:HyperLink ID="lblnID" runat="server" NavigateUrl='<%# Bind("ID", "/sites/recruitmentportal/Pages/Details.aspx?ID={0}") %>'
                    Text='<%# Bind("ID") %>' />
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtname" runat="server" Text='<%# Bind("Name") %>' width="125px" ></asp:TextBox>

                </EditItemTemplate>
                <ItemTemplate>
                   
                 <%--   <asp:Label ID="lblname" runat="server" Text='<%# Bind("Name") %>'></asp:Label>--%>
  <asp:HyperLink ID="lblname" runat="server" NavigateUrl='<%# string.Format("/Pages/Details.aspx?ID={0}&Name={1}&Domain={2}&Experience={3}&SkillSets={4}&CurrentCTC={5}&ExpectedCTC={6}&Remarks={7}&Email={8}&ContactNo={9}&UploadedResume={10}&Interviewer={11}&Status={12}&InterviewDate={13}",
                    HttpUtility.UrlEncode(Eval("ID").ToString()), HttpUtility.UrlEncode(Eval("Name").ToString()),HttpUtility.UrlEncode(Eval("Domain").ToString()),
                    HttpUtility.UrlEncode(Eval("Experience").ToString()), HttpUtility.UrlEncode(Eval("SkillSets").ToString()),
                    HttpUtility.UrlEncode(Eval("CurrentCTC").ToString()),HttpUtility.UrlEncode(Eval("ExpectedCTC").ToString()),
                    HttpUtility.UrlEncode(Eval("Remarks").ToString()),HttpUtility.UrlEncode(Eval("Email").ToString()),
                    HttpUtility.UrlEncode(Eval("ContactNo").ToString()),HttpUtility.UrlEncode(Eval("UploadedResume").ToString()),
                    HttpUtility.UrlEncode(Eval("Interviewer").ToString()),HttpUtility.UrlEncode(Eval("Status").ToString()), 
                    HttpUtility.UrlEncode(Eval("InterviewDate").ToString()))%>'
                    Text='<%# Bind("Name") %>' />
                    
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

            <asp:TemplateField HeaderText="CurrentCTC" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtcrtctc"  runat="server" Text='<%# Bind("CurrentCTC") %>' width="125px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblcrtctc" runat="server" Text='<%# Bind("CurrentCTC") %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="ExpectedCTC" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtexctc"   runat="server" Text='<%# Bind("ExpectedCTC") %>' width="125px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblexctc" runat="server" Text='<%# Bind("ExpectedCTC") %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="Remarks by Interviewer" HeaderStyle-HorizontalAlign="Left">
                <%--<EditItemTemplate>
                    <asp:TextBox ID="txtremark"   runat="server" Text='<%# Bind("Remarks") %>' width="125px"></asp:TextBox>
                </EditItemTemplate>--%>
                <ItemTemplate>
                    <asp:Label ID="lblremark" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
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

          
              <asp:TemplateField HeaderText="Interviewer" HeaderStyle-HorizontalAlign="Left">
         <%--   <EditItemTemplate>

                 <asp:TextBox ID="txtinterviewer" runat="server" Text='<%# Bind("Interviewer") %>' width="125px"></asp:TextBox>
                   <SharePoint:PeopleEditor ID="PeopleEditor1" runat="server" />

                     </EditItemTemplate>--%>
                <ItemTemplate>
                    <asp:Label ID="lblinterviewer" runat="server" Text='<%# Bind("Interviewer") %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                   
                      <asp:DropDownList ID="drpStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
                        <asp:ListItem>Completed</asp:ListItem>
                        <asp:ListItem>Not Completed</asp:ListItem>
                        <asp:ListItem>On Hold</asp:ListItem>
                       
                    </asp:DropDownList>
                   
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblchckstatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

    <asp:TemplateField HeaderText="InterviewDate" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                 <%--  <asp:TextBox ID="txtinterviewDate" runat="server" Text='<%# Bind("InterviewDate") %>' width="125px"></asp:TextBox>--%>
                    <SharePoint:DateTimeControl ID="DateTimeControl2" runat="server"  />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblinterviewDate" runat="server" Text='<%# Bind("InterviewDate") %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Left" ShowHeader="false" ControlStyle-Width="50px">
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkUdpate" runat="server" Text="Update" CausesValidation="true" CommandName="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CausesValidation="true" CommandName="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CausesValidation="true" CommandName="Edit"></asp:LinkButton>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Left" ShowHeader="false" ControlStyle-Width="50px">
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CausesValidation="false" CommandName="Delete"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CausesValidation="false" CommandName="Delete"></asp:LinkButton>
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
<div>
    <asp:Label ID="errormessage" runat="server"></asp:Label>
    <br />
</div>


<asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="doPrint()" BackColor="#0099FF" Font-Bold="True" Font-Size="Small" ForeColor="Black" />

<script>
    function doPrint() {
        var prtContent = document.getElementById('<%= oGridView.ClientID %>');
            prtContent.border = 0; //set no border here
            var WinPrint = window.open('', '', 'left=100,top=100,width=1000,height=1000,toolbar=0,scrollbars=1,status=0,resizable=1');
            WinPrint.document.write(prtContent.outerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
    }
       
   
  
</script>













 

    
                                    
    

