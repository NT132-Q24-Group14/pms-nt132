import hdatuan.config.MySQLConfig;

import org.junit.jupiter.api.Test;
import java.sql.Connection;
import static org.junit.jupiter.api.Assertions.*;

class MySQLConfigTest {

    @Test
    void shouldConnectUsingEnvVariables() {

        Connection conn = MySQLConfig.getConnection();

        assertNotNull(conn);
    }
}
