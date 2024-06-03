<?php
include(__DIR__ . "/../loader.php");

Debug::$loggingToOutput = true;
ini_set('memory_limit', '-1');
Leaderboard::cacheLeaderboard();
    