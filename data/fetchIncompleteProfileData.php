<?php
    include(__DIR__ . "/../loader.php");

    $data = Database::query("SELECT users.profile_number AS player_id FROM users WHERE steamname IS NULL OR steamname = ''");

    $numRows = mysqli_num_rows($data);
    $i = 1;
    while ($row = $data->fetch_assoc()) {
        User::updateProfileData($row["player_id"]);
        print_r("Processing user ". $row["player_id"]. " " . $i . "/" . $numRows."\n");
        $i++;
    }

    Leaderboard::cacheLeaderboard();

