using Microsoft.SharePoint;
using Recruitment_Portal.Classes;
using System;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Recruitment_Portal.CandidatesList
{
    [ToolboxItemAttribute(false)]
    public partial class CandidatesList : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public CandidatesList()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
            ChromeType = PartChromeType.None;
        }
        string MainSite = "/Pages/Candidates.aspx";

        Lookup ls = new Lookup();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ls.Employment(DropDownList1);
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
                            SPList list = web.Lists.TryGetList("Candidates");

                            if (list != null)
                            {
                                SPListItem NewItem = list.Items.Add();
                                {                                                                   

                                    SPDocumentLibrary documentLib = web.Lists["Resumes"] as SPDocumentLibrary;

                                    Stream fStream = FileUpload1.PostedFile.InputStream;
                                    byte[] _byteArray = new byte[fStream.Length];
                                    fStream.Read(_byteArray, 0, (int)fStream.Length);
                                    fStream.Close();

                                    web.AllowUnsafeUpdates = true;

                                    string filepath = FileUpload1.FileName.Split(',')[0];
                                    string _fileUrl = documentLib.RootFolder.Url + "/" + FileUpload1.FileName;
                                    string candidateResumeLink = documentLib.RootFolder.ServerRelativeUrl + "/" + FileUpload1.FileName;

                                    bool IsOverwriteFile = true;
                                    SPFile file = documentLib.RootFolder.Files.Add(_fileUrl, _byteArray, IsOverwriteFile);

                                    SPListItem item = file.Item;
                                    item["Title"] = FileUpload1.FileName.Split('.')[0];
                                    item["Name"] = FileUpload1.FileName;
                                    item.Update();
                                    file.Update();
                                                                       
                                    string clientname = lookup(DropDownList1.SelectedValue);
                                    NewItem["VacancyName"] = new SPFieldLookupValue(Convert.ToInt32(clientname), DropDownList1.SelectedValue.ToString());

                                    NewItem["CandidateName"] = txtname.Text;
                                    NewItem["Domain"] = drpdomain.SelectedItem.ToString();
                                    NewItem["Experience"] = txtexperience.Text;
                                    NewItem["SkillSets"] = txtskillset.Text;
                                    NewItem["CurrentCTC"] = txtcrtctc.Text;
                                    NewItem["ExpectedCTC"] = txtexctc.Text;
                                    NewItem["Email"] = txtemail.Text;
                                    NewItem["ContactNo"] = txtcontact.Text;
                                    NewItem["UploadedResume"] = FileUpload1.FileName;
                                    NewItem["Source"] = txtSource.Text;
                                    NewItem["NoticePeriod"] = txtNotice.Text;
                                   


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
                Label VacancyName = (Label)oGridView.Rows[e.RowIndex].Cells[1].FindControl("txtnVacancy");
                TextBox Name = (TextBox)oGridView.Rows[e.RowIndex].Cells[2].FindControl("txtname");
                DropDownList Domain = (DropDownList)oGridView.Rows[e.RowIndex].Cells[3].FindControl("drpdomain");
                TextBox Experience = (TextBox)oGridView.Rows[e.RowIndex].Cells[4].FindControl("txtexperience");
                TextBox SkillSets = (TextBox)oGridView.Rows[e.RowIndex].Cells[5].FindControl("txtskillset");
               // TextBox CurrentCTC = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtcrtctc");
                //TextBox ExpectedCTC = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtexctc");
                TextBox Email = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtemail");
                TextBox ContactNo = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtcontact");

                if (oGridView.EditIndex == -1) return;
                FileUpload UploadedResume = (FileUpload)oGridView.Rows[e.RowIndex].Cells[6].FindControl("FileUpload2") as FileUpload;
                string fileName = UploadedResume.FileName;
                //string fullPath = Path.GetFullPath(fileName);
                //UploadedResume.SaveAs(fullPath); 


                TextBox Source = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtSource");

                TextBox NoticePeriod = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtNotice");
              



                SPSecurity.RunWithElevatedPrivileges(delegate()
                {
                    UpdateRow(id.Text, VacancyName.Text,Name.Text, Domain.SelectedValue, Experience.Text, SkillSets.Text,  Email.Text, ContactNo.Text, UploadedResume.FileName, Source.Text, NoticePeriod.Text);
                    oGridView.EditIndex = -1;
                    bindview();
                });
            }
            catch (Exception ex)
            {
                // oException.Exception(ex.Message.ToString(), ex.StackTrace.ToString(), "oGridView_RowUpdating");
            }
        }

        

        public void UpdateRow(string Id,string VacancyName,string Name, string Domain, string Experience, string SkillSets, string Email, string ContactNo, string UploadedResume, string Source, string NoticePeriod)
        {
            SPSecurity.RunWithElevatedPrivileges(delegate
            {
                using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                {
                    using (SPWeb web = site.OpenWeb())
                    {
                        SPList list = web.Lists.TryGetList("Candidates");
                        SPListItem item = list.GetItemById(int.Parse(Id));
                        web.AllowUnsafeUpdates = true;
                       // item["VacancyName"] = VacancyName;
                        item["Name"] = Name;
                        item["Domain"] = Domain;
                        item["Experience"] = Experience;
                        item["SkillSets"] = SkillSets;
                       

                        item["Email"] = Email;
                        item["ContactNo"] = ContactNo;
                        item["UploadedResume"] = UploadedResume;


                        item["Source"] = Source;
                        item["NoticePeriod"] = NoticePeriod;
                    

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
                        SPList list = web.Lists.TryGetList("Candidates");
                        SPListItem item = list.GetItemById(int.Parse(ItemId));
                        web.AllowUnsafeUpdates = true;
                        item.Delete();
                        //list.Update();
                        web.AllowUnsafeUpdates = false;
                    }
                }


            });


        }

        public string lookup(string title)
        {
            string value = null;
            using (SPSite osite = new SPSite(SPContext.Current.Site.Url))
            {
                using (SPWeb oweb = osite.OpenWeb())
                {
                   
                    SPList olist = oweb.Lists.TryGetList("Vacancies");
                    SPQuery oquery = new SPQuery();
                    oquery.Query = "<Where><Eq><FieldRef Name='VacancyName' /><Value Type='Text'>" + title + "</Value></Eq></Where><ViewFields><FieldRef Name='ID' /></ViewFields>";                   
                    SPListItemCollection ocollection = olist.GetItems(oquery);
                    if (ocollection != null)
                    {
                        foreach (SPListItem oitem in ocollection)
                        {
                            value = oitem["ID"].ToString();
                        }
                    }
                    return value; // ddlEmpType.Items.Insert(0, "--Select--");
                   
                }
            }
        }

        public void ProjectType(DropDownList txtName)
        {
            using (SPSite osite = new SPSite(SPContext.Current.Site.Url))
            {
                using (SPWeb oweb = osite.OpenWeb())
                {
                   
                    SPList olist = oweb.Lists.TryGetList("Vacancies");
                    SPQuery oquery = new SPQuery();
                    oquery.Query = "<Query><Where><Eq><FieldRef Name='VacancyName' /></Eq></Where></Query>";                 
                    //oquery.Query = "<Where><Eq><FieldRef Name='Status' /><Value Type='Text'>Active</Value></Eq></Where>";
                    SPListItemCollection ocollection = olist.GetItems(oquery);
                    foreach (SPListItem oitem in ocollection)
                    {
                        txtName.Items.Add(oitem["VacancyName"].ToString());
                    }
                    //ddlClient.Items.Insert(0, "None");
                   
                }
            }
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
                            SPList list = web.Lists.TryGetList("Candidates");
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
        protected void DownloadFile(object sender, EventArgs e)
        {

            string downloadvalue = string.Empty;
            LinkButton lnkDownload = (LinkButton)sender;
            downloadvalue = lnkDownload.Text;
            DownloadDetails(downloadvalue);

            //string filePath = (sender as LinkButton).CommandArgument;
            //Page.Response.ContentType = "application/octet-stream";
            //Page.Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            //Page.Response.WriteFile(filePath);
            //Page.Response.End();
        }
        public void DownloadDetails(string value)
        {
            try
            {
                SPSecurity.RunWithElevatedPrivileges(delegate
                {

                    using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                    {
                        using (SPWeb web = site.OpenWeb())
                        {
                            SPList currentLib = web.Lists["Resumes"];
                            SPQuery qry = new SPQuery();
                            qry.Query = @"   <Where>
                                  <Eq>
                                     <FieldRef Name='FileLeafRef' />
                                     <Value Type='File'>" + value + @"</Value>
                                  </Eq>
                               </Where>";
                            SPListItemCollection items = currentLib.GetItems(qry);

                            foreach (SPListItem item in items)
                            {
                                byte[] binfile = item.File.OpenBinary();
                                FileStream fstream = new FileStream("C:\\" + item.File.Name, FileMode.Create, FileAccess.ReadWrite);
                                fstream.Write(binfile, 0, binfile.Length);
                                fstream.Close();

                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
            }
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

                            SPList list = web.Lists["Vacancies"];
                            SPListItemCollection items = list.GetItems();
                            SPQuery query = new SPQuery();
                            query.Query = "<OrderBy><FieldRef Name='ID' /></OrderBy>";
                            SPListItemCollection myColl = list.GetItems(query);
                            DropDownList empcustom = (DropDownList)e.Row.FindControl("txtnVacancy");
                            if (myColl.Count > 0)
                            {
                                empcustom.DataValueField = "ID";
                                empcustom.DataTextField = "VacancyName";
                                empcustom.DataSource = myColl.GetDataTable();
                                empcustom.DataBind();
                            }
                            int strItemID = int.Parse(oGridView.DataKeys[e.Row.RowIndex].Value.ToString());
                            SPList lstGlobalClients = web.Lists["Candidates"];
                            SPQuery strFindLookUpValue = new SPQuery();
                            strFindLookUpValue.Query = "<Where><Eq><FieldRef Name='VacancyName' /><Value Type='Lookup'>" + strItemID + "</Value></Eq></Where>";
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
