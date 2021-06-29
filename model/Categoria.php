<?php

class Categoria extends Conectar
{
    public function get_categorias()
    {
        $sql = "SELECT * FROM categoria WHERE cat_est = 1";
        return parent::sqlDinamyc($sql);
    }

    public function get_categoria_x_id($cat_id)
    {
        $sql = "SELECT * FROM categoria WHERE cat_est = 1 AND cat_id = '$cat_id'";
        return parent::sqlDinamyc($sql, $cat_id);
    }

    public function insert_categoria($cat_nom, $cat_obs)
    {
        $sql = "INSERT INTO `categoria` (`cat_id`, `cat_nom`, `cat_obs`, `cat_est`) VALUES (NULL, '$cat_nom', '$cat_obs', '1')";
        return parent::sqlDinamyc($sql);
    }

    public function update_categoria($cat_id, $cat_nom, $cat_obs)
    {
        $sql = "UPDATE `categoria` SET `cat_nom` = '$cat_nom', `cat_obs` = '$cat_obs' WHERE `categoria`.`cat_id` = '$cat_id'";
        return parent::sqlDinamyc($sql, $cat_id);
    }

    public function delete_categoria($cat_id)
    {
        $sql = "UPDATE `categoria` SET `cat_est` = '0' WHERE `categoria`.`cat_id` = '$cat_id'";
        return parent::sqlDinamyc($sql, $cat_id);
    }
}
