<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
	<SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server"/>
	<PublishingWebControls:EditModePanel runat="server">
		<!-- Styles for edit mode only-->
		<SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/editmode15.css %>"
			After="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server"/>
	</PublishingWebControls:EditModePanel>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePointWebControls:ListProperty Property="Title" runat="server"/> - 
	<SharePointWebControls:FieldValue FieldName="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server">
	<WebPartPages:SPProxyWebPartManager runat="server" id="spproxywebpartmanager"></WebPartPages:SPProxyWebPartManager>	
	<SharePointWebControls:FieldValue FieldName="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderTitleBreadcrumb" runat="server"> 
	<SharePointWebControls:ListSiteMapPath runat="server" SiteMapProviders="CurrentNavigationSwitchableProvider" RenderCurrentNodeAsLink="false" PathSeparator="" CssClass="s4-breadcrumb" NodeStyle-CssClass="s4-breadcrumbNode" CurrentNodeStyle-CssClass="s4-breadcrumbCurrentNode" RootNodeStyle-CssClass="s4-breadcrumbRootNode" NodeImageOffsetX=0 NodeImageOffsetY=289 NodeImageWidth=16 NodeImageHeight=16 NodeImageUrl="/_layouts/15/images/fgimg.png?rev=23" HideInteriorRootNodes="true" SkipLinkText=""/> </asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageDescription" runat="server">
	<SharePointWebControls:ProjectProperty Property="Description" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderBodyRightMargin" runat="server">
	
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
	
	

					<div class="row">
						<div class="col-md-8">
							<div class="wpLatestSub">
							<WebPartPages:WebPartZone class="wpLatestSub" id="latestSchedule" runat="server" title="Latest Schedule"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
							</div>
							

							<div class="wpNewsfeed">
							<WebPartPages:WebPartZone id="newsFeed" runat="server" title="News Feed"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
							</div>
							

						</div>
						<div class="col-md-4 right_cont">
							
							<div class="row">
								<div class="col-md-12 top-buffer trdng_ides wpTrending">
									<WebPartPages:WebPartZone id="Recentlyclosed" runat="server" title="TRecently Closed"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>																
								<div class="clear"></div>
									<div class="inner_rit text-right wpTrendingViewAll">
										
										<span class="view_all"><a href="#">View 
										All</a></span>
									</div>

								</div>
							</div>
							<div class="row">
								<div class="col-md-12 top-buffer app_week wpAppWeek">
									
									<WebPartPages:WebPartZone id="Scheduledtoday" runat="server" title="SCHEDULED TODAY"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>																
									<div class="clear"></div>
									<div class="inner_rit text-right wpAppViewAll">
										
										<hr>
										<span class="view_all"><a href="#">View 
										All</a></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 top-buffer imp_dates wpImportantDates">
									<WebPartPages:WebPartZone id="upcomingInterviews" runat="server" title="UPCOMING SCHEDULED INTERVIEWS"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>																
								</div>
							</div>
						
					</div>
				
	</div>
	
</asp:Content>
