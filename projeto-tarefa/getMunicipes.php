<?php
    include_once "config.php";

    $query=$con->prepare("select * from municipios");
    $query->execute();
    $municipios=$query->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($municipios);