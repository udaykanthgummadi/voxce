<%@page import="com.TrialManager.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="/Voxce/WebContent/WEB-INF/tld/functions.tld" prefix="tl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VOXCE :: New Era in Clinical Trial Optimization</title>


<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>
<script src="JQuery/jquery-ui.min.js"></script>
<script type="text/javascript" src="JQuery/jquery-timepicker.js"></script>
<script type="text/javascript" src="JQuery/ui.multiselect.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/tmpl/jquery.tmpl.1.1.1.js"></script>
<script type="text/javascript"
	src="JQuery/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>




<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/redmond/jquery-ui.css" />
<link href="css/redmond/jquery-ui-1.8.17.custom.css" rel="stylesheet"
	type="text/css" />
<link href="css/ui.multiselect.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/patient.css" rel="stylesheet" type="text/css" />
<link href="css/crf.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" src="js/patient.js"></script>
<script type="text/javascript">
	var visitName = "<c:out value='${visitName}' />";
	$(document).ready(function() {
		$(".multiselect").multiselect();
		$(".show_disc").find(".st_status").each(function() {
			if ($(this).html() == "Open") {
				$(this).parent().find(".name_user").hide();
			}
		});
	});
</script>
<style type="">
.dialog-label {
	float: left;
	width: 150px;
	margin: 3px;
	font-family: arial;
	font-weight: normal;
}

.dialog-field {
	float: left;
	width: 200px;
	margin: 3px;
}

.error2discrepancy {
	float: left;
	clear: both;
}
</style>
</head>

