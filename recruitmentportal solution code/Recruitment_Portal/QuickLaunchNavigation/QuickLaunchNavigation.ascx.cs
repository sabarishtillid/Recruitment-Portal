using Microsoft.SharePoint;
using Microsoft.SharePoint.Taxonomy;
using System;
using System.ComponentModel;
using System.Web.UI.WebControls.WebParts;

namespace Recruitment_Portal.QuickLaunchNavigation
{
    [ToolboxItemAttribute(false)]
    public partial class QuickLaunchNavigation : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public QuickLaunchNavigation()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lrtlnavigation.Text = Navigate();
        }
        private string Navigate()
        {
            string result = string.Empty;
            try
            {
                using (SPSite oSPSite = new SPSite(SPContext.Current.Site.Url))
                {
                    using (SPWeb oSPWeb = oSPSite.OpenWeb())
                    {
                       
                        // SPSite site = SPContext.Current.Site;
                        {

                            TaxonomySession taxonomySession = new TaxonomySession(oSPSite);
                            TermStore taxStore = taxonomySession.TermStores[0];
                            Group taxGroup = taxStore.GetSiteCollectionGroup(oSPSite);
                            TermSet ts = taxGroup.TermSets["RecruitmentPortal"];
                            TermCollection termCollection = ts.Terms;


                            result += "<div class='col-md-3 top-buffer'>";
                            result += "<ul id='MainMenu' class='list-group'>";




                            foreach (Term oterm in termCollection)
                            {
                                string otermLink = oterm.CustomProperties.ContainsKey("Url") ? oterm.CustomProperties["Url"].ToString() : string.Empty;

                                if (oterm.TermsCount > 0)
                                {
                                    TermCollection oTermColl = oterm.Terms;


                                    result += "<li class='list-group-item'>";
                                    result += "<a href='#menu1' data-toggle='collapse' data-parent='#MainMenu' class='' aria-expanded='true'>" + oterm.Name + "<i class='fa fa-caret-down'> </i> </a>";
                                    result += "<ul class='collapse' id='menu1' aria-expanded='true' >";





                                    foreach (Term oterm1 in oTermColl)
                                    {
                                        string oterm1Link = oterm1.CustomProperties.ContainsKey("Url") ? oterm1.CustomProperties["Url"].ToString() : string.Empty;


                                        if (oterm1.TermsCount > 0)
                                        {
                                            TermCollection iTermColl = oterm1.Terms;

                                            result += " <li class='list-group-item'>";
                                            result += "    <a href='#subterms1' data-toggle='collapse' data-parent='#MainMenu' class='' aria-expanded='true'>" + oterm1.Name + " <i class='fa fa-caret-down'> </i> </a>";
                                            result += "   <ul class='collapse in' id='subterms1' aria-expanded='true'>";

                                            foreach (Term oterm2 in iTermColl)
                                            {
                                                string oterm2Link = oterm2.CustomProperties.ContainsKey("Url") ? oterm2.CustomProperties["Url"].ToString() : string.Empty;

                                                result += "<li class='list-group-item'><a href='" + oterm2Link + "'>" + oterm2.Name + "</a></li> ";



                                            }
                                            result += "</ul>";
                                        }
                                        else
                                        {
                                            result += "<li class='list-group-item'><a href='" + oterm1Link + "'>" + oterm1.Name + "</a></li>";
                                        }

                                    }
                                    result += "</ul>";
                                }
                                else
                                {
                                    result += "<li class='list-group-item'><a href='" + otermLink + "'>" + oterm.Name + "</a></li>";
                                }
                            }

                            result += "</ul>";

                        }
                       
                    }
                }
            }
            catch (Exception ex)
            {

            }


            return result;
           
        }
    }
}
