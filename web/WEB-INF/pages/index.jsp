<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/-->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOC TYPE html>
<html>
<head>
<title>Two-Bytes Bootstrap Website Template| Home :: w3layouts</title>
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="./css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--web-fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!--js-->
<script src="./js/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="./js/move-top.js"></script>

<script type="text/javascript" src="./js/easing.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});





	</script>
<!-- //end-smoth-scrolling -->
</head>
<body> 
<!--header start here-->
 <div class="header">
 	  <div class="container">
 	       <div class="header-main home">
 	        	<div class="logo">
 	        		<a href="index.jsp"><img src="./images/logo.png" alt=""></a>
 	        	</div> 
 	        	<span class="menu"> <img src="./images/icon.png"> </span>
 	        	<div class="header-navg">
 	        		<ul class="res">
 	        			<li><a class="active" href="index.jsp">HOME</a></li>
 	        			<li><a href="no use/aboutus.html">ABOUT US</a></li>
 	        			<li><a href="no use/jobs.html">JOBS</a></li>
 	        			<li><a href="no use/clients.html">CLIENTS</a></li>
 	        			<li><a href="no use/employers.html">EMPLOYERS</a></li>
 	        			<li><a href="no use/contactus.html">CONTACT US</a></li>
 	        		</ul>
 	        		 <script>
			                                                      $( "span.menu").click(function() {
			                                                                                        $(  "ul.res" ).slideToggle("slow", function() {
			                                                                                         // Animation complete.
			                                                                                         });
			                                                                                         });
		                                                     </script>
 	        	</div>
 	        	<div class="clearfix"> </div>
 	       </div>
 	       <div class="header-bottom">
 	       	     <h1>l'm looking for..</h1>
 	       	     <form method="post" action="servlet">
 	       	     	<input id="txtSearch" type="text" name="stockid">
 	       	     	<input type="submit"  class="ser" value="Search"><br>
 	       	      <label class="checkbox" >
 	       	             <input type="checkbox" value="checked">
 	       	              Full Time
 	       	      </label>
 	       	      <label class="checkbox" >
 	       	           <input type="checkbox" value="checked">
 	       	           Part Time/Casual/Freelance
 	       	      </label>

 	       	     </form>                
 	       </div>
 	  </div>
 </div>
 <div class="intro-strip"> </div>
<!--about start here-->
 <div class="intro">
 	  <div class="container">
 	  	<div class="intro-main">
 	  		    <h2>We're leaders in</h2>
 	  		    <h3>Creative Digital Recruitmemt</h3>
 	  		    <span class="b"> </span>
 	  		    <p>Based in Surry Hills, the creative hub of Sydney we are surrounded by creativity<br>and that reflects on the type of jobs we recruit for. </p>
 	  	        <h4><a href="#"> FIND OUT MORE ABOUT US!</a></h4>
 	  	</div> 
 	  	<div class="clearfix"> </div>	 
 	 </div>
 </div>
</body>
<!--contant start here-->
</html>