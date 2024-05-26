
<?php 
 include("conn.php");


extract($_POST);

$fullname = isset($_POST['exFullname']) ? $_POST['exFullname'] : "";
$email = isset($_POST['exEmail']) ? $_POST['exEmail'] : "";
$gender = isset($_POST['exGender']) ? $_POST['exGender'] : "";
$course = isset($_POST['exCourse']) ? $_POST['exCourse'] : "";
$bdate = isset($_POST['exBdate']) ? $_POST['exBdate'] : "";
$password = isset($_POST['exPass']) ? $_POST['exPass'] : "";


$selExamineeFullname = $conn->query("SELECT * FROM examinee_tbl WHERE exmne_fullname='$fullname' ");
$selExamineeEmail = $conn->query("SELECT * FROM examinee_tbl WHERE exmne_email='$email' ");


if($gender == "0")
{
	$res = array("res" => "noGender");
}
else if($course == "0")
{
	$res = array("res" => "noCourse");
}

else if($selExamineeFullname->rowCount() > 0)
{
	$res = array("res" => "fullnameExist", "msg" => $fullname);
}
else if($selExamineeEmail->rowCount() > 0)
{
	$res = array("res" => "emailExist", "msg" => $email);
}
else
{
	$insData = $conn->query("INSERT INTO examinee_tbl(exmne_fullname,exmne_course,exmne_gender,exmne_birthdate,exmne_email,exmne_password) VALUES('$fullname','$course','$gender','$bdate','$email','$password')  ");
	if($insData)
	{
		$res = array("res" => "success", "msg" => $email);
	}
	else
	{
		$res = array("res" => "failed");
	}
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>HMINDS EDUCATION </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">


    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"><link rel="stylesheet" href="./style.css">
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        .registration_box_area {
    padding: 80px 0;
    
    
}

.registration_form_inner {
    background-color: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
    max-width: 500px; /* Increased width */
    margin: 0 auto; /* Center alignment */
}

.registration_form_inner h3 {
    font-size: 24px;
    font-weight: 600;
    color: #333;
    margin-bottom: 30px;
    text-align: center; /* Center align the heading */
}

.registration_form_inner .form-group {
    margin-bottom: 20px;
}

.registration_form_inner input[type="text"],
.registration_form_inner input[type="email"],
.registration_form_inner input[type="password"],
.registration_form_inner input[type="tel"],
.registration_form_inner select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    color: #333;
    background-color: #f9f9f9;
}

.registration_form_inner input[type="file"] {
    padding-top: 7px;
}

.registration_form_inner select {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
   
    background-position: right 10px center;
    background-repeat: no-repeat;
    background-size: 15px;
}

.registration_form_inner select:focus {
    outline: none;
    border-color: #4CAF50;
}

.registration_form_inner .form-control-file {
    border: none;
}

.registration_form_inner label {
    font-size: 16px;
    font-weight: 500;
    color: #333;
}

.registration_form_inner button[type="submit"] {
    width: 100%;
    padding: 15px; /* Increased padding */
}



    </style>
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


  <!-- Navbar Start -->
  <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
    <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>HMINDS EDUCATION</h2>
    </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="index.html" class="nav-item nav-link">Home</a>
            <a href="about.html" class="nav-item nav-link">About</a>
            <a href="courses.html" class="nav-item nav-link">Courses</a>
            <a href="testimonial.html" class="nav-item nav-link">Testimonial</a>
            <a href="contact.php" class="nav-item nav-link">Contact</a>
       </div>
        <a href="login.php" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Login<i class="fa fa-arrow-right ms-3"></i></a><i class="fas fa-sign-in" style="color: #74C0FC;"></i>
    </div>
</nav>
<!-- Navbar End -->


    <!-- HTML code for the registration form -->
   
    <section class="registration_box_area section_gap">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="registration_form_inner">
                        <h3>Register to Create an Account</h3>
                        <form class="registration_form"  action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post" id="registrationForm" enctype="multipart/form-data">
    <div class="form-group">
        <label for="exFullname">Full Name:</label>
        <input type="text" class="form-control" id="exFullname" name="exFullname" required>
    </div>
    <div class="form-group">
        <label for="exGender">Gender:</label>
        <select class="form-control" id="exGender" name="exGender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
         
        </select>
    </div>
    <div class="form-group">
        <label for="exBdate">Birthdate:</label>
        <input type="date" class="form-control" id="exBdate" name="exBdate" required>
    </div>
    <div class="form-group">
    <label for="exCourse">Course:</label>
    <select class="form-control" id="exCourse" name="exCourse" required>
        <option value="">Select Course</option>
        <?php
        // Include the database connection file
        include("conn.php");

        // Fetch courses from the database
        $query = $conn->query("SELECT * FROM course_tbl");
        while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
            echo "<option value='" . $row['cou_id'] . "'>" . $row['cou_name'] . "</option>";
        }
        ?>
    </select>
</div>

    <div class="form-group">
        <label for="exEmail">Email:</label>
        <input type="email" class="form-control" id="exEmail" name="exEmail" required>
    </div>
    <div class="form-group">
        <label for="exPass">Password:</label>
        <input type="password" class="form-control" id="exPass" name="exPass" required>
    </div>
    <div class="form-group text-center">
        <button type="submit" class="btn btn-primary">Register</button>
    </div>
</form>


                    </div>
                </div>
            </div>
        </div>
    </section>
        <!--================End Login Box Area =================-->





    
    

    <!-- Footer Start -->
<div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-3">Quick Link</h4>
                <a class="btn btn-link" href="about.html">About Us</a>
                <a class="btn btn-link" href="contact.php">Contact Us</a>
                <a class="btn btn-link" href="privacy.html">Privacy Policy</a>
                <a class="btn btn-link" href="terms.html">Terms & Condition</a>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-3">Contact</h4>
                <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i> A-34, Phase-8, Industrial Area, Sector 73, Sahibzada Ajit Singh Nagar, Punjab 160071</p>
                <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+0172 661 9000</p>
                <p class="mb-2"><i class="fa fa-envelope me-3"></i>cdacmohali.com</p>
               
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-3">Gallery</h4>
                <div class="row g-2 pt-2">
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-1.jpg" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-2.jpg" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-3.jpg" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-2.jpg" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-3.jpg" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-1.jpg" alt="">
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    
    <div class="container">
        <div class="copyright">
            <div class="row">
                <div class="text-center p-3">
                    © 2024 Copyright:
                    <a class="text-body" href="reh.php">HMINDS EDUCATION.com</a>, All Right Reserved.
                  </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>