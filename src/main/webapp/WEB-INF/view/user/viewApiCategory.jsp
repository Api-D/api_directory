<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="z" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>APID | Add Complaints</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/userResources/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/userResources/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/userResources/css/vendor.bundle.addons.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/userResources/css/style.css">
<!-- endinject -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/userResources/image/favicon.png" />
</head>
<body onload="getAPIDetails('${apiName}','${category.categoryId}')">
	<div class="container-scroller">
		<div class="horizontal-menu">
			<!-- ------------Header------------- -->

			<jsp:include page="header.jsp"></jsp:include>

			<jsp:include page="bottomNavBar.jsp"></jsp:include>
		</div>



		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12">

							<div class="col-md-12 grid-margin stretch-card d-none d-md-flex">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">
											<b>${category.categoryName}</b>
										</h4>
										<div class="row">
											<div class="col-3">
												<ul class="nav nav-pills nav-pills-vertical nav-pills-info"
													id="v-pills-tab" role="tablist" aria-orientation="vertical">


													<c:forEach var="i" items="${viewApiCategoryList}"
														varStatus="j">

														<li class="nav-item"><a class="nav-link"
															id="v-pills-home-tab" data-toggle="pill"
															href="#v-pills-home" role="tab"
															onclick="getAPIDetails('${i.apiName}','${i.manageCategoryVO.categoryId}')"
															aria-controls="v-pills-home" aria-selected="false">

																${j.count}. ${i.apiName} </a></li>
													</c:forEach>
												</ul>
											</div>


											<div class="col-9">
												<div class="tab-content tab-content-vertical"
													id="v-pills-tabContent">

													<div class="tab-pane fade active show" id="v-pills-home"
														role="tabpanel" aria-labelledby="v-pills-home-tab">

														<div class="ud-accordion" id="accordion-101"
															role="tablist"></div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


						</div>

					</div>


				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<jsp:include page="footer.jsp"></jsp:include>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script
		src="<%=request.getContextPath()%>/userResources/js/vendor.bundle.base.js"></script>
	<script
		src="<%=request.getContextPath()%>/userResources/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script
		src="<%=request.getContextPath()%>/userResources/js/off-canvas.js"></script>
	<script
		src="<%=request.getContextPath()%>/userResources/js/hoverable-collapse.js"></script>
	<script
		src="<%=request.getContextPath()%>/userResources/js/template.js"></script>
	<script
		src="<%=request.getContextPath()%>/userResources/js/settings.js"></script>
	<script
		src="<%=request.getContextPath()%>/userResources/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script
		src="<%=request.getContextPath()%>/userResources/js/form-validation.js"></script>
	<script
		src="<%=request.getContextPath()%>/userResources/js/bt-maxLength.js"></script>


	<script type="text/javascript">
		function getAPIDetails(apiName, categoryId) {

			$('#accordion-101').html();

			const
			xhttp = new XMLHttpRequest();

			xhttp.onreadystatechange = function() {

				if (xhttp.readyState === 4) {

					var jsn = JSON.parse(xhttp.responseText);

					if (jsn && jsn.length > 0) {

						var data = "";

						for (var i = 0; i < jsn.length; i++) {

							data = data + '<div>';
							data = data + '	<div class="opblock opblock-get">';
						
							data = data + '		<div style="padding:20px 15px">';
							data = data
									+ '			<a class="collapsed rm-btn" data-toggle="collapse" '; 
							data = data + '				href="#collapse-'+i+'" aria-expanded="false"';
							data = data + '				aria-controls="collapse-'+i+'"> '
									+ (i + 1) + '. '
									+ jsn[i].apiRequestMethodType + '</a>';
							data = data
									+ '			<span style="color:gray;display:inline"> &ensp; / &nbsp;'
									+ jsn[i].manageCategoryVO.categoryName + '&nbsp;/&nbsp;'
									+ jsn[i].apiName + '</span>';
							data = data + ' &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<i style="cursor:pointer;" class="mdi mdi-arrow-down-drop-circle-outline" data-toggle="collapse" href="#collapse-'+i+'" aria-expanded="false" aria-controls="collapse-'+i+'"></i>';
									 
							data = data + '		</div>';
							data = data
									+ '		<div id="collapse-'+i+'" class="collapse" role="tabpanel"';
							data = data + '			aria-labelledby="heading-'+i+'" data-parent="#accordion-101">';
							data = data + '			<div class="card-body"> '
									+ jsn[i].apiDescription;
							data = data + '				<ul style="list-style-type:none;margin:0;padding:0">';
							data = data + '					<li><b><i class="mdi mdi-play lead text-black ml-3"></i> Type:</b> '
									+ jsn[i].apiType + ' </li>';
							data = data + '					<li><b> <i class="mdi mdi-play lead text-black ml-3"></i> Response Type :</b> '
									+ jsn[i].apiResponseType + ' </li>';
							data = data + '					<li><b><i class="mdi mdi-play lead text-black ml-3"></i> End Point : <a href="executeAPI?url='+jsn[i].apiEndpoint+'"></b> '
									+ jsn[i].apiEndpoint + '</a> </li>';
							data = data + '					<li><b><i class="mdi mdi-play lead text-black ml-3"></i> Sample Request:</b> '
									+ jsn[i].apiSampleRequest + ' </li>';
							data = data + '					<li><b><i class="mdi mdi-play lead text-black ml-3"></i> Sample Response :</b> '
									+ jsn[i].apiSampleResponse + ' </li>';
							data = data + '					<br>';
							data = data
									+ '					<li><a class="btn btn-danger text-blue" href="executeAPI?url='
									+ jsn[i].apiEndpoint
									+ '"> Execute</a></li>';
							data = data + '					<br>';
							data = data + '				</ul>';
							data = data + '			</div>';
							data = data + '		</div>';
							data = data + '	</div>';
							data = data + '</div>';

							/* 							data = data + '<div class="card">';
							 data = data
							 + '<div class="card-header" role="tab" id="heading-'+i+'">';
							 data = data + '<h6 class="mb-0">';
							 data = data
							 + '<a class="collapsed" data-toggle="collapse"';
							data = data + 'href="#collapse-'+i+'" aria-expanded="false"';
							data = data + 'aria-controls="collapse-'+i+'"> '
							 + (i + 1) + '. '
							 + jsn[i].apiRequestMethodType + '</a>';
							 data = data + '</h6>';
							 data = data + '</div>';
							 data = data
							 + '		<div id="collapse-'+i+'" class="collapse" role="tabpanel"';
							data = data + '			aria-labelledby="heading-'+i+'" data-parent="#accordion-6">';
							 data = data + '			<div class="card-body"> '
							 + jsn[i].apiDescription;
							 data = data + '				<ol class="pl-3 mt-4">';
							 data = data + '					<li><b>Type:</b> '
							 + jsn[i].apiType + ' </li>';
							 data = data + '					<li><b>Response Type :</b> '
							 + jsn[i].apiResponseType + ' </li>';
							 data = data + '					<li><b>End Point :</b> '
							 + jsn[i].apiEndpoint + ' </li>';
							 data = data + '					<li><b>Sample Request:</b> '
							 + jsn[i].apiSampleRequest + ' </li>';
							 data = data + '					<li><b>Sample Response :</b> '
							 + jsn[i].apiSampleResponse + ' </li>';
							 data = data + '					<br>';
							 data = data
							 + '					<li><a class="text-white" href="executeAPI?url='
							 + jsn[i].apiEndpoint
							 + '"><i class="mdi mdi-play lead text-white ml-3"></i> Execute</a></li>';
							 data = data + '					<br>';
							 /* data = data + '					<button onclick="window.location=addToFavorites?apiId='+jsn[i].apiId+'&categoryId='+jsn[i].manageCategoryVO.categoryId+'" class="btn btn-light">Add to favorites</button>'; */
							/* 	/* data = data + '				</ol>';
								data = data + '			</div>';
								data = data + '		</div>';
								data = data + '	</div>'; */
						}

						$('#accordion-101').html(data);

					}
				}

			}

			xhttp.open("GET", "getAPIDetails?apiName=" + apiName
					+ "&categoryId=" + categoryId, true);
			xhttp.send();
		}
	</script>

	<!-- End custom js for this page-->
</body>

</html>