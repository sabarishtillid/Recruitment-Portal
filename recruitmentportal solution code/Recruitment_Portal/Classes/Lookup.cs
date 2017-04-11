using Microsoft.SharePoint;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Recruitment_Portal.Classes
{
    class Lookup
    {
        string oEmployment = "Candidates";
        string Employments = "Vacancies";

        public void EmploymentType(DropDownList ddlClients)
        {
            using (SPSite osite = new SPSite(SPContext.Current.Site.Url))
            {
                using (SPWeb oweb = osite.OpenWeb())
                {
                    SPList olist = oweb.Lists.TryGetList(oEmployment);
                    SPQuery oquery = new SPQuery();
                    oquery.Query = "<Query><Where><Eq><FieldRef Name='CandidateName' /></Eq></Where></Query>";
                    SPListItemCollection ocollection = olist.GetItems(oquery);
                    foreach (SPListItem oitem in ocollection)
                    {
                        ddlClients.Items.Add(oitem["CandidateName"].ToString());
                    }
                    //ddlClient.Items.Insert(0, "None");
                }
            }
        }

        public void Employment(DropDownList ddlClients)
        {
            using (SPSite osite = new SPSite(SPContext.Current.Site.Url))
            {
                using (SPWeb oweb = osite.OpenWeb())
                {
                    SPList olist = oweb.Lists.TryGetList(Employments);
                    SPQuery oquery = new SPQuery();
                    oquery.Query = "<Where><Eq><FieldRef Name='Status'/><Value Type='Text'>Active</Value></Eq></Where>";
                    SPListItemCollection ocollection = olist.GetItems(oquery);
                    foreach (SPListItem oitem in ocollection)
                    {
                        ddlClients.Items.Add(oitem["VacancyName"].ToString());
                    }
                    //ddlClient.Items.Insert(0, "None");
                }
            }
        }
    }
}
