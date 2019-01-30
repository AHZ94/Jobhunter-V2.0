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
    <link rel="stylesheet" href="/Jobhunter/Employer/css/style.css">
    
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
	
	<!-- Star Rating -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <!-- Star Rating -->
    
	<style>
		img {
	    display: block;
	    float:left;
		}
		
		.qualification2 {
		display:none;
		}
		
		.Objective2{
		display:none;
		}	
	</style>
	
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
									<li><a href="/Jobhunter/EmployerHandler?action=updateAccount&email=<c:out value="<%=email%>"/>">Profile Details</a></li>						
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
								<img src="images/job/4.png" alt="Image" class="img-responsive">
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
				</div><!-- job-ad-item -->
				
				<div class="job-details-info">
				<div class="row">
					<div class="col-sm-8">		
																							
							<div class="section job-description">																						
								<!-- Applicant -->
								<h2 align="center" >Leaderboard</h2>
								
								<div style="overflow-x:auto;">																				    					
	    						<c:forEach items="${list}" var="list" varStatus="status">	    							        									        							        						
	        						<table><tr><th>
	        						<img src="images/user.jpg" alt="User Images" class="img-responsive"></th></tr>
	        						<tr><td>
	        							<h3>Name: ${list.name} Average:${list.average}</h3></td></tr></table>																			
	    						</c:forEach><!-- User Profile -->									
	  							</div><!-- Applicant -->
								
	  							<div class="button" >
	  								<input type="button" name="Btn" id="Btn" value="Select Candidate" style="display: block; margin: 0 auto;">
	  							</div>
	  							
	  							
	  							<div class="modal" id="modal">	  								  						
									<div class="modal-content">
										
										<span class="close">&times;</span>
											<form method="post" action="/Jobhunter/ListHandler?action=updateApplies&email=<c:out value="<%=email%>"/>"><fieldset>																																																																			
												<div style="overflow-x:auto;">																				    					
						    						<c:forEach items="${list}" var="list" varStatus="status">	    							        									        							        						
						        						<table><tr><th>
						        						<img src="images/user.jpg" alt="User Images" class="img-responsive"></th></tr>
						        						<tr><td>
						        							<h3>${list.name}</h3></td></tr></table>					        						
						        							<input type="submit" value="Submit">
						        							<input type="hidden" value="${list.jobsid}" name="jobsid">
						        							<input type="hidden" value="${list.studid}" name="idd">
						        													        							
						        																										
						    						</c:forEach><!-- User Profile -->									
						  							</div><!-- Applicant -->					    																		  												  							    					    									    				
						  						</fieldset></form>
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
				</div>							
			</div><!-- job-ad-item -->
							
				<div class="job-details-info">
					<div class="row">										
						<div class="col-sm-8">
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
					</div><!-- row -->					
				</div><!-- job-details-info -->		
			</div><!-- job-details -->					
		</div><!-- container -->
	</section><!-- job-details-page -->		
	
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