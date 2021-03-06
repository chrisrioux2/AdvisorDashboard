<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Advisor Dashboard</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/grayscale.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="index.jsp">
                    <i class="fa fa-play-circle"></i>  <span class="light">Dashboard</span> Home
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <li class="nav-item"><a class="nav-link page-scroll" href="index.jsp">Login</a></li>
                    </li>
                    <li>
                        <li class="nav-item"><a class="nav-link page-scroll" href="#contact">Connect</a></li>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container -->
    </nav>

    <!-- Gosling --> 
	<div class="container-fluid" style="margin-top:125px;text-align:center;">
		<div class="row" id="gosling">
			<h5 class="text-xs-center">Looks like something happened, <br/> But Ryan was here to handle it...</h5>
		    	<ul class="list-inline banner-social-buttons center-block">
                    <li>
                        <a href="index.jsp" class="btn btn-default btn-lg center-block"><i class="fa fa-home fa-fw"></i> <span class="network-name">Home</span></a>
                    </li>
                </ul>
			<a href="https://www.facebook.com/ryangoslingofficialpage/" target="_blank"><img class="img-responsive center-block" src="img/gosling404.jpeg"/></a>
		</div><!-- /.row -->
	</div>


    <!-- Contact Section -->
    <section id="contact" class="container content-section text-center" style="margin-top:-100px;">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Let's Connect</h2>
                <p>Special thanks to <a href="https://unsplash.com/">Unsplash</a>, <a href="http://startbootstrap.com/">Start Bootstrap</a> and <a href="http://skilldistillery.com/">Skill Distillery!</a></p>
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="https://twitter.com/chrisrioux_" target="_blank" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                    </li>
                    <li>
                        <a href="https://github.com/chris-rioux" target="_blank" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                    </li>
                    <li>
                        <a href="https://www.linkedin.com/in/chrisrioux" target="_blank" class="btn btn-default btn-lg"><i class="fa fa-linkedin-square fa-fw"></i> <span class="network-name">LinkedIn</span></a>
                    </li>
                </ul>
            <p>Copyright &copy; <a href="http://www.chrisriouxapplications.com" target="_blank">Chris Rioux Applications</a> 2016</p>                
            </div>
        </div>
    </section>

    <!-- Map Section -->
    <div id="map"></div>
    

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>

    <!-- Google Maps API Key -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSSAAWotmJGQ1HzdUQHGJTHUm7m8cG2RU"></script> 
  
    <!-- Custom Theme JavaScript -->
    <script src="js/grayscale.js"></script>
    
    <!-- Enable Bootstrap Pop-Over -->
    <script>
    $(function () {
  		$('[data-toggle="popover"]').popover()
	})
	</script>
	
	<!-- jQuery Image Resizer -->
    <script>
    var logoHeight = $('#gosling img').height();
    if (logoHeight < 104) {
        var margintop = (104 - logoHeight) / 2;
        $('#gosling img').css('margin-top', margintop);
    }
    </script>
    
</body>

</html>