using System;
using System.ComponentModel;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using System;
using System.ComponentModel;
using System.IO;
using System.Web.UI.WebControls.WebParts;
using System.Web;
using Microsoft.SharePoint.WebControls;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.SharePoint.Utilities;
using System.Web.UI;
using System.Text;

namespace Detailscandiates.DetailsCandiates
{
    [ToolboxItemAttribute(false)]
    public partial class DetailsCandiates : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public DetailsCandiates()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
            ChromeType = PartChromeType.None;
        }
        string MainSite = "/Pages/Candidates.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               
                lblname.Text = HttpUtility.UrlDecode(Page.Request.QueryString["CandidateName"]);
                lbldomain.Text = HttpUtility.UrlDecode(Page.Request.QueryString["Domain"]);
                lblexperience.Text = HttpUtility.UrlDecode(Page.Request.QueryString["Experience"]);
                lblskillset.Text = HttpUtility.UrlDecode(Page.Request.QueryString["SkillSets"]);
                lblcurrentctc.Text = HttpUtility.UrlDecode(Page.Request.QueryString["CurrentCTC"]);
                lblexpectedctc.Text = HttpUtility.UrlDecode(Page.Request.QueryString["ExpectedCTC"]);
                lblemail.Text = HttpUtility.UrlDecode(Page.Request.QueryString["Email"]);
                lblcontactno.Text = HttpUtility.UrlDecode(Page.Request.QueryString["ContactNo"]);
                lblresume.Text = HttpUtility.UrlDecode(Page.Request.QueryString["UploadedResume"]);
                lblSource.Text = HttpUtility.UrlDecode(Page.Request.QueryString["Source"]);
                lblNoticeperiod.Text = HttpUtility.UrlDecode(Page.Request.QueryString["NoticePeriod"]);
                
               
                
            }
        }

        protected void btnclear_Click(object sender, System.EventArgs e)
        {
            Page.Response.Redirect(SPContext.Current.Site.Url + MainSite, false);
        }
    }
}
