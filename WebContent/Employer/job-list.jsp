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
					<a class="navbar-brand" href="/Jobhunter_V2.0/Employer/Emp-index.jsp"><img class="img-responsive" src="images/logo.png" alt="Logo"></a>
				</div>
				<!-- /navbar-header -->
				
				<div class="navbar-left">
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="/Jobhunter_V2.0/Employer/Emp-index.jsp">Home</a></li>
							<li class="active"><a href="job-list.html">Job list</a></li>
							<li><a href="details.html">Job Details</a></li>
							<li><a href="resume.html">Resume</a></li> 
							<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Pages<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="profile.html">Profile</a></li>
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

	<section class="job-bg page job-list-page">
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
	
			<div class="category-info">	
				<div class="row">
					<div class="col-md-3 col-sm-4">
						<div class="accordion">
							<!-- panel-group -->
							<div class="panel-group" id="accordion">
							 	
								<!-- panel -->
								<!-- panel -->
								<div class="panel panel-default panel-faq">
									<!-- panel-heading -->
									<div class="panel-heading">
										<div  class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#accordion-one">
												<h4>Categories<span class="pull-right"><i class="fa fa-minus"></i></span></h4>
											</a>
										</div>
									</div><!-- panel-heading -->

									<div id="accordion-one" class="panel-collapse collapse in">
										<!-- panel-body -->
										<div class="panel-body">
											<h5><a href="categories-main.jsp"><i class="fa fa-caret-down"></i> All Categories</a></h5>
											<a href="#"><i class="icofont icofont-man-in-glasses"></i>Jobs Type</a>
											<ul>
												<li><a href="#">Sales<span>(Type:5)</span></a></li>
												<li><a href="#">Office<span>(Type:5)</span></a></li>
												<li><a href="#">Event<span>(Type:4)</span></a></li>
												<li><a href="#">Logistic<span>(Type:4)</span></a></li>
																						
											</ul>
											<div class="see-more">
												<button type="button" class="show-more one"><i class="fa fa-plus-square-o" aria-hidden="true"></i>See More</button>
												<ul class="more-category one">
													<li><a href="#">Food&Beverage<span>(Type:4)</span></a></li>
												<li><a href="#">Entertainment<span>(Type:3)</span></a></li>
												<li><a href="#">Others<span>(Type:1)</span></a></li>		
												</ul>
											</div>

										</div><!-- panel-body -->
									</div>
								</div><!-- panel -->

								<!-- panel -->
								<div class="panel panel-default panel-faq">
									<!-- panel-heading -->
									<div class="panel-heading">
										<div  class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#accordion-two">
												<h4>Date Posted <span class="pull-right"><i class="fa fa-plus"></i></span></h4>
											</a>
										</div>
									</div><!-- panel-heading -->

									<div id="accordion-two" class="panel-collapse collapse">
										<!-- panel-body -->
										<div class="panel-body">
										
										<form name="getPosts" method="post" action="/Jobhunter/ListHandler">
										<input type="hidden" name="action" id="action" value="filter">
										<input type="hidden" name="id" id="id" value="<c:out value="<%=email%>"/>">										
										
											Start Date:<input name="date" type="date" id="date" class="date"><br>
											End Date:<input name="date1" type="date" id="date1" class="date1"><br><br>
																						
											  <input type="radio"  name="type" value="Hour">Hour<br>
											  <input type="radio"  name="type" value="Day">Day<br>
											  <input type="radio"  name="type" value="Week">Week<br>
											  <input type="radio"  name="type" value="Month">Month<br><br>
											  																						
											  <input type="submit" value="Search"><br>	
																					
										</form>
									
										</div><!-- panel-body -->
										
										
									</div>
								</div><!-- panel -->

								<!-- panel -->
								<div class="panel panel-default panel-faq">
									<!-- panel-heading -->
									<div class="panel-heading">
										<div class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#accordion-three">
												<h4>
												Salary Range
												<span class="pull-right"><i class="fa fa-plus"></i></span>
												</h4>
											</a>
										</div>
									</div><!-- panel-heading -->

									<div id="accordion-three" class="panel-collapse collapse">
										<!-- panel-body -->
										<div class="panel-body">
											<div class="price-range"><!--price-range-->
												<div class="price">
													<span>$100 - <strong>$700</strong></span>
													<div class="dropdown category-dropdown pull-right">	
														<a data-toggle="dropdown" href="#"><span class="change-text">USD</span><i class="fa fa-caret-square-o-down"></i></a>
														<ul class="dropdown-menu category-change">
															<li><a href="#">USD</a></li>
															<li><a href="#">AUD</a></li>
															<li><a href="#">EUR</a></li>
															<li><a href="#">GBP</a></li>
															<li><a href="#">JPY</a></li>
														</ul>								
													</div><!-- category-change -->													
													 <input type="text" value="" data-slider-min="0" data-slider-max="700" data-slider-step="5" data-slider-value="[250,450]" id="price" ><br />
												</div>
											</div><!--/price-range-->
										</div><!-- panel-body -->
									</div>
								</div><!-- panel -->

								<!-- panel -->
								<div class="panel panel-default panel-faq">
									<!-- panel-heading -->
									<div class="panel-heading">
										<div class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#accordion-four">
												<h4>Employment Type<span class="pull-right"><i class="fa fa-plus"></i></span></h4>
											</a>
										</div>
									</div><!-- panel-heading -->

									<div id="accordion-four" class="panel-collapse collapse">
										<!-- panel-body -->
										<div class="panel-body">
											<label for="full-time"><input type="checkbox" name="full-time" id="full-time"> Full Time</label>
											<label for="part-time"><input type="checkbox" name="part-time" id="part-time"> Part Time</label>
											<label for="contractor"><input type="checkbox" name="contractor" id="contractor"> Contractor</label>
											<label for="intern"><input type="checkbox" name="intern" id="intern"> Intern</label>
											<label for="seasonal"><input type="checkbox" name="seasonal" id="seasonal"> Seasonal / Temp</label>
										</div><!-- panel-body -->
									</div>
								</div><!-- panel -->

								<!-- panel -->
								<div class="panel panel-default panel-faq">
									<!-- panel-heading -->
									<div class="panel-heading">
										<div class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#accordion-five">
												<h4>Experience Level<span class="pull-right"><i class="fa fa-plus"></i></span></h4>
											</a>
										</div>
									</div><!-- panel-heading -->

									<div id="accordion-five" class="panel-collapse collapse">
										<!-- panel-body -->
										<div class="panel-body">
											<label for="training"><input type="checkbox" name="training" id="training"> Training</label>
											<label for="entry-level"><input type="checkbox" name="entry-level" id="entry-level"> Entry Level</label>
											<label for="mid-senior"><input type="checkbox" name="mid-senior" id="mid-senior"> Mid-Senior Level</label>
											<label for="top-level"><input type="checkbox" name="top-level" id="top-level"> Top Level</label>
										</div><!-- panel-body -->
									</div>
								</div> <!-- panel -->

								<!-- panel -->
								<div class="panel panel-default panel-faq">
									<!-- panel-heading -->
									<div class="panel-heading">
										<div class="panel-title"></div>
										<a data-toggle="collapse" data-parent="#accordion" href="#accordion-six">
											<h4>Company<span class="pull-right"><i class="fa fa-plus"></i></span></h4>
										</a>
									</div><!-- panel-heading -->

									<div id="accordion-six" class="panel-collapse collapse">
										<!-- panel-body -->
										<div class="panel-body">
											<input type="text" placeholder="Search Company" class="form-control">
											<label for="apple"><input type="checkbox" name="apple" id="apple"> Apple</label>
											<label for="dropbox"><input type="checkbox" name="dropbox" id="dropbox"> Dropbox</label>
											<label for="micromax"><input type="checkbox" name="micromax" id="micromax"> Micromax</label>
											<label for="nokia"><input type="checkbox" name="nokia" id="nokia"> Nokia</label>
											<label for="microsoft"><input type="checkbox" name="microsoft" id="microsoft"> Microsoft</label>
											<label for="samsung"><input type="checkbox" name="samsung" id="samsung"> Samsung</label>
											<div class="see-more">
												<button type="button" class="show-more two"><i class="fa fa-plus-square-o" aria-hidden="true"></i>See More</button>
												<div class="more-category two">
													<label for="blackBerry"><input type="checkbox" name="blackBerry" id="blackBerry">BlackBerry</label>
													<label for="motorola"><input type="checkbox" name="motorola" id="motorola">Motorola</label>
													<label for="lenovo"><input type="checkbox" name="lenovo" id="lenovo">Lenovo</label>
												</div>
											</div>											
										</div><!-- panel-body -->
									</div>
								</div> <!-- panel -->

								<!-- panel -->
								<div class="panel panel-default panel-faq">
									<!-- panel-heading -->
									<div class="panel-heading">
										<div class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#accordion-seven">
												<h4>Location<span class="pull-right"><i class="fa fa-plus"></i></span></h4>
											</a>
										</div>
									</div><!-- panel-heading -->

									<div id="accordion-seven" class="panel-collapse collapse">
										<!-- panel-body -->
										<div class="panel-body">
											<input type="text" placeholder="Search Location" class="form-control">
											<label for="angeles"><input type="checkbox" name="angeles" id="angeles"> Los Angeles, CA</label>
											<label for="kingdom"><input type="checkbox" name="kingdom" id="kingdom"> United Kingdom</label>
											<label for="states"><input type="checkbox" name="states" id="states"> United States</label>
											<label for="columbia"><input type="checkbox" name="columbia" id="columbia"> British Columbia</label>
											<label for="australia"><input type="checkbox" name="australia" id="australia"> Australia</label>
											<label for="germany"><input type="checkbox" name="germany" id="germany"> Germany</label>
											<div class="see-more">
												<button type="button" class="show-more three"><i class="fa fa-plus-square-o" aria-hidden="true"></i>See More</button>
												<div class="more-category three">
													<label for="belgium"><input type="checkbox" name="belgium" id="belgium">Belgium</label>
													<label for="brazil"><input type="checkbox" name="brazil" id="brazil">Brazil</label>
													<label for="denmark"><input type="checkbox" name="denmark" id="denmark">Denmark</label>
													<label for="indonesia"><input type="checkbox" name="indonesia" id="indonesia">Indonesia</label>
												</div>
											</div>											
										</div><!-- panel-body -->
									</div>
								</div> <!-- panel -->

							 </div><!-- panel-group -->
						</div>
					</div><!-- accordion-->

					<!-- recommended-ads -->
					<div class="col-sm-8 col-md-7">				
						<div class="section job-list-item">
							<div class="featured-top">
								<h4>Showing 1-25 of 65,712 ads</h4>
								<div class="dropdown pull-right">
									<div class="dropdown category-dropdown">
										<h5>Sort by:</h5>						
										<a data-toggle="dropdown" href="#"><span class="change-text">Most Relevant</span><i class="fa fa-caret-square-o-down"></i></a>
										<ul class="dropdown-menu category-change">
											<li><a href="#">Most Relevant</a></li>
											<li><a href="#">Most Popular</a></li>
										</ul>								
									</div><!-- category-change -->		
								</div>							
							</div><!-- featured-top -->	

							<!-- Jobslist -->
							<div style="overflow-x:auto;">												    					
    						<c:forEach items="${list}" var="list" varStatus="status">
        						<div class="job-ad-item">        						
        						<button class="close" id="myBtn" >&times;</button>        																																

								<div class="item-info">
									<div class="item-image-box">
										<div class="item-image">
											<c:set var="jobsid" value="${list.jobsid}"/><a href="/Jobhunter_V2.0/JobsHandler?action=details&jobsid=<c:out value="${list.jobsid}" />"><img src="/Jobhunter/Employer/images/job/download.png" alt="Image" class="img-responsive"></a>
										</div><!-- item-image -->
									</div>

									<div class="ad-info">
										<span><c:set var="jobsid" value="${list.jobsid}"/><a href="/Jobhunter_V2.0/JobsHandler?action=details&jobsid=<c:out value="${list.jobsid}" />">${list.title}</a></span>										
										<div class="ad-meta">
											<ul>
												<li><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i>${list.location}</a></li>
												<li><a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>${list.type}</a></li>
												<li><a href="#"><i class="fa fa-money" aria-hidden="true"></i>RM ${list.minsalary} - RM ${list.maxsalary}</a></li>												
											</ul>
										</div><!-- ad-meta -->																		
									</div><!-- ad-info -->																	
								</div><!-- item-info -->															
							</div><!-- job-ad-item -->
    						</c:forEach>							
  							</div>
							<!-- Joblist -->							
	
							
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

					<div class="col-md-2 hidden-xs hidden-sm">
						<div class="advertisement text-center">
							<a href="#"><img src="images/ads/1.jpg" alt="" class="img-responsive"></a>
						</div>
					</div>
				</div>	
			</div>
		</div><!-- container -->
	</section><!-- main -->
	
	
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