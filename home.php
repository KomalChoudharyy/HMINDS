<?php 
session_start();

include("conn.php");

// Check if the examinee is logged in
if(!isset($_SESSION['examineeSession']['examineenakalogin'])) {
    header("location:login.php");
    exit(); // Make sure to stop further execution
}


// Include header
include("includes/header.php");
?>

<div class="app-main">

<?php include("includes/sidebar.php"); ?>

<?php 
// Include requested page
@$page = $_GET['page'];

if($page != '') {
    if($page == "exam") {
        include("pages/exam.php");
    } else if($page == "result") {
        include("pages/result.php");
    } else if($page == "myscores") {
        include("pages/myscores.php");
    }
} else {
    include("pages/home.php"); 
}

?> 

<?php 
// Include footer and modals
include("includes/footer.php");
include("includes/modals.php");
?>
