<?php
/********************************************************
 * visualitzar_resultats.php
 * - Pregunta por un id_enquesta
 * - Muestra resultados en tabla (matriz)
 * - Visualiza un sociograma con D3.js
 * Requiere que exista la tabla `resultats` (o la que uses)
 ********************************************************/

// Recomendable: Ajusta estos datos a tu entorno
$host = 'localhost';
$dbName = 'cesc2';
$user = 'root';
$pass = '';

$pdo = new PDO("mysql:host=$host;dbname=$dbName;charset=utf8", $user, $pass);

// Array para errores
$errores = [];
$resultados = [];  // Aqui guardaremos las filas que recuperemos
$idEncuesta = '';
$hayResultados = false;

// 1. Si se ha enviado el formulario, recogemos el id_enquesta
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $idEncuesta = trim($_POST['id_enquesta'] ?? '');
    
    // Validar que sea dígito
    if ($idEncuesta === '' || !ctype_digit($idEncuesta)) {
        $errores[] = "Debes introducir un ID de encuesta válido.";
    } else {
        // 2. Consultar la tabla `resultats` filtrando por id_enquesta
        $sql = "SELECT * FROM resultats WHERE id_enquesta = ?";
        $stmt = $pdo->prepare($sql);
        if ($stmt->execute([$idEncuesta])) {
            $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if (!empty($resultados)) {
                $hayResultados = true;
            } else {
                $errores[] = "No se encontraron resultados para id_enquesta=$idEncuesta.";
            }
        } else {
            $errores[] = "Error al consultar la base de datos.";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Visualizar Resultados - Encuesta</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet"
        crossorigin="anonymous">
  <!-- Estilos opcionales -->
  <style>
    .check-icon {
      color: green;
      font-weight: bold;
    }
    .graph-container {
      border: 1px solid #ccc;
      width: 100%;
      height: 500px;
      position: relative;
      margin-top: 30px;
    }
    /* Si quieres que D3 ocupe todo el contenedor */
    svg {
      width: 100%;
      height: 100%;
      display: block;
    }
  </style>
</head>
<body class="bg-light">
<div class="container py-4">

  <h1>Visualizar Resultados de Encuesta</h1>
  
  <!-- Formulario para pedir ID de Encuesta -->
  <form method="POST" class="row g-3 mb-4">
    <div class="col-auto">
      <label for="id_enquesta" class="col-form-label">ID de Encuesta:</label>
    </div>
    <div class="col-auto">
      <input type="number" class="form-control" name="id_enquesta" id="id_enquesta"
             value="<?php echo htmlspecialchars($idEncuesta); ?>" required>
    </div>
    <div class="col-auto">
      <button type="submit" class="btn btn-primary">Mostrar Resultados</button>
    </div>
  </form>

  <!-- Mensajes de error -->
  <?php if (!empty($errores)): ?>
    <div class="alert alert-danger">
      <ul>
        <?php foreach ($errores as $err): ?>
          <li><?php echo htmlspecialchars($err); ?></li>
        <?php endforeach; ?>
      </ul>
    </div>
  <?php endif; ?>

  <!-- Si hay resultados, mostramos la tabla -->
  <?php if ($hayResultados): ?>
    <h2>Resultados para la encuesta #<?php echo htmlspecialchars($idEncuesta); ?></h2>

    <div class="table-responsive">
      <table class="table table-bordered table-hover align-middle">
        <thead class="table-light">
          <tr>
            <?php
            // Encabezados de tabla (tomamos del primer row)
            $columnas = array_keys($resultados[0]);
            foreach ($columnas as $col) {
              echo "<th>".htmlspecialchars($col)."</th>";
            }
            ?>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($resultados as $fila): ?>
            <tr>
              <?php foreach ($fila as $col => $valor):
                // Si la columna acaba en _SN y hay 'X', mostramos icono de check
                if (preg_match('/_SN$/', $col)) {
                  if ($valor === 'X') {
                    $contenido = '<span class="check-icon">&#10004;</span>';  // o usar un icono <i> ...
                  } else {
                    $contenido = ''; // vacío
                  }
                } else {
                  // Mostrar valor normal
                  $contenido = htmlspecialchars($valor);
                }
              ?>
                <td><?php echo $contenido; ?></td>
              <?php endforeach; ?>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>

    <!-- Visualización en forma de sociograma con D3.js -->
    <h2>Sociograma (D3.js)</h2>
    <p class="text-muted">
      Ejemplo simple: cada alumno es un nodo. Creamos un enlace si se cumplen ciertas condiciones.
      Ajusta la lógica a tus necesidades reales.
    </p>
    <div class="graph-container" id="graphContainer">
      <!-- D3 dibujará aquí -->
    </div>

  <?php endif; ?>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>

<!-- D3.js (v7 o posterior) -->
<script src="https://d3js.org/d3.v7.min.js"></script>

<?php if ($hayResultados): ?>
<script>
  /************************************************************
   * EJEMPLO DE SOCIOGRAMA BÁSICO CON D3
   * - Creamos un array de "nodes" (cada fila = 1 alumno)
   * - Creamos "links" si se cumple una condición
   ************************************************************/

  // 1. Tomar datos de PHP -> JavaScript
  // Este array de objetos es la "tabla" que obtuviste
  const dataFilas = <?php echo json_encode($resultados, JSON_HEX_TAG|JSON_HEX_AMP|JSON_HEX_APOS|JSON_HEX_QUOT); ?>;

  // 2. Crear nodos
  // Supongamos que cada fila tiene 'id_alumne' y 'nom_alumne'
  // y que es único. Si no, ajusta la logic
  const nodes = dataFilas.map(f => ({
    id: f.id_alumne,
    name: f.nom_alumne
  }));

  // 3. Crear links
  // Ejemplo: si "popular_SN" === "X" en ambos, los enlazamos
  // (Es una condición inventada. Ajusta a lo que quieras.)
  // Podrías también enlazar "Rebutjat" con "Ignorat", etc.
  let links = [];
  for (let i=0; i<nodes.length; i++) {
    for (let j=i+1; j<nodes.length; j++) {
      const f1 = dataFilas[i];
      const f2 = dataFilas[j];
      // Condición de ejemplo: ambos son "populares"
      if (f1.popular_SN === 'X' && f2.popular_SN === 'X') {
        links.push({ source: f1.id_alumne, target: f2.id_alumne });
      }
    }
  }

  // Configuramos el width/height del SVG
  const width  = document.getElementById('graphContainer').clientWidth;
  const height = document.getElementById('graphContainer').clientHeight;

  // 4. Creamos el SVG en d3
  const svg = d3.select('#graphContainer')
    .append('svg')
    .attr('width', width)
    .attr('height', height);

  // 5. Fuerza
  const forceSimulation = d3.forceSimulation(nodes)
    .force('link', d3.forceLink(links).id(d => d.id).distance(80))
    .force('charge', d3.forceManyBody().strength(-100))
    .force('center', d3.forceCenter(width / 2, height / 2));

  // 6. Dibujar los enlaces
  const link = svg.selectAll('.link')
    .data(links)
    .enter()
    .append('line')
    .attr('stroke', '#999')
    .attr('stroke-width', 2);

  // 7. Dibujar los nodos
  const node = svg.selectAll('.node')
    .data(nodes)
    .enter()
    .append('circle')
    .attr('r', 15)
    .attr('fill', '#69b3a2')
    .call(drag(forceSimulation));

  // Texto en nodos (opcional)
  const labels = svg.selectAll('.label')
    .data(nodes)
    .enter()
    .append('text')
    .text(d => d.name || d.id)
    .attr('font-size', '12px')
    .attr('text-anchor', 'middle')
    .attr('dy', '.35em')
    .attr('fill', 'white');

  // 8. En cada tick, actualizamos posiciones
  forceSimulation.on('tick', () => {
    link
      .attr('x1', d => d.source.x)
      .attr('y1', d => d.source.y)
      .attr('x2', d => d.target.x)
      .attr('y2', d => d.target.y);

    node
      .attr('cx', d => d.x)
      .attr('cy', d => d.y);

    labels
      .attr('x', d => d.x)
      .attr('y', d => d.y);
  });

  // Drag & drop para nodos
  function drag(simulation) {
    function dragstarted(event, d) {
      if (!event.active) simulation.alphaTarget(0.3).restart();
      d.fx = d.x; d.fy = d.y;
    }
    function dragged(event, d) {
      d.fx = event.x; d.fy = event.y;
    }
    function dragended(event, d) {
      if (!event.active) simulation.alphaTarget(0);
      d.fx = null; d.fy = null;
    }
    return d3.drag()
      .on('start', dragstarted)
      .on('drag', dragged)
      .on('end', dragended);
  }

</script>
<?php endif; ?>

</body>
</html>
