<?php
    // Obtener el nombre de usuario usando el comando shell 'whoami'
    //$usuario = exec('whoami');
    $usuario = "Torres Ramos, Juan Luis";
    
    // Obtener la dirección IP del servidor Apache
    $ipServidor = $_SERVER['SERVER_ADDR'];
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SWAP: <?php echo $usuario; ?></title>
</head>
<body>
    <h1>SWAP: <?php echo $usuario; ?></h1>
    <p>Dirección IP del servidor Apache: <?php echo $ipServidor; ?></p>
</body>
</html>
