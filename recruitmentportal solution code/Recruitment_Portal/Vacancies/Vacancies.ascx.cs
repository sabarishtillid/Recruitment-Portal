using Microsoft.SharePoint;
using System;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Recruitment_Portal.Vacancies
{
    [ToolboxItemAttribute(false)]
    public partial class Vacancies : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public Vacancies()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
            ChromeType = PartChromeType.None;
        }
        string MainSite = "/Pages/Vacancies.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    SPSecurity.RunWithElevatedPrivileges(delegate
                    {
                        using (SPSite osite = new SPSite(SPContext.Current.Site.Url))
                        {
                            using (SPWeb oweb = osite.OpenWeb())
                            {

                                // hdnSiteUrl.Value = osite.Url;

                            }
                        }
                    });

                    bindview();
                    newform.Visible = false;
                    oGridView.Columns[0].Visible = false;
                    oGridBlock.Visible = true;


                }
                catch (Exception ex)
                {
                    throw ex;
                }

            }
        }
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
                            SPList list = web.Lists.TryGetList("Vacancies");

                            if (list != null)
                            {
                                SPListItem NewItem = list.Items.Add();
                                {

                                                                     

                                    web.AllowUnsafeUpdates = true;

                                    NewItem["VacancyName"] = txtname.Text;
                                    NewItem["ShortDescription"] = txtshrtdes.Text;
                                    NewItem["Status"] = drpStatus.SelectedItem.ToString();                                                           



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
                TextBox VacancyName = (TextBox)oGridView.Rows[e.RowIndex].Cells[1].FindControl("txtVacancyName");
                TextBox ShortDescription = (TextBox)oGridView.Rows[e.RowIndex].Cells[2].FindControl("txtShortDescription");
                DropDownList Status = (DropDownList)oGridView.Rows[e.RowIndex].Cells[3].FindControl("drpStatus");
                                                      
                SPSecurity.RunWithElevatedPrivileges(delegate()
                {
                    UpdateRow(id.Text,VacancyName.Text, ShortDescription.Text, Status.SelectedValue);
                    oGridView.EditIndex = -1;
                    bindview();
                });
            }
            catch (Exception ex)
            {
                // oException.Exception(ex.Message.ToString(), ex.StackTrace.ToString(), "oGridView_RowUpdating");
            }
        }

        public void UpdateRow(string Id, string VacancyName, string ShortDescription, string Status)
        {
            SPSecurity.RunWithElevatedPrivileges(delegate
            {
                using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                {
                    using (SPWeb web = site.OpenWeb())
                    {
                        SPList list = web.Lists.TryGetList("Vacancies");
                        SPListItem item = list.GetItemById(int.Parse(Id));
                        web.AllowUnsafeUpdates = true;
                        item["VacancyName"] = VacancyName;
                        item["ShortDescription"] = ShortDescription;
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
                        SPList list = web.Lists.TryGetList("Vacancies");
                        SPListItem item = list.GetItemById(int.Parse(ItemId));
                        web.AllowUnsafeUpdates = true;
                        item.Delete();
                        //list.Update();
                        web.AllowUnsafeUpdates = false;
                    }
                }


            });


        }

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
                            SPList list = web.Lists.TryGetList("Vacancies");
                            SPQuery oquery = new SPQuery();
                            // oquery.Query = "<OrderBy><FieldRef Name='ID' Ascending='False' /></OrderBy>";
                            oquery.Query = " <Where><IsNotNull><FieldRef Name='VacancyName' /></IsNotNull></Where><OrderBy><FieldRef Name='Created' Ascending='False' /></OrderBy>";
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
                // oException.Exception(ex.Message.ToString(), ex.StackTrace.ToString(), "bindview()");
            }
        }
        protected void oGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            oGridView.PageIndex = e.NewPageIndex;
            bindview();
        }

        protected void BtnEmployee_Click(object sender, EventArgs e)
        {
            newform.Visible = true;
            BtnEmployee.Visible = false;
            oGridView.Visible = false;



        }
        protected void btnclear_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(SPContext.Current.Site.Url + MainSite, false);
        }

       
    }
}
