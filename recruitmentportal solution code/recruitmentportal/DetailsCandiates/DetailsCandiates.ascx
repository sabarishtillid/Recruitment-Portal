<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailsCandiates.ascx.cs" Inherits="Detailscandiates.DetailsCandiates.DetailsCandiates" %>
<table>
   <tr>
        <td>
            <b>Id</b>
        </td>
        <td>
            <asp:Label ID="lblId" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>Name :</b>
        </td>
        <td>
            <asp:Label ID="lblName" runat="server"></asp:Label>
        </td>
    </tr>
       <tr>
        <td>
            <b>Domain :</b>
        </td>
        <td>
            <asp:Label ID="lblDomain" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>Experience :</b>
        </td>
        <td>
            <asp:Label ID="lblExperience" runat="server"></asp:Label>
        </td>
    </tr>
     <tr>
        <td>
            <b>SkillSets :</b>
        </td>
        <td>
            <asp:Label ID="lblSkillSets" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>Current CTC :</b>
        </td>
        <td>
            <asp:Label ID="lblCurrentCTC" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>ExpectedCTC :</b>
        </td>
        <td>
            <asp:Label ID="lblExpectedCTC" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>Remarks by Interviewer :</b>
        </td>
        <td>
            <asp:Label ID="lblRemarks" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>Email :</b>
        </td>
        <td>
            <asp:Label ID="lblEmail" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>Contact No :</b>
        </td>
        <td>
            <asp:Label ID="lblContactNo" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>Uploaded Resume :</b>
        </td>
        <td>
            <asp:Label ID="lblUploadedResume" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>Interviewer :</b>
        </td>
        <td>
            <asp:Label ID="lblInterviewer" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>Status :</b>
        </td>
        <td>
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <b>Interview Date :</b>
        </td>
        <td>
            <asp:Label ID="lblInterviewDate" runat="server"></asp:Label>
        </td>
    </tr>

</table>