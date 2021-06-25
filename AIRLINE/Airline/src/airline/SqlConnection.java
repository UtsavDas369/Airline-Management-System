
package airline;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//Configuration of JDBC Connection
//Please enter user name and password of the JDBC Connection
public class SqlConnection {
	public static Connection Connector() {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/airline", "root",
					"pwd");
			return conn;
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(" " + e);
			return null;

		}

	}
}
