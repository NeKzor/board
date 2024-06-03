<?php

class DemoManager {
    const demoFolder = ROOT_PATH . "/demos";

    function getDemoName(int $id) {
        $row = Database::findOne(
            "SELECT changelog.profile_number
                  , score
                  , map_id
             FROM changelog
             INNER JOIN users ON changelog.profile_number = users.profile_number
             WHERE changelog.id = ?",
            "i",
            [
                $id,
            ]
        );

        $dir = (new DateTime($row["time_gained"]))->format('Y/m');

        $map = str_replace(" ", "" , $GLOBALS["mapInfo"]["maps"][$row["map_id"]]["mapName"]);

        return [
            $dir,
            $map."_".$row["score"]."_".$row["profile_number"]."_".$id.".dem"
        ];
    }

    function getDemoDetails(int $id) {
        $row = Database::findOne(
            "SELECT changelog.id
                  , changelog.profile_number
                  , map_id
             FROM changelog
             INNER JOIN users ON changelog.profile_number = users.profile_number
             WHERE changelog.id = ?",
            "i",
            [
                $id,
            ]
        );

        return $row;
    }

    function getDemoURL($id) {
        [$dir, $name] = $this->getDemoName($id);
        $path = DemoManager::demoFolder . "/$dir/$name";

        if (file_exists($path)) {
            return "/demos/$dir/$name";
        } else {
            return NULL;
        }
    }

    function uploadDemo($data, int $id) {
        Debug::log("Uploading demo for changelog $id");

        [$dir, $name] = $this->getDemoName($id);

        $demoDir = DemoManager::demoFolder . "/$dir";
        if (!is_dir($demoDir) && !mkdir($demoDir, 0777, true)) {
            Debug::log("Failed to create demo dir $demoDir");
        }

        $path = DemoManager::demoFolder . "/$dir/$name";
        $f = fopen($path, 'w');
        if (!$f) {
            Debug::log("Failed to open demo file $path for writing");
            throw new Exception("Failed to open demo file for writing");
        }

        fwrite($f, $data);
        fclose($f);
        return $path;
    }

    function deleteDemo(int $id) {
        Debug::log("Deleting demo for changelog $id");

        [$dir, $name] = $this->getDemoName($id);
        $path = DemoManager::demoFolder . "/$dir/$name";

        if (!unlink($path)) {
            Debug::log("Could not delete demo file $path");
        }
    }
}
