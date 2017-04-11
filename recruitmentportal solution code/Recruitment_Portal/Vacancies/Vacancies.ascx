<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Vacancies.ascx.cs" Inherits="Recruitment_Portal.Vacancies.Vacancies" %>
<div id="newform" runat="server">

<div class="col-md-9 inner_cont">
    <div class="form-horizontal submt_form top-buffer">
        <div class="form-group">
          
            <asp:Label ID="LabelName" runat="server" Text="Label" CssClass="col-md-6">Vacancy Name</asp:Label>

            <div class="col-md-6">
                <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
        </div>
 

<div class="form-group">
    <asp:Label ID="Labelshrtdes" runat="server" Text="Label" CssClass="col-md-6">Short Description</asp:Label>
    <div class="col-md-6">
        <asp:TextBox ID="txtshrtdes" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>

        <div class="form-group">
    <asp:Label ID="LabelStatus" runat="server" CssClass="col-md-6">Status</asp:Label>
    <div class="col-md-6">
        <asp:DropDownList ID="drpStatus" runat="server" CssClass="form-control">
            <asp:ListItem>Please select the Status</asp:ListItem>
            <asp:ListItem>Active</asp:ListItem>
            <asp:ListItem>Closed</asp:ListItem>
            
        </asp:DropDownList>
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








<asp:Button ID="BtnEmployee" runat="server" Text="Create New Vacancy " OnClick="BtnEmployee_Click" class="btn btn-default blu_btn" />
<br />
<br />

<div class="table-responsive RecruitmentTable" id="oGridBlock" runat="server">

    <asp:GridView ID="oGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowCancelingEdit="oGridView_RowCancelingEdit" AllowPaging="true" OnPageIndexChanging="oGridView_PageIndexChanging" 
        OnRowEditing="oGridView_RowEditing" OnRowUpdating="oGridView_RowUpdating" OnRowDeleting="oGridView_RowDeleting" CellPadding="5" ForeColor="#284775"  AllowSorting="True" CaptionAlign="Top" CssClass="table lats_submsn">

        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" VerticalAlign="Middle" />

        <Columns>
             <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblnID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>                     
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Vacancy Name" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>                    
                 <asp:TextBox ID="txtVacancyName" runat="server" Text='<%# Bind("VacancyName") %>' width="125px" ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblnVacancyName" runat="server" Text='<%# Bind("VacancyName") %>'></asp:Label>                     
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Short Description" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtShortDescription" runat="server" Text='<%# Bind("ShortDescription") %>' width="125px" ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblShortDescription" runat="server" Text='<%# Bind("ShortDescription") %>'></asp:Label>                   
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

          
            <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:DropDownList ID="drpStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Closed</asp:ListItem>
                       
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbldomain" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>
             
             
          

           

            


                       
            <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Left" ShowHeader="false" ControlStyle-Width="50px">
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkUdpate" runat="server" Text="Update" CausesValidation="true" CommandName="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CausesValidation="true" CommandName="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server"  CssClass="glyphicon glyphicon-edit" CausesValidation="true" CommandName="Edit"></asp:LinkButton>
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