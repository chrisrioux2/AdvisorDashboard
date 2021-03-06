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
    
    <!-- jQuery DataTable -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<!-- Logout Test -->
	<c:if test="${status == 'out'}">
		<script>
			location.href = "index.jsp";
		</script>
	</c:if> 
	
	<c:if test="${status == 'in'}">
    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                   
                    <c:choose>
                    	<c:when test="${empty user}">
		                    <li>
		                        <li class="nav-item"><a class="nav-link page-scroll" href="index.jsp">Login</a></li>
		                    </li>
                    	</c:when>  
                    	<c:otherwise>
                    		<li>
		                        <li class="nav-item"><a class="nav-link page-scroll" href="#">Logged in as ${user.name}</a></li>
		                    </li>
		                    <li>
		                        <li class="nav-item"><a class="nav-link page-scroll" id="logout" href="Logout.do">Log Out</a></li>
		                    </li>
                    	</c:otherwise>                  
                    </c:choose>
                    
                    
                    <li>
                        <li class="nav-item"><a class="nav-link page-scroll" href="#contact">Connect</a></li>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container -->
    </nav>
    
    <!-- Add Advisor Section -->
    <section id="addAvisor" class="container content-section text-center" style="margin-top:-100px;">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Add an Advisor</h2>
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="GoToAddAdvisor.do" class="btn btn-default btn-lg">Add Advisor</a>
                    </li>
                    
                </ul>
            </div>
        </div><!-- /.row -->
    </section>

    <!-- Table Section -->
    <section id="table" class="container content-section text-center" style="margin-top:-225px;">
        <div class="row">
            <div class="col-lg-12">
				<table id="allAdvisors" class="display compact" cellspacing="0"
					width="100%">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Salary</th>
							<th>Position</th>
							<th>Location</th>
						</tr>
					</thead>
					<tbody>
 						<c:forEach var="row" items="${advisors}">
							<tr>
								<td><a href="GetAdvisor.do?id=${row.id}">${row.id}</a></td>
								<td>${row.name}</td>
								<td><fmt:formatNumber value="${row.salary}" type="currency"></fmt:formatNumber></td>
								<td>${row.position.positionName}</td>
								<td>${row.location.address} ${row.location.city}, ${row.location.country}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="container content-section text-center" style="margin-top:-100px;">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
            	<p>Copyright &copy; <a href="http://www.chrisriouxapplications.com" target="_blank">Chris Rioux Applications</a> 2016</p>                
            </div>
        </div>
    </section>
    

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/grayscale.js"></script>
    
    <!-- jQuery DataTable -->
	<script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>

	<script>
    	$(document).ready(function() {
        	$('#allAdvisors').DataTable( {
        		scrollY:        '50vh',
	            scrollCollapse: true	
        	} );
    	} );
    </script>
    
    <!-- jQuery Logout Function -->
	<script>
	$('a#logout').click(function() {
	    $.ajax({
	        url: "",
	        context: document.body,
	        success: function(s,x){

	            $('html[manifest=saveappoffline.appcache]').attr('content', '');
	                $(this).html(s);
	        }
	    }); 
	});
	</script>
    
    </c:if>
</body>

</html>