<body>

	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />




	<!-- wrapper starts here -->
	<div class="wrapper">
		<%@include file="../header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">
						<a href="javascript://" class="table_disc nav_l"
							style="display: none; text-decoration: none; color: #484848; font-family: arial;"
							name="" onclick="" id="">Discrepancies</a> <a
							href="javascript://" class="table_audit nav_l"
							style="display: none; text-decoration: none; color: #484848; font-family: arial;"
							name="" onclick="" id="">Audit Trail</a>

					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">

				<!-- 												Start Create Patient CRF related-->
				<!-- 												Start Create Patient CRF related-->
				<div class="body_inner" id="Patient_CRF_div">
					<div class="body_inner_header"
						id="Home_Study_createstudy_div_Title">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ViewStudy.study?studyid=${currentstudy.study_id}' />">${currentstudy.study_name}</a>
							</div>
							<div class="crumbs-link">
								<a href="<c:url value='OpenStudySiteDetail.study?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">
									Patient</a>
							</div>
							<div class="crumbs-link">
								<a
									href='<c:url value='PatientVisits.pat?patientId=${patientid}&patientNumber=${patientNumber}&studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />'>${patientNumber}</a>
							</div>
							<div class="crumbs-link">
								<a href="javaScript://">${visitName}</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>

					<div class="create_group_container">
						<!--  <div class="field_label_view_list">Select Visit</div>
	<select id = "View_Patient_Search_baro" class = "drop_txt" >
	 <c:forEach items="${visitslist}" var = "cvisits" varStatus="crfState">
	            		<c:forEach items = "${visitsName}" var = "visitName" varStatus="visitStatus">
	            			<c:if test = "${cvisits.visit_name_text_id == visitName.visit_name_text_id}">
	            				<option value="${visitName.visit_name}" >${visitName.visit_name}</option>
	            			</c:if>
	            		</c:forEach>
	            </c:forEach>
	</select>
	<a href="javascript://" ><img onclick="create_visit('${patientid}','${patientNumber}')" src="images/patient_visit.png" alt="Edit" title="Visit" border="0" /></a>
			-->
						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<input name="visit_id1" id="visit_id1" type="text" value="0"
									class="input_txt" style="display: none" />
								<table id="View_user_Table" width="100%" border="0"
									cellspacing="1" cellpadding="0" class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="10%" align="left" valign="middle"
											style="display: none">&nbsp;Visit Name</td>
										<td width="8%" align="left" valign="middle">&nbsp;Crf
											Name</td>
										<td width="8%" align="left" valign="middle">&nbsp;Filled
											by</td>
										<td width="8%" align="left" valign="middle">&nbsp;Crf
											Status</td>
										<td width="8%" align="left" valign="middle">&nbsp;Filled
											date</td>
										<td width="8%" align="left" valign="middle"
											style="display: none">&nbsp;Delete</td>
									</tr>
									<tbody id="fbodyo">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />
										<c:forEach items="${mape}" var="mapeCrf"
											varStatus="statusMape">
											<c:set var="tempRowStyle"
												value="${(statusMape.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
											<tr class="${tempRowStyle}" id="${mapeCrf.patient_crf_id}">
												<c:forEach items="${visitslist}" var="cvisits"
													varStatus="crfState">

													<c:if test="${cvisits.visit_id == mapeCrf.visit_id}">
														<c:forEach items="${visitsName}" var="visitName"
															varStatus="visitStatus">
															<c:if
																test="${cvisits.visit_name_text_id == visitName.visit_name_text_id}">
																<td valign="top" align="left" class="set_padding"
																	style="display: none">${visitName.visit_name}</td>
															</c:if>
														</c:forEach>

													</c:if>
												</c:forEach>


												<td crfid="${mapeCrf.patient_crf_id}" valign="top"
													align="left" class="set_padding "><a
													href="javascript://"
													style="text-decoration: none; color: #1D99D9"
													class="show-in-dialog html-data"
													htmlData='${mapeCrf.crf_html}'>${mapeCrf.crf_name}</a></td>

												<td valign="top" align="center"
													class="set_padding2 user_name"><c:forEach
														items="${users}" var="users" varStatus="userStatus">
														
														<c:choose>
															<c:when test="${users.user_id == mapeCrf.filld_by}">
																<span username="${mapeCrf.filld_by}"
																	style="display: block;" class="name_user"> ${users.first_name}
																	${users.last_name} </span>
															</c:when>
														</c:choose>
														
													</c:forEach></td>
												<td valign="top" align="center"
													class="set_padding2 st_status">${mapeCrf.crf_status}</td>
												<td valign="top" align="center"
													class="set_padding2 filled_date"><c:if
														test="${mapeCrf.filled_date != '1901-01-01'}">
														<span username="${mapeCrf.filled_date}"
															style="display: none;" class="date_filled">${mapeCrf.filled_date}</span>
													</c:if></td>
												<!-- 	<td>
							<a href = "javascript://" style = "margin-left: 48%;" class = "show-in-dialog html-data" htmlData = '${mapeCrf.crf_html}'><img src="images/viewer.png" alt="Edit" title="Open Crf" border="0" /></a>
						</td>
					-->
												<td valign="top" align="center" class="set_padding2"
													style="display: none"><a
													href="<c:url value='deletePatientCrfs.pat?patientCrfID=${mapeCrf.patient_crf_id}&patientid=${patientid}&patientNumber=${patientNumber}&patient_visit_id=${patient_visit_id}&studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}'/>"><img
														src="images/delete.png" alt="Del" title="Delete"
														border="0" /></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div id="Patient_Visit_div" class="myform visit"
							style="display: none;">
							<form id="patient_visit_form" name="patient_visit_form"
								method="post" action="assignPatientVisit.pat" class="visit">
								<input name="edit_id_patient_visit" id="edit_id_patient_visit"
									type="text" value="0" class="input_txt" style="display: none" />
								<label style="float: left; width: 100px;">Patient Number
									:</label> <input style="float: left;" readonly="readonly"
									id="patient_no" name="patient_no" type="text" value="Enter "
									class="input_txt_color" /> <br />
								<br />
								<br />
								<br />
								<br />
								<br />
								<label style="float: left; width: 100px;">Patient Visits
									:</label> <select id="patient_visit" class="multiselect"
									multiple="multiple" name="patient_visit">

									<c:forEach items="${visitslist}" var="vis" varStatus="status">
										<c:forEach items="${visitsName}" var="namelist"
											varStatus="status">
											<c:if
												test="${namelist.visit_name_text_id== vis.visit_name_text_id}">
												<option id="${namelist.visit_name_text_id}"
													value="${vis.visit_id}" onclick="">${namelist.visit_name}</option>
											</c:if>
										</c:forEach>
									</c:forEach>
								</select> <select id="hidennSelectedPatient_visit" name=""
									style="display: none;">
									<c:forEach items="${selectedVisits}" var="selectedVisits"
										varStatus="status">
										<option id="" value="${selectedVisits.visit_id}" onclick=""></option>
									</c:forEach>
								</select>

								<div class="spacer"></div>
								<div style="clear: both; margin-top: 10px; padding-left: 370px;">
									<button class="blue-pill">Save</button>
									<input class="grey-pill" type="button"
										onclick="cancleAssignCrf()" value="Cancel" />
								</div>
							</form>

						</div>
					</div>
					<div class="dialog-div" style="display: none;"></div>
					<div class="controls" style="display: none;">
						<input type="button" class="save-button-p-crf blue-pill"
							style="margin-left: 45%" value="Save" /> <input type="button"
							class="cancle-button-p-crf grey-pill" value="Cancle" />
					</div>
					<div id="Edit_User_error_message" class="chk_avail_yes"></div>
				</div>

				<!--  												End Create Patient CRF related-->
				<!--  												End Create Patient CRF related-->
				<!-- right body content ends here -->




				<div class="show_disc" style="display: none;">
					<div class="field_txt_view_list">
						<input name="visit_id1" id="" type="text" value="0"
							class="input_txt" style="display: none" />
						<table id="View_discrepancy_Table" width="100%" border="0"
							cellspacing="1" cellpadding="0" class="table_border_view_list">
							<tr class="rights_header_view_list">

								<td width="8%" align="left" valign="middle">&nbsp;Section</td>
								<td width="8%" align="left" valign="middle">&nbsp;Question</td>
								<td width="8%" align="left" valign="middle">&nbsp;Discrepancy</td>
								<td width="8%" align="left" valign="middle">&nbsp;Action</td>
								<td width="8%" align="left" valign="middle">&nbsp;Status</td>
								<td width="8%" align="left" valign="middle">&nbsp;Response
									by</td>

							</tr>
							<tbody id="fbodyoDisc">
								<c:set var="tempRowStyle" scope="page"
									value="white_row_view_list" />
								<c:forEach items="${discrepancyList}" var="mapeCrf1"
									varStatus="statusMape">
									<c:set var="tempRowStyle"
										value="${(statusMape.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
									<tr class="${tempRowStyle}" id="${mapeCrf1.discrepancy_id}"
										pcrfId="${mapeCrf1.patient_crf_id}">

										<td valign="top" align="left" class="set_padding" style="">${mapeCrf1.section}</td>
										<td valign="top" align="left" class="set_padding" style="">${mapeCrf1.question_text}</td>
										<td valign="top" align="left" class="set_padding" style="">${mapeCrf1.discrepancy_text}</td>
										<td valign="top" align="center"
											class="set_padding2 action_disc">${mapeCrf1.action}</td>
										<td valign="top" align="center" class="set_padding2 st_status">${mapeCrf1.status}</td>
										<td valign="top" align="center" class="set_padding2  user_name">
											<c:forEach items="${users}" var="users"
												varStatus="userStatus">
