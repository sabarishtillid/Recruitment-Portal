using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using Recruitment_Portal.Classes;
using System;
using System.ComponentModel;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Recruitment_Portal.ScheduleInterview
{
    [ToolboxItemAttribute(false)]
    public partial class ScheduleInterview : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public ScheduleInterview()
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {

           
        }

       
    }
}