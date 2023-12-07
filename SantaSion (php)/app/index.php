<?php
require_once('../server/Database.php');

$database = new DataBase();
$tuConexionPDO = $database->getConnection();

$database->closeConnection();

$orm = new Orm('id', 'Eventos', $tuConexionPDO); 
$eventos = $orm->getAll();

foreach ($eventos as &$evento) {
    $evento['Descripcion'] = str_replace(["\n", "\r"], '', $evento['Descripcion']);
}
?>

<?php if (!empty($eventos)) : ?>
    <?php foreach ($eventos as $evento) : ?>
        <!-- Enlace al detalle del evento -->
        <a href="detalles.php?id=<?php echo $evento['Id']; ?>" class="anuncio">
            <h2><?php echo $evento['Titulo']; ?></h2>
            <?php if (!empty($evento['Descripcion'])) : ?>
                <p><?php echo nl2br($evento['Descripcion']); ?></p>
            <?php endif; ?>
            <p class="event-dates">
                Fecha: <?php echo (!empty($evento['FechaInicio'])) ? date('d/m/Y', strtotime($evento['FechaInicio'])) : ''; ?>
                <?php if (!empty($evento['FechaFin']) && $evento['FechaInicio'] != $evento['FechaFin']) : ?>
                    - <?php echo date('d/m/Y', strtotime($evento['FechaFin'])); ?>
                <?php endif; ?>
            </p>
            <p class="event-hours">
                Hora: <?php echo $evento['HoraInicio'] . ' - ' . $evento['HoraFin']; ?>
            </p>
        </a>
    <?php endforeach; ?>
<?php else : ?>
    <p>No hay eventos disponibles.</p>
<?php endif; ?>
