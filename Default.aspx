<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GPT3PDF.Default" %>


<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Style.css">


    <title>PDF Anaylser</title>
    <style>
        #dropArea {
            border: 2px dashed #ccc;
            text-align: center;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            padding: 50px;
        }

        .drag-drop-area.highlight {
            border-color: #888;
        }

        /* Animation keyframes */




        .item .item-content {
            padding: 30px 35px;
        }

        .image-upload {
            width: 100%;
            height: 300px;
            border: 1px dashed #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            position: relative;
            text-align: center;
            background: #f8f8f9;
            color: #666;
            overflow: hidden;
        }


        .item-wrapper form img {
            margin-bottom: 20px;
            width: auto;
            height: auto;
            max-height: 400px;
            width: auto;
            border-radius: 5px;
            overflow: hidden;
        }


        .image-upload img {
            height: 100% !important;
            width: auto !important;
            border-radius: 0px;
            margin: 0 auto;
        }

        .image-upload i {
            font-size: 6em;
            color: #ccc;
        }





        .item-wrapper input {
            height: 43px;
            line-height: 43px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        hidden {
            visibility: hidden;
            display: none;
        }
    </style>

</head>
<body>
    <div class="result">
        <div class="container">
            <div class="row">
                <div class="col">&nbsp;</div>

            </div>
            <div class="row">
                <div class="col"></div>
                <div class="col">
                    <asp:Label ID="ResultLabel" runat="server"></asp:Label>
                </div>
                <div class="col"></div>
            </div>
        </div>
        <div class="row">
            <div class="col">&nbsp;</div>

        </div>
    </div>
    <div class="result">
        <form id="form1" runat="server" class="form">

            <div class="drag-image" id="drag_image">

                <div class="icon"><i class="fa fa-file-pdf-o"></i></div>
                <h6 id="drag_text">Choose Your PDF to Upload</h6>
                <button id="dragbutton">Browse File</button>


                <asp:FileUpload ID="fileUpload" runat="server" CssClass="image-input" />

                <%--</label>--%>
            </div>
            <div style="display: none">
                <asp:Button ID="analyseButton" runat="server" Text="Analyse" CssClass="hidden" OnClick="btnUpload_Click" OnClientClick="document.getElementById('wait').style.display = 'block';clearLabelValue();" />
            </div>

        </form>
    </div>
    <div class="overlay_content">
        <div id="wait" class="wait-animation" style="display: none"></div>
    </div>

</body>
<script>

    const dropArea = document.getElementById("drag_image");
    const dragText = document.getElementById("drag_text");;
    const button = document.getElementById("dragbutton");
    const input = document.getElementById('<%= fileUpload.ClientID %>');
    const analyse = document.getElementById('<%= analyseButton.ClientID %>');
    let file;
    button.onclick = () => {
        input.click();
    }

    input.addEventListener("change", function () {

        file = this.files[0];
        dropArea.classList.add("active");
        viewfile();
    });

    dropArea.addEventListener("dragover", (event) => {
        event.preventDefault();
        dropArea.classList.add("active");
        dragText.textContent = "Release to Upload File";
    });


    dropArea.addEventListener("dragleave", () => {
        dropArea.classList.remove("active");
        dragText.textContent = "Drag & Drop to Upload File";
    });

    dropArea.addEventListener("drop", (event) => {
        event.preventDefault();

        file = event.dataTransfer.files[0];
        viewfile();
    });

    function viewfile() {

        let fileType = file.type;
        let validExtensions = ["application/pdf"];
        if (validExtensions.includes(fileType)) {
            dropArea.style.display = "none";
            input.click();
            analyse.click();

        } else {
            alert("This is not an PDF File!");
            dropArea.classList.remove("active");
            dragText.textContent = "Drag & Drop to Upload File";
        }
    }


    function handleDrop(event) {
        event.preventDefault();
        var files = event.dataTransfer.files;
        var fileInput = document.getElementById('<%= fileUpload.ClientID %>');
        fileInput.files = files;
        fileInput.dispatchEvent(new Event('change'));
    }


    function clearLabelValue() { document.getElementById("<%= ResultLabel.ClientID %>").innerText = "" }

</script>

</html>
