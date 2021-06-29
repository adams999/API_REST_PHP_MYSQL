<?php

header('Content-Type: application/json');
require_once("../config/conexion.php");
require_once("../model/Categoria.php");
require_once("../model/Errors.php");

$categoria = new Categoria();
$errors = new Errors();
$body = json_decode(file_get_contents("php://input"), true);
global $categoria, $errors, $body;

switch ($_GET['op']) {
    case 'GetAll':
        $datos = $categoria->get_categorias();
        echo $datos;
        break;

    case "GetId":
        $datos = $categoria->get_categoria_x_id($body['cat_id']);
        echo $datos;
        break;

    case "Insert":
        if (empty($body['cat_nom']) || empty($body['cat_obs'])) {
            $codes_err = [
                '0002' => empty($body['cat_nom']),
                '0003' => empty($body['cat_obs'])
            ];
            echo $errors->trans_errors($codes_err);
            break;
        }
        $datos = $categoria->insert_categoria($body['cat_nom'], $body['cat_obs']);
        echo json_encode([[
            'estatus' => "Insert Correcto"
        ]]);
        break;

    case "Update":
        if (empty($body['cat_id']) || empty($body['cat_nom']) || empty($body['cat_obs'])) {
            $codes_err = [
                '0001' => empty($body['cat_id']),
                '0002' => empty($body['cat_nom']),
                '0003' => empty($body['cat_obs'])
            ];
            echo $errors->trans_errors($codes_err);
            break;
        }
        $datos = $categoria->update_categoria($body['cat_id'], $body['cat_nom'], $body['cat_obs']);
        echo json_encode([[
            'estatus' => "Update Correcto"
        ]]);
        break;

    case "Delete":
        if (empty($body['cat_id'])) {
            $codes_err = [
                '0001' => empty($body['cat_id'])
            ];
            echo $errors->trans_errors($codes_err);
            break;
        }
        $datos = $categoria->delete_categoria($body['cat_id']);
        echo json_encode([[
            'estatus' => "Delete Correcto"
        ]]);
        break;

    default:
        echo $errors->trans_errors(['0005' => true]);
        break;
}
