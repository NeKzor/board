<?php

class Auth {
    public static function gen_auth_hash(string $profile_number) {
        // Create Auth hash
        $auth_hash = Util::random_str(32);

        // Save to db
        Database::query(
            "UPDATE users 
             SET users.auth_hash = ?
             WHERE users.profile_number = ?",
            "ss",
            [
                $auth_hash,
                $profile_number,
            ]
        );

        return $auth_hash;
    }

    public static function test_auth_hash(string $auth_hash) {
        $row = Database::findOne(
            "SELECT users.profile_number
             FROM users
             WHERE users.auth_hash = ?",
            "s",
            [
                $auth_hash,
            ]
        );

        return $row ? strval($row["profile_number"]) : null;
    }

    public static function get_auth_hash(string $profile_number) {
        $row = Database::findOne(
            "SELECT users.auth_hash
             FROM users
             WHERE profile_number = ?",
            "s",
            [
                $profile_number,
            ]
        );

        return $row ? strval($row["auth_hash"]) : null;
    }

    public static function del_auth_hash(string $profile_number) {
        Database::query(
            "UPDATE users 
             SET users.auth_hash = NULL
             WHERE users.profile_number = ?",
            "s",
            [
                $profile_number,
            ]
        );
    }
}
