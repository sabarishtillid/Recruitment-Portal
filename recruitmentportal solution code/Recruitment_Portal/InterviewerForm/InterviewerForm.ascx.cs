using Microsoft.SharePoint;
using System;
using System.ComponentModel;
using System.Web;
using System.Web.UI.WebControls.WebParts;

namespace recruitmentportal.InterviewerForm
{
    [ToolboxItemAttribute(false)]
    public partial class InterviewerForm : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public InterviewerForm()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SPSecurity.RunWithElevatedPrivileges(delegate()
               {
                   using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                   {
                       using (SPWeb web = site.OpenWeb())
                       {
                           SPList list = web.Lists.TryGetList("ScheduleInterview");
                           
                           string ItemId = HttpContext.Current.Request.QueryString["ItemId"];
                           
                           SPListItem item =list.GetItemById(Convert.ToInt32(ItemId));
                          

                           if (item != null)
                           {
                               lblVacancyName.Text = item["Vacancy"].ToString();
                               lblCandidateName.Text = item["CandidateName"].ToString();
                               lblInterviewDate.Text = item["InterviewDate"].ToString();
                               //lblname.Text = item["CandidateName"].ToString();
                               //lbldomain.Text = item["Domain"].ToString();
                               //lblexperience.Text = item["Experience"].ToString();
                               //lblskillsets.Text = item["SkillSets"].ToString();
                               //lblcurrentctc.Text = item["CurrentCTC"].ToString();
                               //lblexpectedctc.Text = item["ExpectedCTC"].ToString();
                               //lblresume.Text = item["UploadedResume"].ToString();
                               //lblemail.Text = item["Email"].ToString();
                               //lblcontactno.Text = item["ContactNo"].ToString();

                               //lblintrviewdate.Text = item["InterviewDate"].ToString();
                             
                             
                           }

                           string ListTitle = list.Title;
                       }
                   }
               });
            }
            catch (Exception ex)
            {
                lblVacancyName.Text = ex.Message;
            }
        }
            //                string ItemTitle = item.Title;
            //if (!Page.IsPostBack)
            //{
              
            //    lblname.Text = HttpUtility.UrlDecode(Page.Request.QueryString["Name"]);
            //    lbldomain.Text = HttpUtility.UrlDecode(Page.Request.QueryString["Domain"]);
            //    lblexperience.Text = HttpUtility.UrlDecode(Page.Request.QueryString["Experience"]);
            //    lblskillsets.Text = HttpUtility.UrlDecode(Page.Request.QueryString["SkillSets"]);
            //    lblcurrentctc.Text = HttpUtility.UrlDecode(Page.Request.QueryString["CurrentCTC"]);
            //    lblexpectedctc.Text = HttpUtility.UrlDecode(Page.Request.QueryString["ExpectedCTC"]);

            //    lblemail.Text = HttpUtility.UrlDecode(Page.Request.QueryString["Email"]);
            //    lblcontactno.Text = HttpUtility.UrlDecode(Page.Request.QueryString["ContactNo"]);
            //    lblresume.Text = HttpUtility.UrlDecode(Page.Request.QueryString["UploadedResume"]);


            //    lblintrviewdate.Text = HttpUtility.UrlDecode(Page.Request.QueryString["InterviewDate"]);


            //}
        
        public string MainSite = "/Pages/HomePage.aspx";
        protected void Button2_Click(object sender, EventArgs e)
        {


            try
            {
                SPSecurity.RunWithElevatedPrivileges(delegate()
               {
                   using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                   {
                       using (SPWeb web = site.OpenWeb())
                       {
                           SPList list = web.Lists.TryGetList("ScheduleInterview");

                           if (list != null)
                           {
                               SPListItem NewItem = list.Items.Add();
                               {
                                   web.AllowUnsafeUpdates = true;
                                   //NewItem["Remarks"] = txtremark.Text;
                                   //NewItem["Status"] = drpStatus.SelectedItem.ToString();
                                   NewItem.Update();


                                   web.AllowUnsafeUpdates = false;
                                   Page.Response.Redirect(SPContext.Current.Site.Url + MainSite, false);
                               }
                           }
                       }
                   }
               });
            }
            catch (Exception ex)
            {
                //Alert.Text = ex.Message.ToString();
            }
        
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(SPContext.Current.Site.Url + MainSite, false);
        }
    }
}
      

