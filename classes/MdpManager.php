<?php

class MdpManager {
    const mdpLocation = ROOT_PATH . "";

    // Executes CLI version of Mdp and dumps files into specified discord channels
    public static function Execute($demoPath, $demoDetails){
        //Debug::log("Attempting to execute mdp for $demoPath");
        $demoName = substr($demoPath, strrpos( $demoPath, '/')+1, strlen($demoPath));
        //Debug::log("Demo Name:  $demoName");
        $cmd = MdpManager::mdpLocation . '/mdp ' . $demoPath;
        //Debug::log("CMD: $cmd");
        $stdout = null;
        $stderr = null;
        $resultCode = self::RunCmd($cmd, $stdout, $stderr);
        //Debug::log("RESULT CODE: $resultCode");
        //Debug::log("STDOUT: $stdout");
        //Debug::log("STDERR: $stderr");

        if($resultCode == -1 || strlen($stderr) > 1){
            // Error has occured
            Debug::log("Error has occured with running Mdp on $demoPath");
            Discord::sendMdpWebhook($demoDetails, $demoName, $stdout, $stderr);
        }
        else{
            Discord::sendMdpWebhook($demoDetails, $demoName, $stdout);
        }
    }

    private static function RunCmd($cmd, &$stdout=null, &$stderr=null) {
        $proc = proc_open($cmd,[
            1 => ['pipe','w'],
            2 => ['pipe','w'],
        ],$pipes);
        $stdout = stream_get_contents($pipes[1]);
        fclose($pipes[1]);
        $stderr = stream_get_contents($pipes[2]);
        fclose($pipes[2]);
        return proc_close($proc);
    }
}