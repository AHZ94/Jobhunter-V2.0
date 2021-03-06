<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
							<li class="active"><a href="index.jsp">Home</a></li>
							<li><a href="signin.jsp">Job list</a></li>
							<li><a href="signin.jsp">Apply Jobs</a></li>							 
							<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Pages<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="signin.jsp">Profile</a></li>																									
									<li><a href="signin.jsp">Profile Details</a></li>
									<li><a href="signin.jsp">Applied Job</a></li>
									<li><a href="signin.jsp">Bookmark</a></li>
									<li><a href="signin.jsp">Job list</a></li>									
									<li><a href="signin.jsp">Sign In</a></li>									
								</ul>
							</li>
						</ul>
					</div>
				</div><!-- navbar-left -->
				
				<!-- nav-right -->
				<div class="nav-right">				
					<ul class="sign-in">
						<li><i class="fa fa-user"></i></li>
						<li><a href="signin.jsp">Sign In</a></li>
						<li><a href="signup.jsp">Register</a></li>
					</ul><!-- sign-in -->					

					<a href="post.jsp" class="btn">Post Your Job</a>
				</div>
				<!-- nav-right -->
			</div><!-- container -->
		</nav><!-- navbar -->
	</header><!-- header -->

	<section class="job-bg user-page">
		<div class="container">
			<div class="row text-center">
				<!-- user-login -->			
				<div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
					<div class="user-account job-user-account">
						<h2>Create An Account</h2>
							<ul class="nav nav-tabs text-center" role="tablist">
								<li role="presentation" class="active"><a href="#find-job" aria-controls="find-job" role="tab" data-toggle="tab">Student</a></li>
								<li role="presentation"><a href="#post-job" aria-controls="post-job" role="tab" data-toggle="tab">Employer</a></li>
							</ul>

							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="find-job">
									<form name="form1" method="post" id="ff" action="RegisterHandler">
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Name" id="name" name="name" required>
										</div>
										<div class="form-group">
											<input type="email" class="form-control" placeholder="Email" id="email" name="email" required>
										</div>
										<div class="form-group">											
											<input type="password" class="form-control" placeholder="Password" name="password" id="pass1" required required>
										</div>
										<div class="form-group">
											<input type="password" class="form-control" placeholder="Confirm Password" name="password2" id="pass2" onkeyup="checkPass(); return false;" required>
											<span id="confirmMessage" class="confirmMessage"></span>
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Mobile Number"  name="phone" id="phone">
										</div>
										<!-- select -->
										<select class = "form-control" name="certificate" id="certificate" required required>
											<option value="#">Select certificate</option>
											<option value="SPM">SPM</option>
											<option value="STPM">STPM</option>
											<option value="DIPLOMA">DIPLOMA</option>
											<option value="DEGREE">DEGREE</option>
										</select><!-- select -->
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Universities" name="background" id="background" required required>
										</div>
										<div class="form-group">
											<textarea class="form-control" placeholder="Address"  name="address" id="address" style="width:450px; height:150px"></textarea>
										</div>
										<div class="checkbox">
											<label class="pull-left checked" for="signing"><input type="checkbox" name="signing" id="signing"> By signing up for an account you agree to our Terms and Conditions </label>
										</div><!-- checkbox -->	
										<button type="submit" class="btn">Registration</button>	
									</form>
								</div>
								<div role="tabpanel" class="tab-pane" id="post-job">
									<form name="form1" method="post" id="ff" action="EmployerRegisterHandler">
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Employer Name" id="name2" name="name2" required>
										</div>
										<div class="form-group">
											<input type="email" class="form-control" placeholder="Email" id="email2" name="email2" required>
										</div>
										<div class="form-group">
											<input type="password" class="form-control" placeholder="Password" id="password2" name="password2">
										</div>
										<div class="form-group">
											<input type="password" class="form-control" placeholder="Confirm Password" id="pass2" name="pass2">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Contact Number" id="phone2" name="phone2">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Company Name" id="compname" name="compname" required>
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Company Industry" id="industry" name="industry" required>
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Company Address" id="address2" name="address2" required>
										</div>
										<div class="checkbox">
											<label class="pull-left checked" for="signing-2"><input type="checkbox" name="signing-2" id="signing-2">By signing up for an account you agree to our Terms and Conditions</label>
										</div><!-- checkbox -->	
										<button type="submit" class="btn">Registration</button>	
									</form>
								</div>
							</div>				
					</div>
				</div><!-- user-login -->			
			</div><!-- row -->	
		</div><!-- container -->
	</section><!-- signup-page -->

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