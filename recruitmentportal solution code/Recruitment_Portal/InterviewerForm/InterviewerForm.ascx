<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InterviewerForm.ascx.cs" Inherits="recruitmentportal.InterviewerForm.InterviewerForm" %>

    <div class="col-md-9 inner_cont">
    <div class="form-horizontal submt_form top-buffer">
        <%--<div class="form-group">
          
            <asp:Label ID="lblnname" runat="server" Text="Label" CssClass="col-md-6">Candidate Name</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblname" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>
        

          <div class="form-group">
          
            <asp:Label ID="lblndomain" runat="server" Text="Label" CssClass="col-md-6">Domain</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lbldomain" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>

         <div class="form-group">
          
            <asp:Label ID="lblnexperience" runat="server" Text="Label" CssClass="col-md-6">Experience</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblexperience" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>

         <div class="form-group">
          
            <asp:Label ID="lblnskillset" runat="server" Text="Label" CssClass="col-md-6">SkillSets</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblskillsets" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>
         <div class="form-group">
          
            <asp:Label ID="lblncurrentctc" runat="server" Text="Label" CssClass="col-md-6">CurrentCTC</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblcurrentctc" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>
        <div class="form-group">
          
            <asp:Label ID="lblnexpectedctc" runat="server" Text="Label" CssClass="col-md-6">ExpectedCTC</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblexpectedctc" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>--%>
   <%--<div class="form-group">
          
            <asp:Label ID="lblninterviewdate" runat="server" Text="Label" CssClass="col-md-6">Interview Date</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblintrviewdate" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>--%>

      <%--  <div class="form-group">
          
            <asp:Label ID="lblnresume" runat="server" Text="Label" CssClass="col-md-6">Resume</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblresume" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>--%>

   <%-- <div class="form-group">
          
            <asp:Label ID="lblneremark" runat="server" Text="Label" CssClass="col-md-6">Remarks</asp:Label>

            <div class="col-md-6">
                <asp:Textbox ID="txtremark" runat="server" CssClass="form-control"></asp:Textbox>

            </div>
        </div>--%>
        <%-- <div class="form-group">
          
            <asp:Label ID="lblnemail" runat="server" Text="Label" CssClass="col-md-6">Email</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblemail" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>

         <div class="form-group">
          
            <asp:Label ID="lblncontactno" runat="server" Text="Label" CssClass="col-md-6">ContactNo</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblcontactno" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>

        <div class="form-group">
          
            <asp:Label ID="drpnStatus" runat="server" Text="Label" CssClass="col-md-6">Status</asp:Label>

            <div class="col-md-6">
              
                <asp:DropDownList ID="drpStatus" runat="server" CssClass="form-control">
                        <asp:ListItem>Completed</asp:ListItem>
                        <asp:ListItem>Not Completed</asp:ListItem>
                        <asp:ListItem>On Hold</asp:ListItem>
       </asp:DropDownList>

            </div>
        </div>--%>

        <div class="form-group">
          
            <asp:Label ID="lblnVacancyName" runat="server" Text="Label" CssClass="col-md-6">Vacancy Name</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblVacancyName" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>

        <div class="form-group">
          
            <asp:Label ID="lblnCandidateName" runat="server" Text="Label" CssClass="col-md-6">Candidate Name</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblCandidateName" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>

        <div class="form-group">
          
            <asp:Label ID="lblnInterviewDate" runat="server" Text="Label" CssClass="col-md-6">Interview Date</asp:Label>

            <div class="col-md-6">
                <asp:Label ID="lblInterviewDate" runat="server" CssClass="form-control"></asp:Label>

            </div>
        </div>
     
          <div class="form-group">
          
            <asp:Label ID="lblneremark" runat="server" Text="Label" CssClass="col-md-6">Remarks</asp:Label>

            <div class="col-md-6">
                <asp:Textbox ID="txtremark" runat="server" CssClass="form-control"></asp:Textbox>

            </div>
        </div>

           <div class="form-group">
          
            <asp:Label ID="drpnStatus" runat="server" Text="Label" CssClass="col-md-6">Status</asp:Label>

            <div class="col-md-6">
              
                <asp:DropDownList ID="drpStatus" runat="server" CssClass="form-control">
                        <asp:ListItem>Completed</asp:ListItem>
                        <asp:ListItem>Not Completed</asp:ListItem>
                        <asp:ListItem>On Hold</asp:ListItem>
       </asp:DropDownList>

            </div>
        </div>
     
    <asp:Button ID="btnsubmit" runat="server" OnClick="Button2_Click" Text="Submit" class="btn btn-default blu_btn"    />
      
    <asp:Button ID="btnclear" runat="server" OnClick="btnclear_Click" Text="close" class="btn btn-default blu_btn" />
   
</div>
        </div>


