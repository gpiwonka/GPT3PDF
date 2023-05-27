<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GPT3PDF.Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    <!-- Vendor CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">


    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">

    <style>
        #fileselct:hover .btn-primary {
            background-color: #5a95f5 !important;
        }

        loader {
            background: #ccc;
            height: 10px;
            border-radius: 10px;
            position: absolute;
        }

        .loader .blue-line {
            background: #000;
            border-radius: 10px;
            position: relative;
            left: 0;
            z-index: 1;
            width: 100px;
            height: 10px;
        }

        .form-horizontal {
            display: block;
            width: 50%;
            margin: 0 auto;
        }

        .progress-bar.indeterminate {
            position: relative;
            animation: progress-indeterminate 3s linear infinite;
        }

        @keyframes progress-indeterminate {
            from {
                left: -25%;
                width: 25%;
            }

            to {
                left: 100%;
                width: 25%;
            }
        }
    </style>
</head>
<body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
        <div class="container d-flex align-items-center justify-content-between">

            <h1 class="logo"><a href="#hero">Analyzer</a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                    <li><a class="nav-link scrollto" href="#about">About</a></li>
                    <li><a class="nav-link scrollto" href="#services">Services</a></li>
                    <li><a class="nav-link scrollto o" href="#portfolio">Portfolio</a></li>

                    <li><a class="getstarted scrollto" href="#about">Contact</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav>
            <!-- .navbar -->

        </div>
    </header>
    <!-- End Header -->
    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center">
        <div class="container position-relative" data-aos="" data-aos-delay="100">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-9 text-center">
                    <h1>Pdf Analyzer v0.1</h1>
                    <h2>Analyze your pdf documents in seconds</h2>
                </div>
            </div>
            <div class="text-center">

                <form id="form1" runat="server" class="form-horizontal">

                    <div class="input-group" id="fileselct">

                        <input type="file" id="files" style="display: none" />
                        <input id="filename" readonly placeholder="Select your file" class="form-control" style="width: 100px" />
                        <div class="input-group-btn">
                            <button type="button" id="btnUpload" class="btn btn-primary">Upload</button>
                        </div>

                    </div>

                    <hr />
                    <div class="progress" style="position: relative;display: none;">
                        <div class="progress-bar progress-bar-striped indeterminate">
                        </div>
                    </div>

                    <div>
                        <label id="Resultlabel" />
                    </div>

                </form>
            </div>

            <div class="row icon-boxes">
                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="" data-aos-delay="200">
                    <div class="icon-box">
                        <div class="icon"><i class="ri-stack-line"></i></div>
                        <h4 class="title"><a href="">Lorem Ipsum</a></h4>
                        <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="" data-aos-delay="300">
                    <div class="icon-box">
                        <div class="icon"><i class="ri-palette-line"></i></div>
                        <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
                        <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="" data-aos-delay="400">
                    <div class="icon-box">
                        <div class="icon"><i class="ri-command-line"></i></div>
                        <h4 class="title"><a href="">Magni Dolores</a></h4>
                        <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="" data-aos-delay="500">
                    <div class="icon-box">
                        <div class="icon"><i class="ri-fingerprint-line"></i></div>
                        <h4 class="title"><a href="">Nemo Enim</a></h4>
                        <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis</p>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- End Hero -->



    <main id="main">
    </main>
    <!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer">

        <div class="footer-top" id="about">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 col-md-6 footer-contact">
                        <h3>Pdf Analyzer</h3>
                        <p>
                            A108 Adam Street
                            <br>
                            New York, NY 535022<br>
                            United States
                            <br>
                            <br>
                            <strong>Phone:</strong> +1 5589 55488 55<br>
                            <strong>Email:</strong> info@example.com<br>
                        </p>
                    </div>

                    <div class="col-lg-2 col-md-6 footer-links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Home</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">About us</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Services</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Terms of service</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Privacy policy</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Our Services</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Web Design</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Web Development</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Product Management</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Marketing</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Graphic Design</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-4 col-md-6 footer-newsletter">
                        <h4>Join Our Newsletter</h4>
                        <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
                        <form action="" method="post">













                            <div class="form-group">
                                <input type="email" name="email" class="form-control">
                            </div>


                        </form>
                    </div>

                </div>
            </div>
        </div>

        <div class="container d-md-flex py-4">

            <div class="me-md-auto text-center text-md-start">
                <div class="copyright">
                    &copy; Copyright <strong><span>Analyzer</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    Designed by <a href="/">Analyzer</a>
                </div>
            </div>
            <div class="social-links text-center text-md-right pt-3 pt-md-0">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
        </div>
    </footer>
    <!-- End Footer -->


    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>
        $('.progress').hide();
        $("#btnUpload").on('click', function () {
            
            
            if ($("#btnUpload").text() == 'Analyse')
            {
                document.getElementById("Resultlabel").textContent = '';
                $('.progress').show();
                var formData = new FormData();

                var fileUpload = $('#files').get(0);
                var files = fileUpload.files;

                for (var i = 0; i < files.length; i++) {
                    $("#filename").val(files[i].name);
                    formData.append(files[i].name, files[i]);
                }

                $.ajax({
                    url: location.protocol.concat("//").concat(window.location.host).concat("/AnaylseService.asmx/Upload"),
                    type: 'POST',
                    data: formData,
                    success: function (data) {
                        var xml = $.parseXML(new XMLSerializer().serializeToString(data)),
                            $xml = $(xml),
                            $test = $xml.find('Message');
                        document.getElementById("Resultlabel").textContent = $test.text();
                        $('.progress').hide();
                        $("#btnUpload").html('Upload');
                        $("#files").val(''); 
                    },
                    error: function (data) {
                        var xml = $.parseXML(new XMLSerializer().serializeToString(data));
                        alert('Error: '.concat(xml));
                        $("#btnUpload").html('Upload');
                    },
                    cache: false,
                    contentType: false,
                    processData: false,
                    xhr: function () {
                        var xhr = new window.XMLHttpRequest();

                        //xhr.upload.addEventListener("progress", function (evt) {
                        //    if (evt.lengthComputable) {

                        //        var percentComplete = Math.round((evt.loaded / evt.total) * 100);

                        //        $('.progress-bar').css('width', percentComplete + '%').attr('aria-valuenow', percentComplete);
                        //        $('.progress-bar').text(percentComplete + '%');


                        //    }

                        //}, false);
                        //xhr.onreadystatechange = function () {
                        //    if (xhr.readyState == 4) {
                        //        alert("bind da");
                        //        $('.progress-bar').css('width', 0 + '%').attr('aria-valuenow', 0);
                        //        $('.progress-bar').text('Analysing');

                        //    }
                        //};
                        return xhr;
                    },
                });
            }
            else
            {
                $("#files").click();
            }
        });

        $("#filename").on('click', function () {
            $("#files").val(''); 
            $("#files").click();
        });

        $("#files").on('change', function () {
            
            $("#btnUpload").html('Analyse');
            var fileUpload = $('#files').get(0);
            var files = fileUpload.files;
            $("#filename").val(files[0].name);
            
           
        });
    </script>
</body>
</html>
