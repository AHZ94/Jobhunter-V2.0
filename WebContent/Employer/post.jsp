<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   
<!DOCTYPE html>

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
					<a class="navbar-brand" href="index.jsp"><img class="img-responsive" src="images/logo.png" alt="Logo"></a>
				</div>
				<!-- /navbar-header -->
				
				<div class="navbar-left">
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="/Jobhunter_V2.0/Employer/Emp-index.jsp">Home</a></li>
							<li><a href="/Jobhunter/ListHandler?action=viewList&email=<c:out value="<%=email%>"/>">Job List</a></li>
							<li><a href="/Jobhunter/ListHandler?action=applyListss&email=<c:out value="<%=email%>"/>">Apply Jobs</a></li>														
							<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Pages<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/Jobhunter/EmployerHandler?action=viewAccount&email=<c:out value="<%=email%>"/>">Profile</a></li>																																									
									<li><a href="/Jobhunter/JobsHandler?action=createJobs&email=<c:out value="<%=email%>"/>">Job Post</a></li>			
									<li><a href="/Jobhunter/ListHandler?action=viewList&email=<c:out value="<%=email %>"/>">Job List</a></li>
									<li><a href="/Jobhunter/ListHandler?action=applyListss&email=<c:out value="<%=email%>"/>">Apply Jobs</a></li>									
									<li><a href="/Jobhunter/EmployerHandler?action=Logout">Logout</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div><!-- navbar-left -->
				
				
			</div><!-- container -->
		</nav><!-- navbar -->
	</header><!-- header -->

	<section class=" job-bg ad-details-page">
		<div class="container">

			<div class="job-postdetails">
				<div class="row">	
					<div class="col-md-8">
						<form name="PostJob" method="post" action="/Jobhunter/JobsHandler">			
							<fieldset>
								<div class="section postdetails">
									<h4>Post Your Job <span class="pull-right">* Mandatory Fields</span></h4>
									<input name="empid" id="empid" type="hidden" class="form-control" value="<c:out value="<%=email %>"/>">																
									<input name="post" id="post" type="hidden" class="form-control" value="1">
									<input name="status" id="status" type="hidden" class="form-control" value="0">
									<div class="row form-group add-title">
										<label class="col-sm-3 label-title">Job Category</label>
										<div class="col-sm-9">											
												<!-- select -->
												<select class = "form-control" name="category" id="category" required required>													
													<option value="Sales" >1.Sales</option>
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
				

					<!-- quick-rules -->	
					<div class="col-md-4">
						<div class="section quick-rules">
							<h4>Quick rules</h4>
							<p class="lead">Posting an ad on <a href="/Jobhunter/Employer/Emp-index.jsp">Jobhunter.com</a> is free! However, all ads must follow our rules:</p>

							<ul>
								<li>Make sure you post in the correct category.</li>
								<li>Do not post the same ad more than once or repost an ad within 48 hours.</li>
								<li>Do not upload pictures with watermarks.</li>
								<li>Do not post ads containing multiple items unless it's a package deal.</li>
								<li>Do not put your email or phone numbers in the title or description.</li>
								<li>Make sure you post in the correct category.</li>
								<li>Do not post the same ad more than once or repost an ad within 48 hours.</li>
								<li>Do not upload pictures with watermarks.</li>
								<li>Do not post ads containing multiple items unless it's a package deal.</li>
							</ul>
						</div>
					</div><!-- quick-rules -->	
				</div><!-- photos-ad -->				
			</div>	
		</div><!-- container -->
	</section><!-- main -->		
	
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