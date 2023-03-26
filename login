<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tirar Foto</title>
    <style>
      body {
        text-align: center;
      }
      video {
        max-width: 100%;
        max-height: 80vh;
      }
      #visualizacao {
        margin-top: 1em;
      }
      #botao-capturar {
        display: block;
        margin: 1em auto;
        padding: 1em 2em;
        font-size: 1.5em;
        border-radius: 1em;
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <h1>Tirar uma foto</h1>
    <button id="botao-capturar">Capturar</button>
    <div id="visualizacao"></div>
    <script>
      var visualizacao = document.getElementById("visualizacao");
      var video = document.createElement("video");
      video.setAttribute("autoplay", "");
      visualizacao.appendChild(video);
      
      navigator.mediaDevices.getUserMedia({ video: true })
        .then(function(stream) {
          video.srcObject = stream;
        })
        .catch(function(error) {
          console.error("Erro ao acessar a câmera: " + error);
        });
      
      document.getElementById("botao-capturar").addEventListener("click", function() {
        var canvas = document.createElement("canvas");
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        var contexto = canvas.getContext("2d");
        contexto.drawImage(video, 0, 0, canvas.width, canvas.height);
        var imagem = new Image();
        imagem.src = canvas.toDataURL();
        visualizacao.innerHTML = "";
        visualizacao.appendChild(imagem);
      });
    </script>
  </body>
</html>
