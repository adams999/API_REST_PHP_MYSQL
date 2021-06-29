<?php

class Conectar
{
    protected $dbh;

    protected function Conexion()
    {
        try {
            $conectar = $this->dbh = new PDO('mysql:local=localhost;dbname=api_rest_php_mysql', 'root', '');
            $this->set_names();
            return $conectar;
        } catch (Exception $e) {
            print('Error DB: ' . $e->getMessage() . "<br/>");
            die();
        }
    }

    public function get_dbh()
    {
        return $this->dbh;
    }

    public function set_names()
    {
        return $this->get_dbh()->query("SET NAMES utf8");
    }

    public function sqlDinamyc($sql, $id_table = null)
    {
        $errores = new Errors();
        $cn = $this->Conexion();
        $consulta = $cn->prepare($sql);
        /////!empty($id_table) ? $id_afectado = $consulta->bindValue(1, $id_table) : $id_afectado = null;   ///obtener el id afectado
        $consulta->execute();
        $response = $consulta->fetchAll(PDO::FETCH_ASSOC);

        if (empty($response)) {
            $response = $errores->trans_errors(['0004' => true]);
            return $response;
        }
        $response = json_encode($response);
        return $response;
    }
}
