<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ScheduleInterview.ascx.cs" Inherits="Recruitment_Portal.ScheduleInterview.ScheduleInterview" %>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<script src="http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxtransport-xdomainrequest/1.0.1/jquery.xdomainrequest.min.js"></script>
<script type="text/javascript" src="../_layouts/15/clientforms.js">  </script>
<script type="text/javascript" src="../_layouts/15/clienttemplates.js">  </script>
<script type="text/javascript" src="../_layouts/15/clientpeoplepicker.js"></script>
<script type="text/javascript" src="../_layouts/15/autofill.js"></script>
<script type="text/javascript" src="../_layouts/15/1033/strings.js"></script>

<script type="text/javascript">
    var vacanies = "";
    var candidates = "";
    var CoInnovators_user_info_people = "";
    var CoInnovators = "";

    $(document).ready(function () {

        initializePeoplePicker('CoInnovators');
        //SaveScheduleInterview();
        PopulateVacancy();
        // alert('hi');

        $("#btnsubmit").click(function () {
            SaveScheduleInterview();
        });


    });
    function SaveScheduleInterview(userid) {
        var VacancyName = $('#drpVacancyName option:selected').text();
        var CandidateName = $('#txtName option:selected').text();
        //var Interviewer = $('#CoInnovators').userid;
        var InterviewDate = $('#datetimepicker').find("input").val();
        var Remarks = $('#txtRemarks').val();
        var Status = $('#drpStatus option:selected').val();
        getUserInfo("CoInnovators");

        getVacancyId(VacancyName);
        GetCandidateNameId(CandidateName);
        $.ajax({
            url: _spPageContextInfo.webAbsoluteUrl + "/_api/web/lists/GetByTitle('ScheduleInterview')/items",
            type: "POST",
            data: JSON.stringify({
                '__metadata': { 'type': 'SP.Data.ScheduleInterviewListItem' },
                'VacancyId': vacanies,
                'CandidateNameId': candidates,
                'InterviewersId': CoInnovators_user_info_people,
                'InterviewDate': InterviewDate,
                'Remarks': Remarks,
                'Status': Status,
            }),
            async: false,

            headers: {
                "Accept": "application/json;odata=verbose",
                "content-type": "application/json; odata=verbose",
                "X-RequestDigest": $("#__REQUESTDIGEST").val()
            },
            success: function (data) {
                alert("Scheduled Interview Successfully");
                $('#drpVacancyName option:selected').html('select');
                $('#txtName option:selected').html('select');
                $('#CoInnovators').val('');
                $('#InterviewDate').val('');
                $('#txtRemarks').val('');
                $('#drpStatus').val('');
                location.href = _spPageContextInfo.webAbsoluteUrl + "/Pages/ScheduleInterview.aspx";

            },
            error: function (err) {
                alert("Error while adding item: " + JSON.stringify(err));

            }

        });
    }

    function getVacancyId(result) {
        vacanies = "";
        $.ajax({
            url: _spPageContextInfo.webAbsoluteUrl + "/_api/web/lists/getbytitle('Vacancies')/items?$filter=VacancyName eq '" + result + "'",
            type: "GET",
            async: false,
            headers: {
                "accept": "application/json;odata=verbose",
            },
            success: function (data) {
                if (data.d.results) {
                    vacanies = data.d.results[0].ID;
                }

            },
            error: function (error) {
                alert(JSON.stringify(error));
            }
        });
    }

    function GetCandidateNameId(result) {
        candidates = "";
        $.ajax({
            url: _spPageContextInfo.webAbsoluteUrl + "/_api/web/lists/getbytitle('Candidates')/items?$select=ID,CandidateName,VacancyName/Id,VacancyName/VacancyName&$expand=VacancyName&$filter=CandidateName eq '" + result + "'",
            type: "GET",
            async: false,
            headers: {
                "accept": "application/json;odata=verbose",
            },
            success: function (data) {
                if (data.d.results) {
                    candidates = data.d.results[0].ID;
                }

            },
            error: function (error) {
                alert(JSON.stringify(error));
            }
        });
    }



    function PopulateVacancy() {
        var listName = "Vacancies";
        var url = _spPageContextInfo.webAbsoluteUrl;
        getVacancy(listName, url, function (data) {
            var items = data.d.results;
            $('#drpVacancyName').find('option').remove().end();
            var inputElement = '<option>select</option>';
            for (var i = 0; i < items.length; i++) {
                var itemId = items[i].Id,
                  itemVal = items[i].VacancyName;
                inputElement += '<option value="' + itemId + '">' + itemVal + '</option>';
            }
            $('#drpVacancyName').append(inputElement);
            $("#drpVacancyName").each(function () {
                $('option', this).each(function () {

                    if ($(this).text() == 'Select') {
                        $(this).attr('selected', 'selected')
                    };
                });
            });
            $('#drpVacancyName').on('change', function () {
                var selectedcountry = $("#drpVacancyName option:selected").val();
                getCandidate('Candidates', url, selectedcountry, function (data) {
                    var items = data.d.results;
                    //$('#drpVacancyName').find('option').remove().end();
                    var inputElement = '<option>select</option>';
                    for (var i = 0; i < items.length; i++) {
                        var itemId = items[i].CandidateName,
                          itemVal = items[i].CandidateName;
                        inputElement += '<option value="' + itemId + '">' + itemVal + '</option>';
                    }

                    $('#txtName').append(inputElement);
                    $("#txtName").each(function () {
                        $('option', this).each(function () {

                            if ($(this).text() == 'Select') {
                                $(this).attr('selected', 'selected')
                            };
                        });
                    });
                }, function (data) {
                    alert('An error occured while getting client. Please try again');
                });
            });

        }, function (data) {
            alert("An error occured while getting project. Please try again");
        });
    }

    function getVacancy(listName, siteurl, success, failure) {
        $.ajax({
            url: siteurl + "/_api/web/lists/getbytitle('" + listName + "')/items?$select=VacancyName,ID",
            method: "GET",
            headers: { "Accept": "application/json; odata=verbose" },
            success: function (data) {
                success(data);
            },
            error: function (data) {
                failure(data);
            }
        });
    }

    function getCandidate(listName, siteurl, selectedcountryid, success, failure) {
        var url = siteurl + "/_api/web/lists/getbytitle('" + listName + "')/items?$select=ID,CandidateName,VacancyName/Id,VacancyName/VacancyName&$expand=VacancyName&$filter=VacancyName eq '" + selectedcountryid + "'";
        $.ajax({
            url: url,
            method: "GET",
            headers: { "Accept": "application/json; odata=verbose" },
            success: function (data) {
                success(data);
            },
            error: function (data) {
                failure(data);
            }
        });
    }

    function postvalueintolist() {
        getUserInfo('CoInnovators');
        var requestUri = _spPageContextInfo.webAbsoluteUrl + "/_api/web/lists/getByTitle('" + submitlistname + "')/items";
        var coinnovator = CoInnovators_user_info_people;
        $.ajax(
              {
                  url: requestUri,
                  async: false,
                  type: "POST",
                  data: JSON.stringify({
                      '__metadata': { 'type': 'SP.Data.' + submitlistintname + 'ListItem' },
                      'Title': "Test",
                      'Co_InnovatorsId': {
                          results: CoInnovators_user_info_people
                      }
                  }),
                  headers: {
                      "Accept": "application/json;odata=verbose",
                      "content-type": "application/json; odata=verbose",
                      "X-RequestDigest": $("#__REQUESTDIGEST").val(),
                      // "X-HTTP-Method": "MERGE",
                      // "If-Match": "*"
                  },
                  success: function (data) {

                      submitid = data.d.Id;
                      alert(submitid);

                  },
                  error: function (err) {
                      alert("Delete List Item Error Message: " + JSON.stringify(err));
                      console.log("Delete List Item Error Message: " + JSON.stringify(err));
                  }
              });

    }
    function initializePeoplePicker(peoplePickerElementId) {

        // Create a schema to store picker properties, and set the properties.
        var schema = {};
        schema['PrincipalAccountType'] = 'User,DL,SecGroup,SPGroup';
        schema['SearchPrincipalSource'] = 15;
        schema['ResolvePrincipalSource'] = 15;
        schema['AllowMultipleValues'] = true;
        schema['MaximumEntitySuggestions'] = 50;
        schema['Width'] = '100%';

        // Render and initialize the picker.
        // Pass the ID of the DOM element that contains the picker, an array of initial
        // PickerEntity objects to set the picker value, and a schema that defines
        // picker properties.
        this.SPClientPeoplePicker_InitStandaloneControlWrapper(peoplePickerElementId, null, schema);

    }

    // Query the picker for user information.
    function getUserInfo(peoplePickerDiv) {
        // Get the people picker object from the page.
        var people = peoplePickerDiv + "_TopSpan";
        var peoplePicker = this.SPClientPeoplePicker.SPClientPeoplePickerDict[people];
        // Get user keys.
        var keys = peoplePicker.GetAllUserKeys();

        GetUserId(keys, peoplePickerDiv);
    }
    // Submit view user info starts
    function GetUserId(userName, itemname) {


        var siteUrl = _spPageContextInfo.siteAbsoluteUrl;
        var accountName = userName;
        if (accountName != "") {
            $.ajax({
                url: siteUrl + "/_api/web/siteusers(@v)?@v='" +
                    encodeURIComponent(accountName) + "'",
                method: "GET",
                async: false,
                headers: { "Accept": "application/json; odata=verbose" },
                success: function (data) {
                    ///popup user id received from site users.
                    if (data.d) {
                        if (itemname == "CoInnovators") {

                            CoInnovators_user_info_people = data.d.Id;
                        }
                    }
                },
                error: function (data) {
                    console.log(JSON.stringify(data));
                }
            });
        }

    }


