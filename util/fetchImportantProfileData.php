<?php
    include(__DIR__ . "/../loader.php");

    ignore_user_abort(true);
    set_time_limit(0);

    Debug::initializeFileLogging();
    Debug::$loggingToOutput = true;

    $data = Database::query("SELECT DISTINCT profile_number FROM changelog WHERE time_gained > DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 30 DAY)");

    $activeProfiles = array();
    while ($row = $data->fetch_assoc()) {
        $activeProfiles[$row["profile_number"]] = null;
    }

    print_r("Recently active profiles: " . count($activeProfiles) . "\n");

    $maps = Cache::get("maps");
    $boards = array();

    foreach ($maps["chapters"] as $chapter => $chapterData) {
        
        $boards[] = Cache::get("chapterPointBoard".$chapter);
        $boards[] = Cache::get("chapterTimeBoard".$chapter);

        foreach ($chapterData["maps"] as $map) {

            $boards[] = Cache::get("chamberBoard" . $map);
        }
    }

    $boards[] = Cache::get("SPPointBoard");
    $boards[] = Cache::get("SPTimeBoard");
    $boards[] = Cache::get("COOPPointBoard");
    $boards[] = Cache::get("COOPTimeBoard");
    $boards[] = Cache::get("globalPointBoard");
    $boards[] = Cache::get("globalTimeBoard");


    $skillFullProfiles = array();
    foreach ($boards as $board) {

        $rankHandled = 0;

        foreach ($board as $profileNumber => $scoreInfo) {
            $skillFullProfiles[$profileNumber] = null;
            $rankHandled++;
            if ($rankHandled == 40)
                break;
        }
    }

    print_r("Skillfull profiles: " . count($skillFullProfiles) . "\n");

    $data = Database::query("SELECT profile_number FROM usersnew WHERE banned = 1");
    
    $bannedProfiles = array();
    while ($row = $data->fetch_assoc()) {
        $bannedProfiles[$row["profile_number"]] = null;
    }

    print_r("Banned profiles: " . count($bannedProfiles) . "\n");

    $importantProfiles = $activeProfiles + $skillFullProfiles + $bannedProfiles;

    print_r("Important profiles: " . count($importantProfiles) . "\n");


    $j = 1;
    foreach (array_keys($importantProfiles) as $profileNumber) {
        User::updateProfileData($profileNumber);

        if ($j % round(count($importantProfiles) / 10) == 0)
            print_r("Processed " . $j . "/" . count($importantProfiles) . "\n");

    	$sleepSeconds = (0.5 + (rand(0, 500) / 1000));
        usleep($sleepSeconds * 1000000);
        
        $j++;
    }

    Leaderboard::cacheLeaderboard();
