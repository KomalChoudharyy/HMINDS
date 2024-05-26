<?php 
session_start();

// Redirect if admin is already logged in
if(isset($_SESSION['admin']['adminnakalogin']) == true) {
    header("location:homea.php");
    exit();
}

// Redirect if examinee is already logged in
if(isset($_SESSION['examineeSession']['examineenakalogin']) == true) {
    header("location:home.php");
    exit();
}

include("login-ui/index.php");

?>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/sweetalert.js"></script>
