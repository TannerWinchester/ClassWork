<?php
/****************************************************/
/* DATE             NAME                    DESCRIPTION
 * --------------------------------------------------
 * 9/17/2021    TANNER WINCHESTER   creation of modlog and refactoring of code
 ****************************************************/


    $fname = filter_input(INPUT_POST, 'fname');
    $lname = filter_input(INPUT_POST, 'lname');
    $phone = filter_input(INPUT_POST, 'phone');
    $esports = isset($_POST['esports']);
    if (is_null($esports)) {
        $esports = 0;
        
    } else {
        $esports = 1;
    }
    $hyper = isset($_POST['hyper']);
    if (is_null($hyper)) {
        $hyper = 0;
    } else {
        $hyper = 1;
    }
    $arcade = isset($_POST['arcade']);
    if (is_null($arcade)) {
        $arcade = 0;
    } else {
        $arcade = 1;
    }
    $members = isset($_POST['members']);
    if (is_null($members)) {
        $members = 0;
    } else {
        $members = 1;
    }
    $email = filter_input(INPUT_POST, 'email');
    $comments = filter_input(INPUT_POST, 'comments');
    $reference = filter_input(INPUT_POST, 'reference');
    
    /* echo "Fields: " . $visitor_name . $visitor_email . $visitor_msg;  */
    
    // Validate inputs
    if ($fname == null || $lname == null || 
            $email == null || $comments == null) {
        $error = "Invalid input data. Check all fields and try again.";
        /* include('error.php'); */
        $error = "Invalid input data. Check all fields and try again.";
        /* include('error.php'); */
        echo "Form Data Error: " . $error; 
        exit();
        } else {

            // Add the product to the database  
            require_once('./model/database.php');
            require_once('./model/visit.php');
            
            addVisit($fname, $lname, $email, $phone, $reference, $esports, $hyper, $arcade, $members, $comments);


}

?>

<!doctype html>
<!-- Student Name: Tanner Winchester -->

<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="description" content="The Grid Gaming Club offers hyper-reality experiences for Gaming enthusiasts.">
        <meta name="keywords" content="Gaming, Virtual reality, hyper-reality, VR, Arcade.">
        <meta name="author" content="Tanner Winchester">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
        <!-- Favicon -->
        <link rel="shortcut icon" href="images/favicon.ico">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32.png">
        <link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png">
        <link rel="icon" sizes="192x192" href="images/android-chrome-192.png">
        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Permanent+Marker&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Passion+One&display=swap" rel="stylesheet">
    
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/styles.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>The Grid Gaming</title>
    
        <!-- My Style Sheet -->
        <link rel="stylesheet" href="css/styles.css">
        <title>The Grid Gaming</title>
      </head>
  <body>
   
<!--     Bootstrap Navigation bar 
-->    <nav class="navbar navbar-expand-sm navbar-dark fixed-top bg-dark-maroon">
        <a class="navbar-brand" href="index.html">The Grid Gaming Club</a>
  
<!--         Hamburger menu icon -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="nabvarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="index.html">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="esports.html">E-Sports</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.html">Contact Us</a>
            </li>
            <li class="nav-item">
             <a class="nav-link" href="admin.php">Admin</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="listemployees.php">Emp List</a>
            </li>
          </ul>
        </div>
  
      </nav><!--
     Main Content Area -->
    <main class="container mt-5">
		
        <div class="text-center">
            <br><br>

            <h2 class="display-4 pt-3">Thank you.</h2> 					


        </div>
	
    </main>
         
    <!-- Footer -->
    <footer class="jumbotron-fluid text-center bg-dark-maroon p-5">

      <div class="containter text-white">
        <p>&copy; Copyright 2021. All Rights Reserved.</p>
        <p><a href="mailto:TheGrigGaming@gamil.com" class="text-white">TheGridGaming@gmail.com</a></p>
        <a href="https://www.facebook.com/" target="_blank"><img src="images/facebook-logo.png" alt="black and white Facebook logo" class="pr-4"></a>
        <a href="https://www.twitter.com/" target="_blank"><img src="images/twitter-logo.png" alt="black and white Twitter logo"></a>
      </div>
      
      </footer> 

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="scripts/script.js"></script>
  </body>
</html>