<%-- 												${users.user_id}....${mapeCrf1.modifiedBy}  --%>
												<c:choose>
													<c:when test="${users.user_id == mapeCrf1.modifiedBy}" >
														<span username="${mapeCrf1.modifiedBy}" class="">${users.first_name}
															${users.last_name} </span>
													</c:when>
												</c:choose>
											</c:forEach>
										</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>


				<div class="show_audit" style="display: none;">
					<div class="field_txt_view_list">
						<input name="visit_id1" id="" type="text" value="0"
							class="input_txt" style="display: none" />
						<table id="View_audit_Table" width="100%" border="0"
							cellspacing="1" cellpadding="0" class="table_border_view_list">
							<tr class="rights_header_view_list">

								<td width="8%" align="left" valign="middle"
									style="display: none;">&nbsp;Crf</td>
								<td width="8%" align="left" valign="middle">&nbsp;Section</td>
								<td width="8%" align="left" valign="middle">&nbsp;Question</td>
								<td width="8%" align="left" valign="middle">&nbsp;Response</td>
								<td width="8%" align="left" valign="middle">&nbsp;Opration</td>
								<td width="8%" align="left" valign="middle">&nbsp;Modified
									By</td>
								<td width="8%" align="left" valign="middle">&nbsp;Modified
									Date</td>

							</tr>
							<tbody id="fbodyoDiscAudit">
								<c:set var="tempRowStyle" scope="page"
									value="white_row_view_list" />
								<c:forEach items="${audit}" var="audit" varStatus="statusMape">
									<c:set var="tempRowStyle"
										value="${(statusMape.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />
									<tr class="${tempRowStyle}" style="display: none;"
										id="${audit.audit_trail_id}" pcrfId="${audit.audit_trail_id}">


										<td valign="top" align="left" class="set_padding audit_crf"
											style="display: none;">${audit.patientCrf_id}</td>
										<td valign="top" align="left" class="set_padding" style="">${audit.section}</td>
										<td valign="top" align="left" class="set_padding" style="">${audit.question}</td>
										<td valign="top" align="left" class="set_padding audit_answer"
											style="">${audit.answer}</td>
										<td valign="top" align="center"
											class="set_padding2 audit_opration">${audit.opration}</td>
										<td valign="top" align="center"
											class="set_padding2 audit_modified_by"><c:forEach
												items="${users}" var="users" varStatus="userStatus">
												<c:choose>
													<c:when test="${users.user_id == audit.modified_by}">
														<span username="${audit.modified_by}" class="name_user">${users.first_name}
															${users.last_name}</span>
													</c:when>
												</c:choose>
											</c:forEach></td>
										<td valign="top" align="center"
											class="set_padding2 audit_modified_date">${audit.date_modified}</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>




			</div>
			<!-- content ends here -->

			<!-- footer starts here -->
			<div class="footer_bar">
				<div class="footer_left">
					<a href="#" class="flinks">Home</a> | <a href="#" class="flinks">About
						Us</a> | <a href="#" class="flinks">FAQ</a> | <a href="#"
						class="flinks">Logout</a> | <a href="#" class="flinks">Contact
						Us</a>
				</div>

				<div class="footer_right">© 2011, Al Rights Reserved.</div>
			</div>
			<!-- footer ends here -->
			<form id="saveHtml" method="post" action="savePatientCrfs.pat">
				<input name="data_html" type="hidden" value="" id="data" /> <input
					name="status" type="hidden" value="false" id="filled" /> <input
					name="patientid" id="patientid" type="hidden" value="${patientid}" />
				<input name="patientNumber" id="patientNumber" type="hidden"
					value="${patientNumber}" /> <input name="visitName" id="visitName"
					type="hidden" value="${visitName}" /> <input
					name="patient_visit_id" id="patient_visit_id" type="hidden"
					value="${patient_visit_id}" /> <input name="studyid" id="studyid"
					type="hidden" value="${currentstudy.study_id}" /> <input
					name="siteid" id="siteid" type="hidden"
					value="${currentsite.site_id}" /> <input name="id" type="hidden"
					value="" id="idOfPCRT" />
			</form>
		</div>
		<div id="confirmDiscrepancy"
			style="display: none; border: 1px dashed PaleTurquoise;">
			<span>This Form Is Not Filled as Required!<br />Do you Want to
				Save this with All Discrepancies?
			</span>
		</div>
		<!-- wrapper ends here -->
		<div class="query" style="display: none;">
			<textarea style="width: 300px;" class="text-of-query" rows="2"
				cols="1"></textarea>
		</div>
		<div class="responseToQuery" style="display: none;">
			<div>
				<div class="dialog-label">
					<label>Status</label>
				</div>
				<div class="dialog-field">
					<select class="drop_txt_small status"
						style="width: 200px; font-family: arial; font-size: 10px;">
						<option>Select the Status</option>
						<c:forEach items="${statusText}" var="status"
							varStatus="indesStatus">
							<option value="${status.name}">${status.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div>
				<div class="dialog-label">
					<label>Question</label>
				</div>
				<div class="dialog-field">
					<input class="question_text_name" readonly="readonly"
						style="width: 98%; font-family: arial; font-size: 12px;" />
				</div>
			</div>
			<div>
				<div class="dialog-label">
					<label>Section</label>
				</div>
				<div class="dialog-field">
					<input readonly="readonly" class="section_text_name"
						style="width: 98%; font-family: arial; font-size: 12px;" />
				</div>
			</div>
			<div>
				<div class="dialog-label">
					<label>Original Value</label>
				</div>
				<div class="dialog-field">
					<input class="orignal_value"
						style="width: 98%; font-family: arial; font-size: 12px;" />
				</div>
			</div>
			<div>
				<div class="dialog-label">
					<label>Current Value </label>
				</div>
				<div class="dialog-field ">
					<input class="current_value"
						style="width: 98%; font-family: arial; font-size: 12px;" />
				</div>
			</div>
			<div>
				<div class="dialog-label">
					<label>Reason</label>
				</div>
				<div class="dialog-field ">
					<textarea class="resion"
						style="max-width: 98%; min-width: 98%; font-family: arial; font-size: 12px;"
						" cols=""></textarea>
				</div>
			</div>
			<div>
				<div class="dialog-label">
					<label>Action</label>
				</div>
				<div class="dialog-field">
					<select class="drop_txt_small action"
						style="width: 200px; font-family: arial; font-size: 10px;">
						<option value="0">Select Action</option>
						<c:forEach items="${action}" var="action" varStatus="ind">
							<option value="${action.TEXT}">${action.TEXT}</option>
						</c:forEach>

					</select>
				</div>
			</div>
			<div>
				<div class="dialog-label">
					<label>Type</label>
				</div>
				<div class="dialog-field">
					<select class="drop_txt_small type"
						style="width: 200px; font-family: arial; font-size: 10px;">
						<option value="0">Select Type</option>
						<option value="Permanently missing">Permanently missing</option>
						<option value="Correct As Stands">Correct As Stands</option>
						<option value="Unresolved">Unresolved</option>
						<option value="Corrected">Corrected</option>
					</select>
				</div>
			</div>




		</div>
</body>
</html>
