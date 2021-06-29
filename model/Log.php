<?php
class Log extends Conectar
{
    function logSave($response = '', $uri)
    {
        $body = addslashes(json_encode(array_merge(!empty(json_decode(file_get_contents("php://input"), true)) ? json_decode(file_get_contents("php://input"), true) : $_POST, $_GET)));
        $ip = $_SERVER['REMOTE_ADDR'];
        $op = $_GET['op'];
        $sql = "INSERT INTO `trans_all_api` (`trans_body`, `trans_resp`, `trans_ip`, `trans_func`, `trans_uri`, `trans_date`) VALUES ('$body', '$response', '$ip', '$op', '$uri', NOW())";
        $cn = parent::Conexion();
        $consulta = $cn->prepare($sql);
        $consulta->execute();
        $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
}
