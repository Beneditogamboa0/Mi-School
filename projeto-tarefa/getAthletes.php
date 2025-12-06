<?php
    include_once "./config.php";
    $query=$con->prepare("select atletas.nome,atletas.data_nascimento,clubes.nome as clube,categorias.nome as categoria,municipios.nome as municipio from atletas
    join clubes on clubes.id=atletas.id_clube
    join categorias on categorias.id=atletas.id_categoria
    join municipios on municipios.id=atletas.id_municipio");
    $query->execute();
    echo json_encode($query->fetchAll(PDO::FETCH_ASSOC));