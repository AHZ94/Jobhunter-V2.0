<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   
<!-- Javascript -->   
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("currentSessionUser")==null)
      response.sendRedirect("/Jobhunter_V2.0/index.jsp");
  
  String email = (String)session.getAttribute("currentSessionUser");%>
<!-- /Javascript -->
   	
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Theme Region">
   	<meta name="description" content="">

    <title>Jobs | Job Portal / Job Board HTML Template</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/icofont.css"> 
    <link rel="stylesheet" href="css/slidr.css">     
    <link rel="stylesheet" href="css/main.css">  
	<link id="preset" rel="stylesheet" href="css/presets/preset1.css">	
    <link rel="stylesheet" href="css/responsive.css">
	
	<!-- font -->
	<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500,700,300' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Signika+Negative:400,300,600,700' rel='stylesheet' type='text/css'>

	<!-- icons -->
	<link rel="icon" href="images/ico/favicon.ico">	
    <link rel="apple-touch-icon" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon" sizes="57x57" href="images/ico/apple-touch-icon-57-precomposed.png">
    <!-- icons -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Template Developed By ThemeRegion -->
  </head>
  <body>
	<!-- header -->
	<header id="header" class="clearfix">
		<!-- navbar -->
		<nav class="navbar navbar-default">
			<div class="container">
				<!-- navbar-header -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html"><img class="img-responsive" src="images/logo.png" alt="Logo"></a>
				</div>
				<!-- /navbar-header -->
				
				<div class="navbar-left">
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="/Jobhunter_V2.0/Employer/Emp-index.jsp">Home</a></li>
							<li><a href="job-list.html">Job list</a></li>
							<li><a href="details.html">Job Details</a></li>
							<li><a href="resume.html">Resume</a></li> 
							<li class="dropdown active"><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Pages<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="profile.html">profile</a></li>
									<li><a href="post-resume.html">Post Resume</a></li>
									<li><a href="post.html">Job Post</a></li>
									<li><a href="edit-resume.html">Edit Resume</a></li>
									<li><a href="profile-details.html">profile Details</a></li>
									<li><a href="bookmark.html">Bookmark</a></li>
									<li class="active"><a href="applied-job.html">Applied Job</a></li>
									<li><a href="delete-account.html">Close Account</a></li>
									<li><a href="signup.html">Job Signup</a></li>
									<li><a href="signin.html">Job Signin</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div><!-- navbar-left -->
				
				<!-- nav-right -->
				<div class="nav-right">				
					<ul class="sign-in">
						<li><i class="fa fa-user"></i></li>
						<li><a href="signin.html">Sign In</a></li>
						<li><a href="signup.html">Register</a></li>
					</ul><!-- sign-in -->					

					<a href="post.html" class="btn">Post Your Job</a>
				</div>
				<!-- nav-right -->
			</div><!-- container -->
		</nav><!-- navbar -->
	</header><!-- header -->

	<section class=" job-bg page  ad-profile-page">
		<div class="container">			
			<div class="job-profile section">	
				<div class="user-profile">
					<div class="user-images">
						<img src="images/user.jpg" alt="User Images" class="img-responsive">
					</div>
					<div class="user">
						<h2>Hello, <a href="#" onclick= "return false;"><c:out value="${emp.name}" /></a></h2>						
					</div>

					<div class="favorites-user">
						<div class="my-ads">
							<a href="applied-job.html">29<small>Apply Job</small></a>
						</div>						
					</div>								
				</div><!-- user-profile -->
						
				<ul class="user-menu">
					<li><a href="/Jobhunter/EmployerHandler?action=viewAccount&email=<c:out value="<%=email%>"/>">Account Info </a></li>
					<li><a href="/Jobhunter/EmployerHandler?action=updateAccount&email=<c:out value="<%=email%>"/>">Profile Details</a></li>
					<li><a href="/Jobhunter/ListHandler?action=viewList&email=<c:out value="<%=email %>"/>">Job List     </a></li>
					<li><a href="/Jobhunter/JobsHandler?action=createJobs&email=<c:out value="<%=email%>"/>">Job Posted   </a></li>								
					<li class="active"><a href="/Jobhunter/ListHandler?action=applyListss&email=<c:out value="<%=email%>"/>">Applied job</a></li>
					<li><a href="/Jobhunter/EmployerHandler?action=deleteAccount&email=<c:out value="<%=email%>"/>">Close account</a></li>
				</ul>
			</div><!-- ad-profile -->

			<!-- recommended-ads -->
			<div class="col-sm-15 col-md-15">				
				<div class="section job-list-item">
						
			<!-- Apply List -->		
					<div style="overflow-x:auto;">												    					
						<h2>Posted Job</h2>
    					<c:forEach items="${list}" var="list" varStatus="status">
        						<div class="job-ad-item">
								<div class="item-info">
									<div class="item-image-box">
										<div class="item-image">
											<c:set var="jobsid" value="${list.jobsid}"/><a href="/Jobhunter/JobsHandler?action=details&jobsid=<c:out value="${list.jobsid}" />"><img src="/Jobhunter/Employer/images/job/download.png" alt="Image" class="img-responsive"></a>
										</div><!-- item-image -->
									</div>

									<div class="ad-info">
										<span><c:set var="jobsid" value="${list.jobsid}"/><a href="/Jobhunter/JobsHandler?action=details&jobsid=<c:out value="${list.jobsid}" />">${list.category}@${list.title}</a></span>
										<div class="ad-meta">
											<ul>
												<li><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i>${list.location}</a></li>
												<li><a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>${list.type}</a></li>
												<li><a href="#"><i class="fa fa-money" aria-hidden="true"></i>RM ${list.minsalary} - RM ${list.maxsalary}</a></li>
												<li><input type="button" value="Select Candidate" onclick="window.location.href='/Jobhunter_V2.0/JobsHandler?action=Applydetails&jobsid=<c:out value="${list.jobsid}" />&email=<c:out value="<%=email%>" />'" ></li>	        																				
												<li><input type="button" value="Rating" onclick="window.location.href='/Jobhunter_V2.0/RatingHandler?x=<c:out value="${list.studid}" />&action=updateRating&email=<c:out value="<%=email%>" />'" ></li>																								
											</ul>																																					
										</div><!-- ad-meta -->									
									</div><!-- ad-info -->																										
								</div><!-- item-info -->															
							</div><!-- job-ad-item -->						
    					</c:forEach>							
  					</div>
			<!-- Apply List -->
			
			<!-- pagination  -->
							<div class="text-center">
								<ul class="pagination ">
									<li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
									<li><a href="#">1</a></li>
									<li class="active"><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a>...</a></li>
									<li><a href="#">10</a></li>
									<li><a href="#">20</a></li>
									<li><a href="#">30</a></li>
									<li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
								</ul>
							</div><!-- pagination  -->
							</div>																													
					</div><!-- recommended-ads -->					
	</section>

	<!-- footer -->
	<footer id="footer" class="clearfix">
		<!-- footer-top -->
		<section class="footer-top clearfix">
			<div class="container">
				<div class="row">
					<!-- footer-widget -->
					<div class="col-sm-3">
						<div class="footer-widget">
							<h3>Quik Links</h3>
							<ul>
								<li><a href="#">About Us</a></li>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Careers</a></li>
								<li><a href="#">All Cities</a></li>
								<li><a href="#">Help & Support</a></li>
								<li><a href="#">Advertise With Us</a></li>
							</ul>
						</div>
					</div><!-- footer-widget -->

					<!-- footer-widget -->
					<div class="col-sm-3">
						<div class="footer-widget">
							<h3>How to sell fast</h3>
							<ul>
								<li><a href="#">How to sell fast</a></li>
								<li><a href="#">Membership</a></li>
								<li><a href="#">Banner Advertising</a></li>
								<li><a href="#">Promote your ad</a></li>
								<li><a href="#">Jobs Delivers</a></li>
								<li><a href="#">FAQ</a></li>
							</ul>
						</div>
					</div><!-- footer-widget -->

					<!-- footer-widget -->
					<div class="col-sm-3">
						<div class="footer-widget social-widget">
							<h3>Follow us on</h3>
							<ul>
								<li><a href="#"><i class="fa fa-facebook-official"></i>Facebook</a></li>
								<li><a href="#"><i class="fa fa-twitter-square"></i>Twitter</a></li>
								<li><a href="#"><i class="fa fa-google-plus-square"></i>Google+</a></li>
								<li><a href="#"><i class="fa fa-youtube-play"></i>youtube</a></li>
							</ul>
						</div>
					</div><!-- footer-widget -->

					<!-- footer-widget -->
					<div class="col-sm-3">
						<div class="footer-widget news-letter">
							<h3>Newsletter</h3>
							<p>Jobs is Worldest leading Portal platform that brings!</p>
							<!-- form -->
							<form action="#">
								<input type="email" class="form-control" placeholder="Your email id">
								<button type="submit" class="btn btn-primary">Sign Up</button>
							</form><!-- form -->			
						</div>
					</div><!-- footer-widget -->
				</div><!-- row -->
			</div><!-- container -->
		</section><!-- footer-top -->

		<div class="footer-bottom clearfix text-center">
			<div class="container">
				<p>Copyright &copy; <a href="#">Jobs</a> 2017. Developed by <a href="http://themeregion.com/">ThemeRegion</a></p>
			</div>
		</div><!-- footer-bottom -->
	</footer><!-- footer -->
	
	<!--/Preset Style Chooser--> 
	<div class="style-chooser">
		<div class="style-chooser-inner">
			<a href="#" class="toggler"><i class="fa fa-cog fa-spin"></i></a>
			<h4>Presets</h4>
			<ul class="preset-list clearfix">
				<li class="preset1 active" data-preset="1"><a href="#" data-color="preset1"></a></li>
				<li class="preset2" data-preset="2"><a href="#" data-color="preset2"></a></li>
				<li class="preset3" data-preset="3"><a href="#" data-color="preset3"></a></li>
				<li class="preset4" data-preset="4"><a href="#" data-color="preset4"></a></li>
			</ul>
		</div>
	</div>
	<!--/End:Preset Style Chooser-->
	
    <!-- JS -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/price-range.js"></script>   
    <script src="js/main.js"></script>
	<script src="js/switcher.js"></script>
  </body>
</html>