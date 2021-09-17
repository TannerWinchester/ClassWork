<?Php 
/****************************************************/
/* DATE             NAME                    DESCRIPTION
 * --------------------------------------------------
 * 9/17/2021    TANNER WINCHESTER   INITIAL DEPLOYMENT OF DATABASE CLASS
 * 
 ****************************************************/

class Database {

    private static $dsn = 'mysql:host=localhost;dbname=thegrid';
    private static $username = 'grid_user';
    private static $password = 'Pa$$w0rd';
    private static $db;

    private function __construct() {
        
    }

    public static function getDB() {
        if (!isset(self::$db)) {
            try {
                self::$db = new PDO(self::$dsn,
                        self::$username,
                        self::$password);
            } catch (PDOException $e) {
                $error_message = $e->getMessage();
                echo 'Error connecting with ' . self::$username;
                //include('../errors/database_error.php');
                exit();
            }
        }
        return self::$db;
    }

}

?>