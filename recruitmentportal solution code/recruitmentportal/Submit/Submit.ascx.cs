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
using Microsoft.Web.Hosting.Administration;
using System.Net;


namespace recruitmentportal.Submit
{
    [ToolboxItemAttribute(false)]
    public partial class Submit : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public Submit()
        {

        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
            ChromeType = PartChromeType.None;


        }
        string MainSite = "/Pages/HomePage.aspx";
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

                                //hdnSiteUrl.Value = osite.Url;

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
                           SPList list = web.Lists.TryGetList("CandidateDetails");

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

                                   NewItem["Name"] = txtname.Text;
                                   NewItem["Domain"] = drpdomain.SelectedItem.ToString();
                                   NewItem["Experience"] = txtexperience.Text;
                                   NewItem["SkillSets"] = txtskillset.Text;
                                   NewItem["CurrentCTC"] = txtcrtctc.Text;
                                   NewItem["ExpectedCTC"] = txtexctc.Text;

                                   //People Picker

                                   int Interviewer = spPeoplePickerUserName.ResolvedEntities.Count;

                                   for (int i = 0; i < Interviewer; i++)
                                   {

                                       PickerEntity peEntity = spPeoplePickerUserName.ResolvedEntities[i] as PickerEntity;

                                       SPUser user = SPContext.Current.Web.EnsureUser(peEntity.Key);

                                       NewItem["Interviewer"] = user;
                                   }

                                   //NewItem["Interviewer"] = user.Name;

                                   // Datetime Control

                                   if (!DateTimeControl1.IsDateEmpty)
                                   {
                                       NewItem["InterviewDate"] = Convert.ToDateTime(DateTimeControl1.SelectedDate);
                                   }
                                   else
                                   {
                                       NewItem["InterviewDate"] = DateTime.Now;
                                   }

                                   NewItem["Remarks"] = txtremark.Text;
                                   NewItem["Email"] = txtemail.Text;
                                   NewItem["ContactNo"] = txtcontact.Text;
                                   NewItem["UploadedResume"] = FileUpload1.FileName;
                                   NewItem["Status"] = drpStatus.SelectedItem.ToString();


                                   NewItem.Update();


                                   web.AllowUnsafeUpdates = false;
                                   Page.Response.Redirect(SPContext.Current.Site.Url + MainSite, false);

                                   //    }
                                   //}
                                   //else
                                   //{
                                   //    Alert.Text = "List not found";
                                   //}



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
                TextBox Name = (TextBox)oGridView.Rows[e.RowIndex].Cells[1].FindControl("txtname");

                DropDownList Domain = (DropDownList)oGridView.Rows[e.RowIndex].Cells[3].FindControl("drpdomain");
                TextBox Experience = (TextBox)oGridView.Rows[e.RowIndex].Cells[4].FindControl("txtexperience");
                TextBox SkillSets = (TextBox)oGridView.Rows[e.RowIndex].Cells[5].FindControl("txtskillset");
                TextBox CurrentCTC = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtcrtctc");
                TextBox ExpectedCTC = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtexctc");
                Label Remarks = (Label)oGridView.Rows[e.RowIndex].Cells[6].FindControl("lblremark");
                TextBox Email = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtemail");
                TextBox ContactNo = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtcontact");

                if (oGridView.EditIndex == -1) return;
                FileUpload UploadedResume = (FileUpload)oGridView.Rows[e.RowIndex].Cells[6].FindControl("FileUpload2") as FileUpload;
                string fileName = UploadedResume.FileName;
                //string fullPath = Path.GetFullPath(fileName);
                //UploadedResume.SaveAs(fullPath); 


                Label Interviewer = (Label)oGridView.Rows[e.RowIndex].Cells[6].FindControl("lblinterviewer");
                //PeopleEditor Interviewer = (PeopleEditor)oGridView.Rows[e.RowIndex].Cells[6].FindControl("PeopleEditor1");


                DropDownList Status = (DropDownList)oGridView.Rows[e.RowIndex].Cells[6].FindControl("drpStatus");
                DateTimeControl InterviewDate = (DateTimeControl)oGridView.Rows[e.RowIndex].Cells[6].FindControl("DateTimeControl2");



                SPSecurity.RunWithElevatedPrivileges(delegate()
                {
                    UpdateRow(id.Text, Name.Text, Domain.SelectedValue, Experience.Text, SkillSets.Text, CurrentCTC.Text, ExpectedCTC.Text, Remarks.Text, Email.Text, ContactNo.Text, UploadedResume.FileName, Interviewer.Text, Status.SelectedValue, InterviewDate.SelectedDate.Date.ToString());
                    oGridView.EditIndex = -1;
                    bindview();
                });
            }
            catch (Exception ex)
            {
                // oException.Exception(ex.Message.ToString(), ex.StackTrace.ToString(), "oGridView_RowUpdating");
            }
        }

        public void UpdateRow(string Id, string Name, string Domain, string Experience, string SkillSets, string CurrentCTC, string ExpectedCTC, string Remarks, string Email, string ContactNo, string UploadedResume, string Interviewer, string Status, string InterviewDate)
        {
            SPSecurity.RunWithElevatedPrivileges(delegate
            {
                using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                {
                    using (SPWeb web = site.OpenWeb())
                    {
                        SPList list = web.Lists.TryGetList("CandidateDetails");
                        SPListItem item = list.GetItemById(int.Parse(Id));
                        web.AllowUnsafeUpdates = true;
                        item["Name"] = Name;

                        item["Domain"] = Domain;
                        item["Experience"] = Experience;
                        item["SkillSets"] = SkillSets;
                        item["CurrentCTC"] = CurrentCTC;
                        item["ExpectedCTC"] = ExpectedCTC;
                        //item["Remarks"] = Remarks;
                        item["Email"] = Email;
                        item["ContactNo"] = ContactNo;
                        item["UploadedResume"] = UploadedResume;
                        //item["Interviewer"] = Interviewer;
                      
                        item["Status"] = Status;
                        item["InterviewDate"] = InterviewDate;

                        item.Update();
                        //Page.Response.Redirect("", false);
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
                        SPList list = web.Lists.TryGetList("CandidateDetails");
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
                            SPList list = web.Lists.TryGetList("CandidateDetails");
                            SPQuery oquery = new SPQuery();
                            // oquery.Query = "<OrderBy><FieldRef Name='ID' Ascending='False' /></OrderBy>";
                            oquery.Query = " <Where><IsNotNull><FieldRef Name='Name' /></IsNotNull></Where><OrderBy><FieldRef Name='Created' Ascending='False' /></OrderBy>";
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
            ////Page.Response.ContentType = "ContentType;
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

    }
}