</script>
<link rel="stylesheet" type="text/css" media="screen" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

<script type="text/javascript">
    $(document).ready(function () {
        $('#datetimepicker5').datetimepicker({
            defaultDate: "11/1/2013",
            disabledDates: [
                moment("12/25/2013"),
                new Date(2013, 11 - 1, 21),
                "11/22/2013 00:53"
            ]
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $('#datetimepicker1').datetimepicker();
    });
</script>


    <div class="col-md-9 inner_cont">
        <div class="form-horizontal submt_form top-buffer">

            <div class="form-group">

                <label id="lblVacancyName" class="col-md-6">Vacancy Name</label>
                <div class="col-md-6">
                    <select id="drpVacancyName" class="form-control">
                    </select>
                </div>
            </div>



            <div class="form-group">
                <label id="lblcandidatename" class="col-md-6">Candidate Name</label>
                <div class="col-md-6">
                    <select id="txtName" class="form-control">
                    </select>
                </div>
            </div>



            <div class="form-group">
                <label id="lblinterviewer" class="col-md-6">Interviewer</label>
                <div class="col-md-6">
                    <div id="CoInnovators" class="Test"></div>
                </div>
            </div>



            <div class="form-group">
                <label id="lblInterviewDate" class="col-md-6">Interview Date</label>
                <div class="col-md-6">
                    <div class='input-group date' id='datetimepicker5'>
                        <input type='text' class="form-control" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label id="LabelRemarks" class="col-md-6">Remarks</label>
                <div class="col-md-6">
                    <input type="text" id="txtRemarks" class="form-control" />

                </div>
            </div>


            <div class="form-group">
                <label id="LabelStatus" class="col-md-6">Status</label>

                <div class="col-md-6">
                    <select id="drpStatus" class="form-control">
                        <option>select</option>
                        <option>Completed</option>
                        <option>Not Completed</option>
                    </select>

                </div>
            </div>



            <ul class="pull-right list-inline">
                <li>
                    <input type="button" id="btnsubmit" class="btn btn-default blu_btn" value="Submit" />

                <li>
                    <input type="button" id="btnclear" class="btn btn-default blu_btn" value="Cancel" />
            </ul>
        </div>
    </div>







   

