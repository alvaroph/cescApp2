<?php
/*********************************************************
 * index.php (en català)
 * - Llista enquestes que tenen respostes a la taula `respostes`
 * - Mostra un comptador de respostes per enquesta
 * - Botó per executar "node index.js <id_enquesta>"
 * - Enllaços a: introduir_respostes.php i visualitzar_resultats.php
 *********************************************************/

// Dades de connexió
$host = 'localhost';
$dbName = 'cesc2';
$user = 'root';
$pass = '';

// Connexió PDO
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbName;charset=utf8", $user, $pass);
} catch (Exception $e) {
    die("Error de connexió: " . $e->getMessage());
}

// Obtenim les enquestes que tenen almenys una resposta i comptem quantes files hi ha
$sql = "SELECT id_enquesta, COUNT(*) as total_resp
          FROM respostes
         GROUP BY id_enquesta
         ORDER BY id_enquesta ASC";
$stmt = $pdo->query($sql);
$enquestes = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="ca">
<head>
  <meta charset="UTF-8">
  <title>Índex - Projecte CESC</title>
  <!-- Bootstrap (sense 'integrity') -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h1>Projecte CESC - Índex</h1>
  <p class="lead">
    Des d'aquí pots accedir a la introducció de dades,
    a la visualització de resultats i a un llistat d'enquestes
    per processar amb Node.
  </p>

  <!-- Enllaços a altres pàgines -->
  <div class="mb-4">
    <a href="introduir_respostes.php" class="btn btn-primary me-2">
      Introduir Dades
    </a>
    <a href="visualitzar_resultats.php" class="btn btn-secondary">
      Visualitzar Resultats
    </a>
  </div>

  <h2>Enquestes amb respostes</h2>
  <?php if (empty($enquestes)): ?>
    <div class="alert alert-warning">
      No hi ha enquestes amb respostes a la base de dades.
    </div>
  <?php else: ?>
    <table class="table table-bordered table-hover">
      <thead class="table-light">
        <tr>
          <th>ID Enquesta</th>
          <th>Respostes Registrades</th>
          <th>Accions</th>
        </tr>
      </thead>
      <tbody>
      <?php foreach ($enquestes as $row): ?>
        <tr>
          <td><?php echo htmlspecialchars($row['id_enquesta']); ?></td>
          <td><?php echo htmlspecialchars($row['total_resp']); ?></td>
          <td>
            <!-- Botó per llançar Node amb id_enquesta -->
            <!-- Anirà a run_node.php?id_enquesta=XX -->
            <a href="run_node.php?id_enquesta=<?php echo $row['id_enquesta']; ?>"
               class="btn btn-success btn-sm">
              Processar amb Node
            </a>
          </td>
        </tr>
      <?php endforeach; ?>
      </tbody>
    </table>
  <?php endif; ?>
</div>

<!-- Bootstrap JS (sense 'integrity') -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
