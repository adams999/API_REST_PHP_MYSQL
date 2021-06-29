<?php

class Errors extends Conectar
{
    public function trans_errors($codes = [])
    {
        if (!empty($codes)) {

            $cod_errors = '';
            foreach ($codes as $key => &$value) {
                if ($value === true) {
                    $cod_errors .= (string)$key . ', ';
                }
            }
            $codigos = substr($cod_errors, 0, -2);

            $sql = "SELECT trans_err_code, trans_err_desc_eng, trans_err_desc_spa FROM trans_errors WHERE trans_err_code IN ($codigos)";
            $cn = parent::Conexion();
            $consulta = $cn->prepare($sql);
            $consulta->execute();
            $resultado = $consulta->fetchAll(PDO::FETCH_ASSOC);
            return json_encode($resultado);
        }
    }
}
