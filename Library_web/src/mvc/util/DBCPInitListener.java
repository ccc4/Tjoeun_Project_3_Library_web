package mvc.util;

import java.sql.DriverManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

@WebListener
public class DBCPInitListener implements ServletContextListener {

	private String JDBC_DRIVER_CLASS;
	private String JDBC_URL;
	private String JDBC_USER;
	private String JDBC_PASSWORD;
	private String JDBC_DB_NAME;
	
    public void contextInitialized(ServletContextEvent sce)  { 
    	JDBC_DRIVER_CLASS = sce.getServletContext().getInitParameter("JDBC_DRIVER_CLASS");
    	JDBC_URL = sce.getServletContext().getInitParameter("JDBC_URL");
    	JDBC_USER = sce.getServletContext().getInitParameter("JDBC_USER");
    	JDBC_PASSWORD = sce.getServletContext().getInitParameter("JDBC_PASSWORD");
    	JDBC_DB_NAME = sce.getServletContext().getInitParameter("JDBC_DB_NAME");
    	
    	loadJDBCDriver();
    	initConnectionPool();
    }

    private void loadJDBCDriver() {
		try {
			Class.forName(JDBC_DRIVER_CLASS);
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}

	private void initConnectionPool() {
		try {

			ConnectionFactory connFactory = 
					new DriverManagerConnectionFactory(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

			PoolableConnectionFactory poolableConnFactory = 
					new PoolableConnectionFactory(connFactory, null);
			poolableConnFactory.setValidationQuery("select 1");

			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			poolConfig.setTestWhileIdle(true);
			poolConfig.setMinIdle(4);
			poolConfig.setMaxTotal(50);			

			GenericObjectPool<PoolableConnection> connectionPool = 
					new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);
			
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = 
					(PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool(JDBC_DB_NAME, connectionPool);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void contextDestroyed(ServletContextEvent sce)  { 
    }
}
