<%@page import="com.TrialManager.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="/Voxce/WebContent/WEB-INF/tld/functions.tld" prefix="tl"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VOXCE :: New Era in Clinical Trial Optimization</title>

<script src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/home/study/studyLaborotory.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript">
	
</script>


<link href="css/crumbs.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}">
	<input type="hidden" name="MessageCode" id="MessageCode"
		value="${MessageCode}">

	<div class="wrapper">

		<%@include file="../header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->

			<!-- ********************************** -->
			<!-- ********************************** -->
			<!-- ********************************** -->

			<!-- left navigation starts here -->

			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">
					<div class="nav_menu">


						<c:if test="${tl:rightsofView(resourceList,'Patients')==1}">
							<a
								href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Patients</a>
						</c:if>
						<a
							href="<c:url value='OpenStudySiteChange.study?siteid=${currentsite.site_id}' />"
							class="nav_l" name="">Site Change</a>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Investigators')==1}">
							<a
								href="<c:url value='OpenStudySiteInvestigators.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Investigators</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Laboratories')==1}">
							<a
								href="<c:url value='OpenStudySiteLaborotories.study?siteid=${currentsite.site_id}'  />"
								class="nav_l" name="" id="current">Site Laboratories</a>
						</c:if>
						<c:if test="${tl:rightsofView(resourceList,'View Document')==1}">
							<a
								href="<c:url value='OpenStudySiteDocuments.study?siteid=${currentsite.site_id}'  />"
								class="nav_l" name="">Site Documents</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Users')==1}">
							<a
								href="<c:url value='OpenStudySiteUsers.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Users</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Site Details')==1}">
							<a
								href="<c:url value='OpenStudySiteDetail.study?siteid=${currentsite.site_id}' />"
								class="nav_l" name="">Site Detail</a>
						</c:if>
						<c:if
							test="${tl:rightsofView(resourceList,'View Study Site Investigators')==1}">
							<a
								href="<c:url value='discrepenciesInSite.study?stiteId=${currentsite.site_id}' />"
								class="nav_l" name="">Site Discrepancy</a>
						</c:if>
					</div>
				</div>
				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">

				<!--  												Start Investigator View-->
				<!--  												Start Investigator View-->


				<div class="body_inner" id="View_User_Div">
					<div class="body_inner_header">
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
								<a
									href="<c:url value='ShowPatientIndex.pat?studyid=${currentstudy.study_id}&siteid=${currentsite.site_id}' />">${currentsite.site_name}</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Laboratories</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">

						<div class="field_set">
							<span id="View_User_error_message" class="error_label_grp"
								style="display: none;"></span> <span
								id="View_User_success_message" class="chk_avail_yes"
								style="display: none;"></span> <input
								id="View_Laboratory_Search_bar" name="View_users_Search_bar"
								type="text" class="input_txt" value="Search..." /> <span
								class="search_btn"><a href="#"><img
									src="images/search.png" alt="search" title="search" border="0" /></a></span>
						</div>
						<div class="show_hide_form">
							<div class="field_txt_view_list">
								<table id="View_Laboratory_Table" width="100%" border="0"
									cellspacing="1" cellpadding="0" class="table_border_view_list">
									<tr class="rights_header_view_list">
										<td width="17%" align="left" valign="middle">&nbsp;Name</td>
										<td width="16%" align="left" valign="middle">&nbsp;Email</td>
										<td width="17%" align="left" valign="middle">&nbsp;Address</td>
										<td width="17%" align="left" valign="middle">&nbsp;City/State</td>
										<td width="16%" align="left" valign="middle">&nbsp;Postal
											Code</td>
										<td width="17%" align="left" valign="middle">&nbsp;Contact</td>
									</tr>
									<tbody id="fbody">
										<c:set var="tempRowStyle" scope="page"
											value="white_row_view_list" />
										<c:forEach items="${laboratorylist}" var="lalist"
											varStatus="status1">
											<c:set var="tempRowStyle"
												value="${(status1.index)%2 eq 0?'white_row_view_list':'grey_row_view_list'}" />

											<tr class="${tempRowStyle}" id="${lalist.labratory_id}">
												<td valign="top" align="left" class="set_padding">&nbsp;${lalist.lab_name}</td>
												<td valign="top" align="left" class="set_padding">&nbsp;${lalist.email}</td>
												<td valign="top" align="left" class="set_padding">&nbsp;${lalist.address1},${lalist.address2},${lalist.address3}</td>
												<td valign="top" align="left" class="set_padding">&nbsp;${lalist.city},${lalist.state}</td>
												<td valign="top" align="left" class="set_padding">&nbsp;${lalist.postal_code}</td>
												<td valign="top" align="left" class="set_padding">&nbsp;<strong>Phone</strong>${lalist.phone}
													/ <strong>Cell</strong>${lalist.cell} / <strong>fax</strong>${lalist.fax}
												</td>
											</tr>

										</c:forEach>

									</tbody>
								</table>

							</div>
						</div>
					</div>

				</div>

				<!-- ***********************************End Investigators List************************************************************ -->
				<!-- ********************************************************************************************************************* -->
			</div>
			<!-- right body content ends here -->

		</div>
		<!-- content ends here -->

		<!-- footer starts here -->
		<%@include file="../footer.jsp"%>
		<!-- footer ends here -->

	</div>
	<!-- wrapper ends here -->
</body>
</html>
