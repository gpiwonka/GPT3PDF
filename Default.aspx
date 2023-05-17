<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GPT3PDF.Default" %>

<html>
<head>
    <title>PDF Anaylser</title>
    <style>
        #dropArea {
            border: 2px dashed #ccc;
            padding: 20px;
            text-align: center;
        }
        .drag-drop-area.highlight {
            border-color: #888;
        }
 
        /* Animation keyframes */
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Wait animation */
        .wait-animation {
            width: 40px;
            height: 40px;
            border: 4px solid #ccc;
            border-top-color: #333;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }
    </style>

    <script>
       


      

        function handleDrop(event) {
            event.preventDefault();
            var files = event.dataTransfer.files;
            var fileInput = document.getElementById('<%= fileUpload.ClientID %>');
            fileInput.files = files;
            fileInput.dispatchEvent(new Event('change'));
        }

       
        function clearLabelValue() { document.getElementById("<%= ResultLabel.ClientID %>").innerText = "" } 
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>PDF Anaylser</h1>
            <div id="dropArea" ondrop="handleDrop(event)" ondragover="event.preventDefault()">
                <p>Drag and drop files here</p>
            </div>
            <asp:FileUpload ID="fileUpload" runat="server" />
            <br />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" OnClientClick="document.getElementById('wait').style.display = 'block';clearLabelValue();" />

        </div>
    </form>
    <div id="wait" class="wait-animation" style="display:none"></div>
    <br />
    <asp:Label ID="ResultLabel" runat="server"></asp:Label>


</html>