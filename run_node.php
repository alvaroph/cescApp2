<?php
/********************************************************
 * run_node.php (en català)
 * Llança "node index.js <id_enquesta>" al servidor.
 ********************************************************/

if (!isset($_GET['id_enquesta']) || !ctype_digit($_GET['id_enquesta'])) {
    die("ID d'enquesta invàlid.");
}

$idEnquesta = $_GET['id_enquesta'];

// Construïm la comanda
$cmd = "node index.js " . escapeshellarg($idEnquesta);

// Executem la comanda
$output = [];
$return_var = 0;
exec($cmd, $output, $return_var);
?>
<!DOCTYPE html>
<html lang="ca">
<head>
  <meta charset="UTF-8">
  <title>Resultat del Node</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h1>Procés Node - Resultat</h1>
  <p>
    Comanda executada: <code><?php echo htmlspecialchars($cmd); ?></code>
  </p>
  <p>
    Codi de sortida: <strong><?php echo (int)$return_var; ?></strong>
  </p>

  <?php if (!empty($output)): ?>
    <div class="alert alert-secondary">
      <h5>Sortida de la comanda:</h5>
      <pre><?php echo htmlspecialchars(implode("\n", $output)); ?></pre>
    </div>
  <?php else: ?>
    <div class="alert alert-secondary">
      <em>Sense sortida</em>
    </div>
  <?php endif; ?>

  <a href="index.php" class="btn btn-primary">Tornar a l'índex</a>
</div>
</body>
</html>
