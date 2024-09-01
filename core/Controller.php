<?php

namespace Core;

require_once '../app/classes/Uri.php';

use app\classes\Uri;
use app\exceptions\ControllerNotExistException;

class Controller
{

    private $uri;
    private $controller;
    private $namespace;
    private $folders = [
        'app\controllers\admin',
        'app\controllers\portal'
    ];

    public function __construct()
    {
        $this->uri = Uri::uri();
        echo $this->uri;
    }

    public function load()
    {
        if ($this->isHome()) {
            return $this->controllerHome();
        }
        return $this->controllerNotHome();
    }

    private function controllerHome()
    {
        if (!$this->controllerExist('HomeController')) {
            throw new ControllerNotExistException("Esse controle não existe.");
        }

        return $this->instantiateController();
    }

    private function controllerNotHome()
    {
        echo 'Deus';
    }

    private function isHome()
    {
        return ($this->uri == '/');
    }

    private function controllerExist($controller)
    {
        $controllerExist = false;

        foreach ($this->folders as $folder) {
            if (class_exists($folder . '\\' . $controller)) {
                $controllerExist = true;
                $this->namespace = $folder;
                $this->controller = $controller;
            }
        }

        return $controllerExist;
    }

    private function instantiateController()
    {
        $controller = $this->namespace . '\\' . $this->controller;
        return new $controller;
    }
}