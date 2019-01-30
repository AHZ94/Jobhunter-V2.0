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
      response.sendRedirect("/PizzaOrdering/login.jsp");
  
  

  String email = (String)session.getAttribute("currentSessionUser");%>
 <!-- /Javacript -->
 
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
							<li class="active"><a href="details.html">Job Details</a></li>
							<li><a href="resume.html">Resume</a></li> 
							<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Pages<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="profile.html">profile</a></li>
									<li><a href="post-resume.html">Post Resume</a></li>
									<li><a href="post.html">Job Post</a></li>
									<li><a href="edit-resume.html">Edit Resume</a></li>
									<li><a href="profile-details.html">profile Details</a></li>
									<li><a href="bookmark.html">Bookmark</a></li>
									<li><a href="applied-job.html">Applied Job</a></li>
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
	
	<section class="job-bg page job-details-page">
		<div class="container">			
			<div class="banner-form banner-form-full job-list-form">
				<form action="#">
					<!-- category-change -->
					<div class="dropdown category-dropdown">						
						<a data-toggle="dropdown" href="#"><span class="change-text">Job Category</span> <i class="fa fa-angle-down"></i></a>
						<ul class="dropdown-menu category-change">
							<li><a href="#">Customer Service</a></li>
							<li><a href="#">Software Engineer</a></li>
							<li><a href="#">Program Development</a></li>
							<li><a href="#">Project Manager</a></li>
							<li><a href="#">Graphics Designer</a></li>
						</ul>								
					</div><!-- category-change -->
					
					<!-- language-dropdown -->
					<div class="dropdown category-dropdown language-dropdown">
						<a data-toggle="dropdown" href="#"><span class="change-text">Job Location</span> <i class="fa fa-angle-down"></i></a>
						<ul class="dropdown-menu category-change language-change">
							<li><a href="#">Location 1</a></li>
							<li><a href="#">Location 2</a></li>
							<li><a href="#">Location 3</a></li>
						</ul>								
					</div><!-- language-dropdown -->
				
					<input type="text" class="form-control" placeholder="Type your key word">
					<button type="submit" class="btn btn-primary" value="Search">Search</button>
				</form>
			</div><!-- banner-form -->

			<div class="job-details">
				<div class="section job-ad-item">
					<div class="item-info">
						<div class="item-image-box">
							<div class="item-image">
								<img src="/Jobhunter/Employer/images/job/download.png" alt="Image" class="img-responsive">
							</div><!-- item-image -->
						</div>

						<div class="ad-info">
							<span><span><a href="#" class="title">${jobs.category}</a></span> @ <a href="#">${jobs.title}</a></span>
							<div class="ad-meta">
								<ul>
									<li><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i>${jobs.location}</a></li>
									<li><a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>${jobs.type}</a></li>
									<li><i class="fa fa-money" aria-hidden="true"></i>${jobs.minsalary} - ${jobs.maxsalary}</li>
									<li><a href="#"><i class="fa fa-tags" aria-hidden="true"></i>${jobs.function}</a></li>
									<li><a href="#"><i class="fa fa-hourglass-start" aria-hidden="true"></i>Job Posted: ${jobs.date}</a></li>
								</ul>
							</div><!-- ad-meta -->									
						</div><!-- ad-info -->
					</div><!-- item-info -->
					<div class="social-media">
						<div class="button">						
							<a href="#" id="Btn" class="btn btn-primary"><i class="fa fa-briefcase" aria-hidden="true"></i>Edit</a>														
							
							<div class="modal" id="modal">
								<div class="modal-content">
									<form name="PostJob" method="post" id="2" action="/Jobhunter/JobsHandler">
									<fieldset>									
										<div class="section postdetails">
										<span class="close">&times;</span>
											<h4>Post Your Job <span class="pull-right">* Mandatory Fields</span></h4>
											<input name="jobsid" id="jobsid" type="hidden" class="form-control" value="<c:out value="${jobs.jobsid}"/>">											
											<input name="empid" id="empid" type="hidden" class="form-control" value="<c:out value="<%=email %>"/>">																
											<input name="post" id="post" type="hidden" class="form-control" value="2">
											<input name="status" id="status" type="hidden" class="form-control" value="0">
											<div class="row form-group add-title">
												<label class="col-sm-3 label-title">Job Category</label>
												<div class="col-sm-9">											
														<!-- select -->
														<select class = "form-control" name="category" id="category" required >													
															<option value="Sales" selected="selected">1.Sales</option>
															<option value="Office">2.Office</option>
															<option value="Event">3.Event</option>
															<option value="Logistic">4.Logistic</option>
															<option value="Food_Beverage">5.Food & Beverage</option>																										
															<option value="Entertainment">6.Entertainment</option>
															<option value="Others">7.Others</option>
														</select><!-- select -->																			
												</div>
											</div>
											<div class="row form-group">
												<label class="col-sm-3 label-title">Title for your job<span class="required">*</span></label>
												<div class="col-sm-9">
													<input name="title" id="title" type="text" class="form-control" placeholder="ex, Human Resource Manager">
												</div>
											</div>
											<div class="row form-group brand-name">
												<label class="col-sm-3 label-title">Job Function<span class="required">*</span></label>
												<div class="col-sm-9">
													<input name="function" id="function" type="text" class="form-control" placeholder="human, reosurce, job, hrm">
												</div>
											</div>
											<div class="row form-group select-price">
												<label class="col-sm-3 label-title">Salary<span class="required">*</span></label>
												<div class="col-sm-9">
													<label>RM</label>
													<input name="maxsalary" id="maxsalary" type="text" class="form-control" placeholder="Min">
													<span>-</span>
													<input name="minsalary" type="text" class="form-control" placeholder="Max">
													<input type="radio" name="" value="" id="">
													<label for="negotiable">Negotiable </label>
												</div>
											</div>			
											<div class="row form-group">
												<label class="col-sm-3">Salary Type<span class="required">*</span></label>
												<div class="col-sm-9 user-type">
													<input type="radio" name="type" value="Hour" id="Hour"> <label for="Hour">Hour</label>
													<input type="radio" name="type" value="Days" id="Days"> <label for="Days">Days</label>
													<input type="radio" name="type" value="Weeks" id="Weeks"> <label for="weeks">Weeks</label>
													<input type="radio" name="type" value="Month" id="Month"> <label for="Month">Month</label>																							
												</div>
											</div>
											<div class="row form-group add-title">
												<label class="col-sm-3 label-title">Exprience<span class="required">*</span></label>
												<div class="col-sm-9">
													<div class="dropdown">
														<!-- select -->
														<a data-toggle="dropdown" href="#"></a>
														<select class = "form-control" name="experience" id="experience" required required>
															<option value="Low">Low-Level</option>
															<option value="Medium">Mid-Level</option>
															<option value="High">High-Level</option>													
														</select><!-- select -->								
													</div>
												</div>
											</div>
											<div class="row form-group add-title location">
												<label class="col-sm-3 label-title">Location<span class="required">*</span></label>
												<div class="col-sm-9">
													
													<div class="dropdown pull-left">	
														<!-- select -->
														<select class = "form-control" name="location" id="location" required >
															<option value="Wilayah Perseketuan">Wilayah Perseketuan</option>
															<option value="Selangor">Selangor</option>
															<option value="Johor">Johor</option>
															<option value="Kelantan">Kelantan</option>
															<option value="Negeri Sembilan">Negeri Sembilan</option>
															<option value="Melaka">Melaka</option>																										
															<option value="Pahang">Pahang</option>
															<option value="Perak">Perak</option>
															<option value="Perlis">Perlis</option>													
															<option value="Terengganu">Terengganu</option>
														</select><!-- select -->	
													</div>																						
													<div class="dropdown pull-right">	
														
													</div>											 								
												</div>										
											</div>
											<div class="row form-group date">										
												<label class="col-sm-3 label-title">Start Date<span class="required">*</span></label>
												<div class="col-sm-9">
												<input type="date" name="date">
												</div>
											</div>				
											<div class="row form-group item-description">
												<label class="col-sm-3 label-title">Description<span class="required">*</span></label>
												<div class="col-sm-9">
													<textarea name="description" id="description" class="form-control" id="textarea" placeholder="Write few lines about your jobs desciption" rows="8"></textarea>		
												</div>
											</div>
											<div class="row form-group item-description">
												<label class="col-sm-3 label-title">Requirement:<span class="required">*</span></label>
												<div class="col-sm-9">
													<textarea name="requirement" id="requirement" class="form-control" id="textarea" placeholder="Write few lines about your jobs requirement" rows="8"></textarea>		
												</div>
											</div>
											<div class="row characters">
												<div class="col-sm-9 col-sm-offset-3">
													<p>5000 characters left</p>
												</div>
											</div>																																																							
										</div>
										<!-- postdetails -->																															
										
										<div class="checkbox section agreement">									
											<button type="submit" class="btn btn-primary">Post Your Job</button>
										</div><!-- section -->
										
									</fieldset>
								</form><!-- form -->
								</div>
							</div>
							
							<script>							  
							  var modal = document.getElementById('modal');							
							  var btn = document.getElementById("Btn");
							  var span = document.getElementsByClassName("close")[0];
														   
							  btn.onclick = function() {
							      modal.style.display = "block";
							  }
														
							  span.onclick = function() {
							      modal.style.display = "none";
							  }
														
							  window.onclick = function(event) {
							      if (event.target == modal) {
							          modal.style.display = "none";
							      }
							  }
							</script>
						
							
						</div>											
					</div>					
				</div><!-- job-ad-item -->
					
				<div class="job-details-info">
					<div class="row">									
						<div class="col-sm-8">				
							<div class="section job-description" >																						
								<!-- Applicant -->
								<h2 align="center" >Current Employee: </h2>
								
								<div class="profile">							  							        							        																							    																											    								
									<div class="center">	        							        						
	        							<img src="images/user.jpg" alt="User Images" class="img-responsive" align="middle"><br>	        																								    																											    								
									</div>
												    							   										      					
	        						
	        						<div  class="personal-info">
	        						<div  class="address">
	        							<c:set var="studid" value="${jobs.studid}"></c:set>
	        							<c:choose>
	        							<c:when test="${studid == '0'}">No current employee selected! Select now.<br>	        								
	        								<a href="/Jobhunter/JobsHandler?action=Applydetails&jobsid=<c:out value="${jobs.jobsid}" />&email=<c:out value="<%=email%>" />" >
	        								<button type="submit">Select Candidate</button></a>
	        							</c:when>	        							
	        							
	        							<c:otherwise><div class="personal-info">				    	
										        <ul class="address">
										            <li><h5>Name </h5> :<c:out value="${stud.name}" /></li>				            
										            <li><h5>Phone </h5> :<c:out value="${stud.phone}" /></li>
										            <li><h5>Email</h5> :<c:out value="${stud.email}" /></li>
										            <li><h5>Certificate</h5> :<c:out value="${stud.certificate}" /></li>
										            <li><h5>Universities</h5> :<c:out value="${stud.background}" /></li>
										            <li><h5>Address</h5> :<c:out value="${stud.address}" /></li>				            				            
										        </ul></div>
										        </c:otherwise>
	        							</c:choose>
	        						</div></div>	        							        							        								        																																					
									<!-- User Profile -->
																									    											
	  							</div><!-- Applicant -->
	  						</div>	
							<div class="section job-description">
								<div class="description-info">
									<h1>Description</h1>
									<h4>${jobs.description}</h4>
								</div>								
								<div class="requirements">
									<h1>Minimum Requirements</h1>
									<h4>${jobs.requirement}</h4>
								</div>							
							</div>							
						</div>
						
						<div class="col-sm-4">
							<div class="section job-short-info">
								<h1>Short Info</h1>
								<ul>
									<li><span class="icon"><i class="fa fa-bolt" aria-hidden="true"></i></span>Posted: 1 day ago</li>
									<li><span class="icon"><i class="fa fa-user-plus" aria-hidden="true"></i></span> Job poster: <a href="#">Lance Ladaga</a></li>
									<li><span class="icon"><i class="fa fa-industry" aria-hidden="true"></i></span>Industry: <a href="#">Marketing and Advertising</a></li>
									<li><span class="icon"><i class="fa fa-line-chart" aria-hidden="true"></i></span>Experience: <a href="#">Entry level</a></li>
									<li><span class="icon"><i class="fa fa-key" aria-hidden="true"></i></span>Job function: Advertising,Design, Art/Creative</li>
								</ul>
							</div>
													</div>
					</div><!-- row -->					
				</div><!-- job-details-info -->				
			</div><!-- job-details -->
		</div><!-- container -->
	</section><!-- job-details-page -->

	<section id="something-sell" class="clearfix parallax-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<h2 class="title">Add your resume and let your next job find you.</h2>
					<h4>Post your Resume for free on <a href="#">Jobs.com</a></h4>
					<a href="post-resume.html" class="btn btn-primary">Add Your Resume</a>
				</div>
			</div><!-- row -->
		</div><!-- contaioner -->
	</section><!-- something-sell -->
	
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