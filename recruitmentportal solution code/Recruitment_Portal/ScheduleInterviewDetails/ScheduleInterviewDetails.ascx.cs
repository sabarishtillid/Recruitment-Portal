using Microsoft.SharePoint;
using System;
using System.ComponentModel;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Recruitment_Portal.ScheduleInterviewDetails
{
    [ToolboxItemAttribute(false)]
    public partial class ScheduleInterviewDetails : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public ScheduleInterviewDetails()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
            ChromeType = PartChromeType.None;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                try
                {


                    bindview();



                }
                catch (Exception ex)
                {
                    throw ex;
                }

            }
        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        SPSecurity.RunWithElevatedPrivileges(delegate()
        //        {
        //            using (SPSite site = new SPSite(SPContext.Current.Web.Url))
        //            {
        //                using (SPWeb web = site.OpenWeb())
        //                {
        //                    SPList list = web.Lists.TryGetList("ScheduleInterview");

        //                    if (list != null)
        //                    {
        //                        SPListItem NewItem = list.Items.Add();
        //                        {

        //                            web.AllowUnsafeUpdates = true;


        //                            string clientname = lookup(txtName.SelectedValue);
        //                            NewItem["CandidateName"] = new SPFieldLookupValue(Convert.ToInt32(clientname), txtName.SelectedValue.ToString());



        //                            //NewItem["CandidateName"] = txtName.SelectedItem.ToString();


        //                            int Interviewer = spPeoplePickerUserName.ResolvedEntities.Count;

        //                            for (int i = 0; i < Interviewer; i++)
        //                            {

        //                                PickerEntity peEntity = spPeoplePickerUserName.ResolvedEntities[i] as PickerEntity;

        //                                SPUser user = SPContext.Current.Web.EnsureUser(peEntity.Key);

        //                                NewItem["Interviewer"] = user.Name;
        //                            }



        //                            // Datetime Control

        //                            if (!DateTimeControl1.IsDateEmpty)
        //                            {
        //                                NewItem["InterviewDate"] = Convert.ToDateTime(DateTimeControl1.SelectedDate).ToShortDateString();



        //                            }
        //                            else
        //                            {
        //                                NewItem["InterviewDate"] = DateTime.Now;


        //                            }
        //                            NewItem["Remarks"] = txtRemarks.Text;
        //                            NewItem["Status"] = drpStatus.SelectedValue.ToString();

        //                            NewItem.Update();


        //                            web.AllowUnsafeUpdates = false;

        //                            Page.Response.Redirect(SPContext.Current.Site.Url + MainSite, false);

        //                        }
        //                    }
        //                }
        //            }
        //        });



        //    }

        //    catch (Exception ex)
        //    {
        //        //Alert.Text = ex.Message.ToString();
        //    }
        //}

        //public string lookup(string title)
        //{
        //    string value = null;
        //    using (SPSite osite = new SPSite(SPContext.Current.Site.Url))
        //    {
        //        using (SPWeb oweb = osite.OpenWeb())
        //        {
        //            SPList olist = oweb.Lists.TryGetList("Candidates");
        //            SPQuery oquery = new SPQuery();
        //            oquery.Query = "<Where><Eq><FieldRef Name='CandidateName' /><Value Type='Text'>" + title + "</Value></Eq></Where><ViewFields><FieldRef Name='ID' /></ViewFields>";
        //            SPListItemCollection ocollection = olist.GetItems(oquery);
        //            if (ocollection != null)
        //            {
        //                foreach (SPListItem oitem in ocollection)
        //                {
        //                    value = oitem["ID"].ToString();
        //                }
        //            }
        //            return value; // ddlEmpType.Items.Insert(0, "--Select--");
        //        }
        //    }
        //}

        //public void ProjectType(DropDownList txtName)
        //{
        //    using (SPSite osite = new SPSite(SPContext.Current.Site.Url))
        //    {
        //        using (SPWeb oweb = osite.OpenWeb())
        //        {
        //            SPList olist = oweb.Lists.TryGetList("Candidates");
        //            SPQuery oquery = new SPQuery();
        //            oquery.Query = "<Query><Where><Eq><FieldRef Name='CandidateName' /></Eq></Where></Query>";
        //            SPListItemCollection ocollection = olist.GetItems(oquery);
        //            foreach (SPListItem oitem in ocollection)
        //            {
        //                txtName.Items.Add(oitem["CandidateName"].ToString());
        //            }
        //            //ddlClient.Items.Insert(0, "None");
        //        }
        //    }
        //}

        public void bindview()
        {
            try
            {
                SPSecurity.RunWithElevatedPrivileges(delegate
                {

                    using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                    {
                        using (SPWeb web = site.OpenWeb())
                        {
                            web.AllowUnsafeUpdates = true;
                            SPList list = web.Lists.TryGetList("ScheduleInterview");
                            SPQuery oquery = new SPQuery();
                            // oquery.Query = "<OrderBy><FieldRef Name='ID' Ascending='False' /></OrderBy>";
                            oquery.Query = " <Where><IsNotNull><FieldRef Name='CandidateName' /></IsNotNull></Where><OrderBy><FieldRef Name='Created' Ascending='False' /></OrderBy>";
                            SPListItemCollection coll = list.GetItems(oquery);
                            DataTable dt = coll.GetDataTable();
                            if (dt.Rows.Count > 0)
                            {
                                oGridView.DataSource = dt;
                                oGridView.DataBind();
                            }
                            web.AllowUnsafeUpdates = false;
                        }
                    }

                });

            }
            catch (Exception ex)
            {
                //oException.Exception(ex.Message.ToString(), ex.StackTrace.ToString(), "bindview()");
            }
        }
        protected void oGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            oGridView.PageIndex = e.NewPageIndex;
            bindview();
        }
        protected void BtnEmployee_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(SPContext.Current.Site.Url + "/Pages/ScheduleInterview.aspx", false);


        }
        protected void oGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            oGridView.EditIndex = -1;
            bindview();
        }

        protected void oGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            oGridView.EditIndex = e.NewEditIndex;
            bindview();
        }

        protected void oGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Label id = (Label)oGridView.Rows[e.RowIndex].Cells[0].FindControl("lblID");
                DropDownList CandidateName = (DropDownList)oGridView.Rows[e.RowIndex].Cells[1].FindControl("txtnName");
                Label InterviewDate = (Label)oGridView.Rows[e.RowIndex].Cells[2].FindControl("lblnDate");
                Label Interviewer = (Label)oGridView.Rows[e.RowIndex].Cells[3].FindControl("lblnInterviewer");
                Label Remarks = (Label)oGridView.Rows[e.RowIndex].Cells[4].FindControl("lblnRemarks");
                DropDownList Status = (DropDownList)oGridView.Rows[e.RowIndex].Cells[5].FindControl("drpnStatus");


                SPSecurity.RunWithElevatedPrivileges(delegate()
                {
                    UpdateRow(id.Text, CandidateName.SelectedValue, InterviewDate.Text, Interviewer.Text, Remarks.Text, Status.SelectedValue);
                    oGridView.EditIndex = -1;
                    bindview();
                });
            }
            catch (Exception ex)
            {
                // oException.Exception(ex.Message.ToString(), ex.StackTrace.ToString(), "oGridView_RowUpdating");
            }
        }

        public void UpdateRow(string Id, string Name, string InterviewDate, string Interviewer, string Remarks, string Status)
        {
            SPSecurity.RunWithElevatedPrivileges(delegate
            {
                using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                {
                    using (SPWeb web = site.OpenWeb())
                    {
                        SPList list = web.Lists.TryGetList("ScheduleInterview");
                        SPListItem item = list.GetItemById(int.Parse(Id));
                        web.AllowUnsafeUpdates = true;
                        item["CandidateName"] = Name;
                        //item["InterviewDate"] = InterviewDate;
                        //item["Interviewer"] = Interviewer;
                        item["Status"] = Status;
                        item.Update();
                        Page.Response.Redirect("", false);
                        // list.Update();
                        web.AllowUnsafeUpdates = false;


                    }
                }

            });

        }



        protected void oGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string itemId;
            try
            {
                itemId = oGridView.DataKeys[e.RowIndex].Value.ToString();
                SPSecurity.RunWithElevatedPrivileges(delegate()
                {
                    DeleteRow(itemId);
                    bindview();
                });
            }
            catch (Exception ex)
            {
                //oException.Exception(ex.Message.ToString(), ex.StackTrace.ToString(), "UpdateRow");
            }


        }
        public void DeleteRow(string ItemId)
        {
            SPSecurity.RunWithElevatedPrivileges(delegate
            {
                using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                {
                    using (SPWeb web = site.OpenWeb())
                    {
                        SPList list = web.Lists.TryGetList("ScheduleInterview");
                        SPListItem item = list.GetItemById(int.Parse(ItemId));
                        web.AllowUnsafeUpdates = true;
                        item.Delete();
                        //list.Update();
                        web.AllowUnsafeUpdates = false;
                    }
                }


            });


        }


        protected void oGridView_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {


                    using (SPSite site = new SPSite(SPContext.Current.Site.Url))
                    {
                        using (SPWeb web = site.OpenWeb())
                        {

                            SPList list = web.Lists["Candidates"];
                            SPListItemCollection items = list.GetItems();
                            SPQuery query = new SPQuery();
                            query.Query = "<OrderBy><FieldRef Name='ID' /></OrderBy>";
                            SPListItemCollection myColl = list.GetItems(query);
                            DropDownList empcustom = (DropDownList)e.Row.FindControl("txtnName");
                            if (myColl.Count > 0)
                            {
                                empcustom.DataValueField = "ID";
                                empcustom.DataTextField = "CandidateName";
                                empcustom.DataSource = myColl.GetDataTable();
                                empcustom.DataBind();
                            }
                            int strItemID = int.Parse(oGridView.DataKeys[e.Row.RowIndex].Value.ToString());
                            SPList lstGlobalClients = web.Lists["ScheduleInterview"];
                            SPQuery strFindLookUpValue = new SPQuery();
                            strFindLookUpValue.Query = "<Where><Eq><FieldRef Name='CandidateName' /><Value Type='Lookup'>" + strItemID + "</Value></Eq></Where>";
                            SPListItemCollection GlobalClientsColl = lstGlobalClients.GetItems(strFindLookUpValue);
                            if (GlobalClientsColl.Count > 0)
                            {
                                SPListItem item = GlobalClientsColl[0];
                                SPFieldLookupValue value = new SPFieldLookupValue(item["ID"].ToString());
                                for (int i = 0; i < empcustom.Items.Count; i++)
                                {
                                    if (value.LookupId.ToString() == empcustom.Items[i].Value)
                                    {
                                        empcustom.SelectedIndex = i;
                                        break;
                                    }
                                }
                            }


                        }
                    }

                }
            }
        }
    }
}
