import hdatuan.config.MySQLConfig;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import java.sql.Connection;
import static org.junit.jupiter.api.Assertions.*;

class MySQLConfigTest {
    @Test
    @DisplayName("Does have correct environment variables")
    void shouldHaveEnviromentVar() {
        String host = System.getenv("pms_db_host");
        String db = System.getenv("pms_db_name");
        String user = System.getenv("pms_db_username");
        String pass = System.getenv("pms_db_password");

        assertNotNull(host);
        assertNotNull(db);
        assertNotNull(user);
        assertNotNull(pass);
    }

    @Test
    @DisplayName("Can connect to MySQL")
    void shouldConnectUsingEnvVariables() {
        Connection conn = MySQLConfig.getConnection();

        assertNotNull(conn);
    }
}
