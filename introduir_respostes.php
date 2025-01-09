<?php
/*******************************************
 * EJEMPLO DE PÁGINA PHP + BOOTSTRAP
 * Introducción de datos en "respostes"
 *******************************************/

// Recomendable: Ajusta estos datos a tu entorno
$host = 'localhost';
$dbName = 'cesc2';
$user = 'root';
$pass = '';

$pdo = new PDO("mysql:host=$host;dbname=$dbName;charset=utf8", $user, $pass);

// 12 categorías
$categorias = [
  'soc_POS' => 'Soc POS',
  'soc_NEG' => 'Soc NEG',
  'ar_i'    => 'AR I',
  'pros'    => 'Pros',
  'af'      => 'AF',
  'ar_d'    => 'AR D',
  'pros_2'  => 'Pros 2',
  'av'      => 'AV',
  'vf'      => 'VF',
  'vv'      => 'VV',
  'vr'      => 'VR',
  'amics'   => 'Amics',
];

$errores = [];
$msgExito = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recogemos campos
    $id_enquesta = trim($_POST['id_enquesta'] ?? '');
    $id_alumne   = trim($_POST['id_alumne']   ?? '');
    $nom_alumne  = trim($_POST['nom_alumne']  ?? '');

    $genero    = trim($_POST['genero']    ?? '');
    $clase     = trim($_POST['clase']     ?? '');
    $tutor     = trim($_POST['tutor']     ?? '');
    $centro    = trim($_POST['centro']    ?? '');
    $poblacion = trim($_POST['poblacion'] ?? '');

    // Validaciones mínimas servidor
    if ($id_enquesta === '' || !ctype_digit($id_enquesta)) {
      $errores[] = "ID encuesta inválido.";
    }
    if ($id_alumne === '' || !ctype_digit($id_alumne)) {
      $errores[] = "ID alumno inválido.";
    }
    if ($nom_alumne === '') {
      $errores[] = "El nombre del alumno no puede estar vacío.";
    }
    if (!in_array($genero, ['Masculino','Femenino'], true)) {
      $errores[] = "Género inválido (Masculino / Femenino).";
    }

    // Preparamos array para los 36 valores
    $data = [];
    foreach ($categorias as $catKey => $catLabel) {
      $val1 = $_POST[$catKey.'_1'] ?? '';
      $val2 = $_POST[$catKey.'_2'] ?? '';
      $val3 = $_POST[$catKey.'_3'] ?? '';

      if (!ctype_digit($val1) || !ctype_digit($val2) || !ctype_digit($val3)) {
        $errores[] = "Los valores de '$catLabel' deben ser números.";
      } else {
        // Rango y duplicados
        if ((int)$val1 < 1 || (int)$val1 > 30 ||
            (int)$val2 < 1 || (int)$val2 > 30 ||
            (int)$val3 < 1 || (int)$val3 > 30) {
          $errores[] = "Los valores de '$catLabel' deben estar entre 1 y 30.";
        }
        if ($val1 === $val2 || $val2 === $val3 || $val1 === $val3) {
          $errores[] = "En '$catLabel', no pueden repetirse valores.";
        }
        if ($val1 === $id_alumne || $val2 === $id_alumne || $val3 === $id_alumne) {
          $errores[] = "No se puede introducir el propio ID ($id_alumne) en '$catLabel'.";
        }
      }

      $data[$catKey] = [$val1, $val2, $val3];
    }

    // Si no hay errores, insertamos en BD
    if (empty($errores)) {
      $camposCols = ['id_enquesta','id_alumne','nom','genero','clase','tutor','centro','poblacion'];
      $placeholders = ['?', '?', '?', '?', '?', '?', '?', '?'];
      $valuesInsert = [$id_enquesta, $id_alumne, $nom_alumne, $genero, $clase, $tutor, $centro, $poblacion];

      foreach ($categorias as $catKey => $catLabel) {
        $camposCols[] = $catKey.'_1';
        $camposCols[] = $catKey.'_2';
        $camposCols[] = $catKey.'_3';
        $placeholders[] = '?';
        $placeholders[] = '?';
        $placeholders[] = '?';

        $valuesInsert[] = $data[$catKey][0];
        $valuesInsert[] = $data[$catKey][1];
        $valuesInsert[] = $data[$catKey][2];
      }

      $tabla = 'respostes';
      $sql = "INSERT INTO $tabla (" . implode(',', $camposCols) . ")
              VALUES (" . implode(',', $placeholders) . ")";

      $stmt = $pdo->prepare($sql);
      if ($stmt->execute($valuesInsert)) {
        $msgExito = "Datos insertados con éxito en '$tabla'.";
      } else {
        $errores[] = "Error al insertar en la base de datos.";
      }
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Introducir Respostes (Llenado Aleatorio)</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet"
        crossorigin="anonymous">
</head>
<body class="bg-light">
<div class="container py-4">
  <h1>Introducir datos en la tabla respostes</h1>
  <p>
    Los valores han de estar entre <strong>1</strong> y <strong>30</strong>, 
    sin repetir en la misma fila ni usar el propio ID del alumno.
  </p>

  <?php if (!empty($errores)): ?>
    <div class="alert alert-danger">
      <ul>
        <?php foreach ($errores as $e): ?>
          <li><?php echo htmlspecialchars($e); ?></li>
        <?php endforeach; ?>
      </ul>
    </div>
  <?php endif; ?>

  <?php if ($msgExito): ?>
    <div class="alert alert-success">
      <?php echo htmlspecialchars($msgExito); ?>
    </div>
  <?php endif; ?>

  <form method="POST" class="row g-3" id="formRespostes">
    <!-- ID Encuesta -->
    <div class="col-md-4">
      <label class="form-label">ID Encuesta</label>
      <input type="number" class="form-control" name="id_enquesta" id="id_enquesta"
             required min="1"
             value="<?php echo htmlspecialchars($_POST['id_enquesta'] ?? ''); ?>">
    </div>
    <!-- ID Alumno -->
    <div class="col-md-4">
      <label class="form-label">ID Alumno</label>
      <input type="number" class="form-control" name="id_alumne" id="id_alumne"
             required min="1"
             value="<?php echo htmlspecialchars($_POST['id_alumne'] ?? ''); ?>">
    </div>
    <!-- Nombre Alumno -->
    <div class="col-md-4">
      <label class="form-label">Nombre Alumno</label>
      <input type="text" class="form-control" name="nom_alumne"
             required
             value="<?php echo htmlspecialchars($_POST['nom_alumne'] ?? ''); ?>">
    </div>

    <!-- NUEVOS CAMPOS -->
    <div class="col-md-4">
      <label class="form-label">Género</label>
      <select class="form-select" name="genero" required>
        <option value="">Seleccione...</option>
        <option value="Masculino" <?php if(isset($_POST['genero']) && $_POST['genero']==='Masculino') echo 'selected'; ?>>
          Masculino
        </option>
        <option value="Femenino" <?php if(isset($_POST['genero']) && $_POST['genero']==='Femenino') echo 'selected'; ?>>
          Femenino
        </option>
      </select>
    </div>
    <div class="col-md-4">
      <label class="form-label">Clase</label>
      <input type="text" class="form-control" name="clase"
             value="<?php echo htmlspecialchars($_POST['clase'] ?? ''); ?>">
    </div>
    <div class="col-md-4">
      <label class="form-label">Tutor</label>
      <input type="text" class="form-control" name="tutor"
             value="<?php echo htmlspecialchars($_POST['tutor'] ?? ''); ?>">
    </div>
    <div class="col-md-4">
      <label class="form-label">Centro</label>
      <input type="text" class="form-control" name="centro"
             value="<?php echo htmlspecialchars($_POST['centro'] ?? ''); ?>">
    </div>
    <div class="col-md-4">
      <label class="form-label">Población</label>
      <input type="text" class="form-control" name="poblacion"
             value="<?php echo htmlspecialchars($_POST['poblacion'] ?? ''); ?>">
    </div>

    <hr class="my-4" />

    <!-- TABLA 12 FILAS X 3 SELECTS -->
    <table class="table table-bordered">
      <thead class="table-light">
        <tr>
          <th>Categoría</th>
          <th>Valor 1</th>
          <th>Valor 2</th>
          <th>Valor 3</th>
        </tr>
      </thead>
      <tbody>
      <?php foreach ($categorias as $catKey => $catLabel): 
        $val1 = $_POST[$catKey.'_1'] ?? '';
        $val2 = $_POST[$catKey.'_2'] ?? '';
        $val3 = $_POST[$catKey.'_3'] ?? '';
      ?>
        <tr>
          <td><?php echo htmlspecialchars($catLabel); ?></td>
          <?php for ($i=1; $i<=3; $i++):
            $fieldName = $catKey . "_$i";
            $val = ($i===1)? $val1 : (($i===2)? $val2 : $val3);
          ?>
            <td>
              <select 
                name="<?php echo $fieldName; ?>" 
                id="<?php echo $fieldName; ?>" 
                class="form-select cat-select" 
                data-cat="<?php echo $catKey; ?>"
                required
              >
                <option value="">Seleccione...</option>
                <?php for($opt=1; $opt<=30; $opt++): ?>
                  <option value="<?php echo $opt; ?>"
                    <?php if($opt == $val) echo 'selected'; ?>>
                    <?php echo $opt; ?>
                  </option>
                <?php endfor; ?>
              </select>
            </td>
          <?php endfor; ?>
        </tr>
      <?php endforeach; ?>
      </tbody>
    </table>

    <div class="col-12">
      <!-- Botón para rellenar aleatoriamente -->
      <button type="button" class="btn btn-secondary me-3" onclick="fillRandom()">Llenado Aleatorio</button>
      <!-- Botón para guardar -->
      <button type="submit" class="btn btn-primary" id="btnEnviar">Guardar</button>
    </div>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>

<script>
/**************************************************
 * VALIDACIÓN AL CAMBIAR CADA SELECT
 **************************************************/
const selects = document.querySelectorAll('.cat-select');
selects.forEach(sel => {
  sel.addEventListener('change', (e) => {
    const filaCategoria = sel.dataset.cat; 
    const s1 = document.getElementById(filaCategoria + '_1');
    const s2 = document.getElementById(filaCategoria + '_2');
    const s3 = document.getElementById(filaCategoria + '_3');
    
    // Evitar duplicados en la misma fila
    if (s1.value && s2.value && s3.value) {
      if (s1.value === s2.value || s2.value === s3.value || s1.value === s3.value) {
        alert('No puedes repetir valores en la misma fila.');
        sel.value = '';
        return;
      }
    }

    // Evitar que coincida con ID alumno
    const idAlumno = document.getElementById('id_alumne').value;
    if (sel.value === idAlumno) {
      alert('No puedes introducir tu propio ID (' + idAlumno + ').');
      sel.value = '';
      return;
    }
  });
});

/**************************************************
 * FUNCIÓN LLENADO ALEATORIO (respetando validaciones)
 **************************************************/
function fillRandom() {
  const idAlumno = parseInt(document.getElementById('id_alumne').value, 10);
  if (isNaN(idAlumno)) {
    alert('Introduce primero un ID Alumno válido (numérico).');
    return;
  }

  // Obtenemos todas las filas (cada fila = una categoría)
  const filas = document.querySelectorAll('tbody tr');
  filas.forEach(row => {
    // Localizamos los 3 selects de esa fila
    const sel1 = row.querySelector('[id$="_1"]');
    const sel2 = row.querySelector('[id$="_2"]');
    const sel3 = row.querySelector('[id$="_3"]');

    // Generar 3 valores aleatorios distintos en [1..30], no = idAlumno
    const picks = [];
    while (picks.length < 3) {
      let r = Math.floor(Math.random() * 30) + 1; // 1..30
      if (!picks.includes(r) && r !== idAlumno) {
        picks.push(r);
      }
    }

    // Asignamos a los selects
    sel1.value = picks[0];
    sel2.value = picks[1];
    sel3.value = picks[2];
  });

  alert('Se han rellenado automáticamente los 36 valores con números aleatorios (1..30), evitando el ID del alumno.');
}
</script>
</body>
</html>
