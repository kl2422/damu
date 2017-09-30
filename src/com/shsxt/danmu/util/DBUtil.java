package com.shsxt.danmu.util;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.GenerousBeanProcessor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.RowProcessor;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.KeyedHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

/**
 * 数据库工具类
 * @author TW
 */
public class DBUtil {

	private static final Logger logger = LoggerFactory.getLogger(DBUtil.class);
	static private Properties props = new Properties();
	static private DataSource dataSource = new DruidDataSource();
	static {
		try {
			//务必记得通过类加载器加载prop文件！！
			props.load(MyDbUtil.class.getClassLoader()
					.getResourceAsStream("db.properties"));
			dataSource = DruidDataSourceFactory.createDataSource(props);
		} catch (Exception e) {
			logger.error("读取配置文件失败：{}", e);
			throw new RuntimeException(e);
		}
	}


	// 查询（返回 Array）
	public static Object[] queryArray(String sql, Object... params) {
		Object[] result = null;
		try {
			
			QueryRunner runner = new QueryRunner();
			// 使用GenerousBeanProcessor：该类重写了父类BeanProcessor的mapColumnsToProperties方法
			GenerousBeanProcessor bean = new GenerousBeanProcessor();
			// 将GenerousBeanProcessor对象传递给BasicRowProcessor
			RowProcessor processor = new BasicRowProcessor(bean);
			// 最后使用GenerousBeanProcessor的mapColumnsToProperties处理表字段到javabean的属性映射
			ArrayHandler arrayHandler = new ArrayHandler(processor);
			result = runner.query(sql, arrayHandler, params);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
		printSQL(sql);
		return result;
	}

	// 查询（返回 ArrayList）
	public static List<Object[]> queryArrayList(String sql, Object... params) {
		List<Object[]> result = null;
		try {
			QueryRunner runner = new QueryRunner(dataSource);
			// 数据库中下划线转为驼峰写法
			// 使用GenerousBeanProcessor：该类重写了父类BeanProcessor的mapColumnsToProperties方法
			GenerousBeanProcessor bean = new GenerousBeanProcessor();
			// 将GenerousBeanProcessor对象传递给BasicRowProcessor
			RowProcessor processor = new BasicRowProcessor(bean);
			// 最后使用GenerousBeanProcessor的mapColumnsToProperties处理表字段到javabean的属性映射
			ArrayListHandler arrayListHandler = new ArrayListHandler(processor);
			result = runner.query(sql, arrayListHandler, params);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
		printSQL(sql);
		return result;
	}

	// 查询（返回 Map）
	public static Map<String, Object> queryMap(String sql, Object... params) {
		Map<String, Object> result = null;
		try {
			QueryRunner runner = new QueryRunner(dataSource);
			// 数据库中下划线转为驼峰写法
			// 使用GenerousBeanProcessor：该类重写了父类BeanProcessor的mapColumnsToProperties方法
			GenerousBeanProcessor bean = new GenerousBeanProcessor();
			// 将GenerousBeanProcessor对象传递给BasicRowProcessor
			RowProcessor processor = new BasicRowProcessor(bean);
			// 最后使用GenerousBeanProcessor的mapColumnsToProperties处理表字段到javabean的属性映射
			MapHandler mapperHandler = new MapHandler(processor);
			result = runner.query(sql, mapperHandler, params);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
		printSQL(sql);
		return result;
	}

	// 查询（返回 MapList）
	public static List<Map<String, Object>> queryMapList(String sql, Object... params) {
		List<Map<String, Object>> result = null;
		try {
			QueryRunner runner = new QueryRunner(dataSource);
			// 数据库中下划线转为驼峰写法
			// 使用GenerousBeanProcessor：该类重写了父类BeanProcessor的mapColumnsToProperties方法
			GenerousBeanProcessor bean = new GenerousBeanProcessor();
			// 将GenerousBeanProcessor对象传递给BasicRowProcessor
			RowProcessor processor = new BasicRowProcessor(bean);
			// 最后使用GenerousBeanProcessor的mapColumnsToProperties处理表字段到javabean的属性映射
			MapListHandler mapperListHandler = new MapListHandler(processor);
			result = runner.query(sql, mapperListHandler, params);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
		printSQL(sql);
		return result;
	}

	// 查询
	public static <T> T queryBean(Class<T> cls, String sql, Object... params) {

		T result = null;
		try {
			QueryRunner runner = new QueryRunner(dataSource);
			// 数据库中下划线转为驼峰写法
			// 使用GenerousBeanProcessor：该类重写了父类BeanProcessor的mapColumnsToProperties方法
			GenerousBeanProcessor bean = new GenerousBeanProcessor();
			// 将GenerousBeanProcessor对象传递给BasicRowProcessor
			RowProcessor processor = new BasicRowProcessor(bean);
			// 最后使用GenerousBeanProcessor的mapColumnsToProperties处理表字段到javabean的属性映射
			BeanHandler<T> beanHandler = new BeanHandler<T>(cls, processor);
			result = runner.query(sql, beanHandler, params);
			printSQL(sql);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
		return result;
	}

	// 查询（返回 BeanList）
	public static <T> List<T> queryBeanList(Class<T> cls,
			String sql, Object... params) {
		List<T> result = null;
		try {
			QueryRunner runner = new QueryRunner(dataSource);
			// 数据库中下划线转为驼峰写法
			// 使用GenerousBeanProcessor：该类重写了父类BeanProcessor的mapColumnsToProperties方法
			GenerousBeanProcessor bean = new GenerousBeanProcessor();
			// 将GenerousBeanProcessor对象传递给BasicRowProcessor
			RowProcessor processor = new BasicRowProcessor(bean);
			// 最后使用GenerousBeanProcessor的mapColumnsToProperties处理表字段到javabean的属性映射
			BeanListHandler<T> beanListHandler = new BeanListHandler<T>(cls, processor);
			result = runner.query(sql, beanListHandler, params);
			printSQL(sql);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
		return result;
	}

	// 查询指定列名的值（单条数据）
	public static Object queryColumn(String column, String sql, Object... params) {
		Object result = null;
		try {
			QueryRunner runner = new QueryRunner(dataSource);
			result = runner.query(sql, new ScalarHandler<Object>(column), params);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
		printSQL(sql);
		return result;
	}

	// 查询指定列名的值（多条数据）
	public static <T> List<T> queryColumnList(
			String column, String sql, Object... params) {
		List<T> result = null;
		try {
			QueryRunner runner = new QueryRunner(dataSource);
			result = runner.query(sql, new ColumnListHandler<T>(column), params);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
		printSQL(sql);
		return result;
	}

	// 查询指定列名对应的记录映射
	public static <T> Map<T, Map<String, Object>> queryKeyMap(
			String column, String sql, Object... params) {
		Map<T, Map<String, Object>> result = null;
		try {
			QueryRunner runner = new QueryRunner(dataSource);
			result = runner.query(sql, new KeyedHandler<T>(column), params);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
		printSQL(sql);
		return result;
	}

	// 更新（包括 UPDATE、INSERT、DELETE，返回受影响的行数）
	public static int update(String sql, Object... params) {
		int result = 0;
		try {
			QueryRunner runner = new QueryRunner(dataSource);
			result = runner.update(sql, params);
			printSQL(sql);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
		return result;
	}

	private static void printSQL(String sql) {
		if (logger.isDebugEnabled()) {
			logger.debug("SQL: " + sql);
		}
	}
}