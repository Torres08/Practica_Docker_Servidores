<?php
    // Obtener el nombre de usuario usando el comando shell 'whoami'
    //$usuario = exec('whoami');
    $usuario = "Practica Final";
    
    // Obtener la dirección IP del servidor Apache
    $ipServidor = $_SERVER['SERVER_ADDR'];
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SWAP: <?php echo $usuario; ?></title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* Alinea los elementos a la izquierda */
            text-align: left; /* Alinea el texto a la izquierda */
            margin-left: 20px; /* Añade un margen a la izquierda para mejorar la legibilidad */
        }
        img {
            max-width: 100%; /* Establece el ancho máximo de la imagen al ancho del contenedor */
            height: auto; /* Permite que la altura de la imagen se ajuste automáticamente */
        }
    </style>
</head>
<body>
    <h1>SWAP : <?php echo $usuario; ?></h1>
    <p>Dirección IP del servidor Apache: <?php echo $ipServidor; ?></p>

    <img src="imagen.jpeg" alt="Ejemplo Imagen">
</body>
</html>



