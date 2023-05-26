<?php

/**
 * Provides values from the `.config.json` file.
 * 
 * Example: `Config::get()->database_host`
 */
final class Config {
    public readonly string $database_host;
    public readonly int    $database_port;
    public readonly string $database_user;
    public readonly string $database_pass;
    public readonly string $database_name;
    public readonly string $discord_webhook_id;
    public readonly string $discord_webhook_token;
    public readonly string $discord_webhook_mdp;
    public readonly string $steam_api_key;

    private static $_instance;

    public static function get(): Config {
        return self::$_instance ??= new Config();
    }

    private function __construct() {
        foreach (json_decode(file_get_contents(ROOT_PATH . '/.config.json'), true) as $key => $value) {
            if (property_exists($this, $key)) {
                $this->{$key} = $value;
            }
        }
    }
}
