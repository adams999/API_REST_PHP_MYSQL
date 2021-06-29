<?php

header('Content-Type: application/json');
require_once("../config/conexion.php");
require_once("../model/Categoria.php");
require_once("../model/Errors.php");
require_once("../model/Log.php");

$classPrimaria = new Categoria();
$errors = new Errors();
$log = new Log();
$body = json_decode(file_get_contents("php://input"), true);
$response;

function API()
{
    global $classPrimaria, $errors, $body, $response;
    switch ($_GET['op']) {
        case 'GetAll':
            $response = $classPrimaria->get_categorias();
            echo $response;
            break;

        case "GetId":
            $response = $classPrimaria->get_categoria_x_id($body['cat_id']);
            echo $response;
            break;

        case "Insert":
            if (empty($body['cat_nom']) || empty($body['cat_obs'])) {
                $codes_err = [
                    '0002' => empty($body['cat_nom']),
                    '0003' => empty($body['cat_obs'])
                ];
                echo $response = $errors->trans_errors($codes_err);
                break;
            }
            $response = $classPrimaria->insert_categoria($body['cat_nom'], $body['cat_obs']);
            $code_ok = [
                '0008' => true
            ];
            echo $response = $errors->trans_errors($code_ok);
            break;

        case "Update":
            if (empty($body['cat_id']) || empty($body['cat_nom']) || empty($body['cat_obs'])) {
                $codes_err = [
                    '0001' => empty($body['cat_id']),
                    '0002' => empty($body['cat_nom']),
                    '0003' => empty($body['cat_obs'])
                ];
                echo $response = $errors->trans_errors($codes_err);
                break;
            }
            $response = $classPrimaria->update_categoria($body['cat_id'], $body['cat_nom'], $body['cat_obs']);
            $code_ok = [
                '0007' => true
            ];
            echo $response = $errors->trans_errors($code_ok);
            break;

        case "Delete":
            if (empty($body['cat_id'])) {
                $codes_err = [
                    '0001' => empty($body['cat_id'])
                ];
                echo $response = $errors->trans_errors($codes_err);
                break;
            }
            $response = $classPrimaria->delete_categoria($body['cat_id']);
            $code_ok = [
                '0006' => true
            ];
            echo $response = $errors->trans_errors($code_ok);
            break;

        default:
            echo $response = $errors->trans_errors(['0005' => true]);
            break;
    }

    logSave();
}

API();

function logSave()
{
    global $log, $response;
    $log->logSave($response, explode('?', $_SERVER["REQUEST_URI"])[0]);
}
