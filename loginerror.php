<?php
/* Displays all error messages */
session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
<link rel="shortcut icon" href="imagesNEW/favicon.ico" type="image/x-icon"> 

    <link rel="stylesheet" type="text/css" href="css/landing.css">
</head>
<body>
<div class="form" style="text-align:center; color:white;margin-top:30vh">
    <h1 style="color:white; font-size: 50px"><b>Error...</b></h1>
    <p>
    <?php 
    if( isset($_SESSION['message']) AND !empty($_SESSION['message']) ): 
        echo $_SESSION['message'];    
    else:
        header( "location: signup.php" );
    endif;
    ?>
    </p>     
    <a href="signup.php"><button class="button special" style="margin-top:5vh; font-size: 25px;" />Go back</button></a>
</div>
</body>
</html>
