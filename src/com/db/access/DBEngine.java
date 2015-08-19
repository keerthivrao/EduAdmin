package com.db.access;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.jdbc.Util;

/**
 * @Title : DBEngine.java
 * @Description : DBEngine handles database related operations
 * @Author : Keerthi Venkateswara Rao
 * @Version : 1.0
 * @link
 */
public class DBEngine implements QueryConstants {
	
	// Data Types
	public static final short __VARCHAR = 0;

	public static final short __INTEGER = 1;

	public static final short __DATE = 2;

	public static final short __TIMESTAMP = 3;

	public static final short __TIME = 4;

	public static final short __SHORT = 5;

	public static final short __FLOAT = 6;

	/**
	 * Returns the connection to the data base configured in the properties file
	 */
	
	
	private Connection getConnection() {
		Connection connection = null;
		try {
			System.out.println("Getting Connection");
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/creditusa");
			connection = (Connection)ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	/**
	
	public Connection getConnection() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://thecreditusa.virtual.vps-host.net:3306/creditusa",
					"creditusa", "root");

			if (!con.isClosed())
				System.out.println("Successfully connected to "
						+ "MySQL server using TCP/IP...");

		} catch (Exception e) {
			System.err.println("Exception: " + e.getMessage());
		} finally {

		}
		return con;

	}
	/**/
	/**
	private Connection getConnection() {
		Connection connection = null;
		try {
			System.out.println("Getting Connection");
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/creditusa");
			connection = (Connection)ds.getConnection();
			/*
			Class.forName(driver);
			InitialContext context = new InitialContext();
			context = (InitialContext) context.lookup("jdbc/hru");
			DataSource dataSource = context.get
			connection = DriverManager.getConnection(url, userName, password);
			*/
	/*
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	*/
	/**
	 * Closes the connection associated with the resultset
	 */
	public void closeConnection(ResultSet resultSet) {
		//System.out.println("Closing Connection :: ResultSet ");
		if (resultSet != null) {
			try {
				Statement statement = resultSet.getStatement();
				Connection connection = null;
				if(statement != null)
					connection = statement.getConnection();
				resultSet.close();
				if (statement != null)
					statement.close();
				if (connection != null)
					connection.close();
				resultSet = null;
				statement = null;
				connection = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void closeConnection(Connection connection) {
		//System.out.println("Closing Connection :: Connection ");
		try {
			if (connection != null)
				connection.close();
			connection = null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void closeConnection(PreparedStatement preparedStatement) {
		//System.out.println("Closing Connection :: PreparedStatement");
		
			try {
				if (preparedStatement != null ) {
				Connection connection = preparedStatement.getConnection();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
				preparedStatement = null;
				connection = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
	/**
	 * Executes the query string
	 */
	public QueryResults executeQuery(String query) throws Exception {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
		} catch (SQLException e) {
			throw new Exception("Unexpected error occured due to :["
					+ e.getMessage() + "]");
		}
		return populateResults(resultSet);
	}

	public QueryResults executeQuery(String query, String beanName)
			throws Exception {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
		} catch (SQLException e) {
			throw new Exception("Unexpected error occured due to :["
					+ e.getMessage() + "]");
		}
		if(beanName == null || "".equals(beanName))
			return populateResults(resultSet);
		return populateResults(resultSet, beanName);
	}

	public QueryResults executeQuery(Query query, List data) throws Exception {
		QueryResults results = null;
		//boolean closeConnection = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		boolean closeConnection = false;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(query.getQuery());
			preparedStatement = populateData(preparedStatement, query
					.getParameters(), data);
			String mode = query.getMode();
			int effectedRows = 0;
			
			if (mode != null) {
				mode = mode.toUpperCase().trim();
			}
			if (SELECT.equals(mode)) {
				closeConnection = false;
				resultSet = preparedStatement.executeQuery();
				results = populateResults(resultSet);
			} else if (INSERT.equals(mode)) {
				closeConnection = true;
				effectedRows = preparedStatement.executeUpdate();
				resultSet = preparedStatement.getGeneratedKeys();
				results = populateResults(effectedRows, resultSet);
			} else if (UPDATE.equals(mode)) {
				closeConnection = true;
				effectedRows = preparedStatement.executeUpdate();
				results = populateResults(effectedRows, null);
			} else if (DELETE.equals(mode)) {
				closeConnection = true;
				effectedRows = preparedStatement.executeUpdate();
				results = populateResults(effectedRows, null);
			}
		} catch (SQLException e) {
			throw new Exception("Unexpected error occured due to :["
					+ e.getMessage() + "]");
		} catch (Exception e) {
			throw new Exception("Unexpected error occured due to :["
					+ e.getMessage() + "]");
		}
		finally
		{
			if(closeConnection)
			{
			if(preparedStatement != null )
			{
				closeConnection(preparedStatement);
			}
			else if(connection != null)
			{
				closeConnection(connection);
			}
			}
		}
		return results;
	}
	public QueryResults executeBatchUpdate(Query query,HashMap valueMap,boolean updateAll) throws Exception
	{
		QueryResults results = null;
		try{
			int effectedRows = executeBatchUpdate(query, valueMap,query.getParameters(),updateAll);
			results = populateResults(effectedRows, null);
		} catch (SQLException e) {
			throw new Exception("Unexpected error occured due to :["
					+ e.getMessage() + "]");
		} catch (Exception e) {
			throw new Exception("Unexpected error occured due to :["
					+ e.getMessage() + "]");
		}
		return results;
	}	
	public QueryResults executeBatchUpdate(Query query,HashMap valueMap) throws Exception
	{
		QueryResults results = null;
		try{
			int effectedRows = executeBatchUpdate(query, valueMap,query.getParameters(),false);
			results = populateResults(effectedRows, null);
		} catch (SQLException e) {
			throw new Exception("Unexpected error occured due to :["
					+ e.getMessage() + "]");
		} catch (Exception e) {
			throw new Exception("Unexpected error occured due to :["
					+ e.getMessage() + "]");
		}
		return results;
	}
	public QueryResults executeQuery(Query query, List data, String beanName)
			throws Exception {
		QueryResults results = null;
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		ResultSet resultSet = null;
		boolean closeConnection = false;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(query.getQuery());
			preparedStatement = populateData(preparedStatement, query
					.getParameters(), data);
			String mode = query.getMode();
			
			int effectedRows = 0;
			if (mode != null) {
				mode = mode.toUpperCase().trim();
			}
			if (SELECT.equals(mode)) {
				resultSet = preparedStatement.executeQuery();
				results = populateResults(resultSet, beanName);
			} else if (INSERT.equals(mode)) {
				closeConnection = true;
				effectedRows = preparedStatement.executeUpdate();
				resultSet = preparedStatement.getGeneratedKeys();
				results = populateResults(effectedRows, resultSet);
			} else if (UPDATE.equals(mode)) {
				closeConnection = true;
				effectedRows = preparedStatement.executeUpdate();
				results = populateResults(effectedRows, null);
			} else if (DELETE.equals(mode)) {
				closeConnection = true;
				effectedRows = preparedStatement.executeUpdate();
				results = populateResults(effectedRows, null);
			}
		} catch (SQLException e) {
			throw new Exception("Unexpected error occured due to :["
					+ e.getMessage() + "]");
		} catch (Exception e) {
			throw new Exception("Unexpected error occured due to :["
					+ e.getMessage() + "]");
		}
		finally
		{
			if(closeConnection)
			{
			if(preparedStatement != null)
			{
				closeConnection(preparedStatement);
			}
			else if(connection != null)
			{
				closeConnection(connection);
			}
			}
		}
		return results;
	}

	public QueryResults execute(String queryIdentifier, List values) {
		return null;
	}

	public Object execute(Query query, List data, String beanName)
			throws Exception {
		return executeQuery(query, data, beanName);
	}

	public QueryResults populateResults(ResultSet results, String beanName)
			throws SQLException {
		ResultSetMetaData metaData = null;
		QueryResults queryResults = new QueryResults();
		Utils utils = new Utils();
		HashMap propertyMap = null;
		Object dataRow = null;
		try {
			if (results != null) {
				metaData = results.getMetaData();

				if (metaData != null) {

					while (results.next()) {
						propertyMap = new HashMap(0);
						String value = "";
						for (int index = 1; index <= metaData.getColumnCount(); index++) {
							String fieldName = removeUnderScores(metaData
									.getColumnName(index).toLowerCase().trim());
							value = results.getString(index);
							if (value == null)
								value = "";
							propertyMap.put(fieldName, value);
						}
						dataRow = utils.populateProperties(beanName,
								propertyMap);
						queryResults.add(dataRow);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(results);
		}
		return queryResults;
	}

	public String removeUnderScores(String columnName) {
		int i = columnName.indexOf("_");
		int size = columnName.length();
		while (i >= 0) {
			columnName = columnName.substring(0, i)
					+ columnName.substring(i + 1, size);
			size -= 1;
			i = columnName.indexOf("_");
		}
		return columnName;
	}

	public QueryResults populateResults(ResultSet results) throws SQLException {
		ResultSetMetaData metaData = null;
		QueryResults queryResults = new QueryResults();
		DataRow dataRow = null;
		try {
			if (results != null) {
				metaData = results.getMetaData();
				if (metaData != null) {
					for (int index = 1; index < metaData.getColumnCount(); index++) {
						queryResults.addHeader(metaData.getColumnName(index));
					}
				}
				while (results.next()) {
					dataRow = new DataRow();
					for (int index = 1; index < metaData.getColumnCount(); index++) {
						dataRow.add(results.getString(index));
					}
					queryResults.add(dataRow);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(results);
		}
		return queryResults;
	}

	public QueryResults populateResults(int rowsAffected, ResultSet results)
			throws SQLException {
		QueryResults queryResults = new QueryResults();
		queryResults.setAffectedRows(rowsAffected);
		try
		{
			if (results != null) {
				while (results.next()) {
					queryResults.setGeneratedNum(results.getInt(1));
				}
			}		
		}
		catch(SQLException SQLE)
		{
			SQLE.printStackTrace();
			throw SQLE;
		}
		finally{			
			try
			{
				if(results != null)
					results.close();
				results = null;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
				
			}
		}
		return queryResults;
	}

	private PreparedStatement populateData(PreparedStatement preparedStatement,
			List parameters, List data) throws SQLException {
		if (data != null && parameters != null
				&& data.size() == parameters.size()) {
			for (int colDataIndex = 0, size = data.size(); colDataIndex < size; colDataIndex++) {
				Parameter param = (Parameter) parameters.get(colDataIndex);
				String value = (String) data.get(colDataIndex);
				preparedStatement = populateData(preparedStatement, param
						.getDataType(), value, colDataIndex + 1);
			}
		}
		return preparedStatement;
	}

	private PreparedStatement populateData(PreparedStatement preparedStatement,
			short columnDataType, String value, int parameterIndex)
			throws SQLException {
		try {
			switch (columnDataType) {
			case __DATE:
				if ((value != null) && (!("".equals(value)))
						&& (!("_".equals(value)))) {

					preparedStatement.setDate(parameterIndex, Date
							.valueOf(value));
				} else {
					preparedStatement.setDate(parameterIndex, null);
				}

				break;
			case __INTEGER:
				if ((value != null) && (!("".equals(value)))) {
					preparedStatement.setInt(parameterIndex, java.lang.Integer
							.parseInt(value));
				} else {
					preparedStatement.setInt(parameterIndex, 0);
				}
				break;
			case __SHORT:
				preparedStatement.setShort(parameterIndex, java.lang.Short
						.parseShort(value));
				break;
			case __VARCHAR:
				if ((value != null) && (!("".equals(value)))) {
					preparedStatement.setString(parameterIndex, value);
				} else {
					preparedStatement.setString(parameterIndex, null);
				}

				break;
			case __TIME:
				preparedStatement.setTime(parameterIndex, java.sql.Time
						.valueOf(value));
				break;
			case __TIMESTAMP:
				preparedStatement.setTimestamp(parameterIndex,
						java.sql.Timestamp.valueOf(value));
			case __FLOAT:
				if ((value != null) && (!("".equals(value)))) {
					preparedStatement.setFloat(parameterIndex,Float.parseFloat(value));
					
					
				} else
					preparedStatement.setFloat(parameterIndex, 0.0f);
				break;
			default:
				//System.out.println("default");
			}
		} catch (IllegalArgumentException IAE) {
			preparedStatement.setNull(parameterIndex,
					getSQLType(columnDataType));

		} catch (SQLException SQLE) {
			preparedStatement.setNull(parameterIndex,
					getSQLType(columnDataType));
		}
		return preparedStatement;
	}

	/**
	 * Gets the equivalent data type in SQL
	 */
	private int getSQLType(short columnDataType) {
		int sqlType = -99;
		switch (columnDataType) {
		case __DATE:
			sqlType = java.sql.Types.DATE;
			break;
		case __INTEGER:
			sqlType = java.sql.Types.INTEGER;
			break;
		case __SHORT:
			sqlType = java.sql.Types.SMALLINT;
			break;
		case __VARCHAR:
			sqlType = java.sql.Types.VARCHAR;
			break;
		case __TIME:
			sqlType = java.sql.Types.TIME;
			break;
		case __TIMESTAMP:
			sqlType = java.sql.Types.TIMESTAMP;
			break;
		case __FLOAT:
			sqlType = java.sql.Types.FLOAT;
			break;
		}
		return sqlType;
	}

	public QueryResults execute(String queryString, Query query, List data,
			String beanName) throws Exception {
		Query tempQuery = new Query();
		tempQuery.setQuery(queryString);
		tempQuery.setParameters(query.getParameters());
		tempQuery.setMode(query.getMode());
		System.out.println(queryString);
		System.out.println(data);
		return executeQuery(tempQuery, data, beanName);
	}
	/**
     *  Adds multiple statements to be executed into a batch and gets the batch executed    
     */
    private int executeBatchUpdate(Query query, HashMap valueMap,List parameters,boolean updateAll) throws Exception
    {
		
    	QueryResults results = null;
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		ResultSet resultSet = null;
		boolean closeConnection = false;
		int parameterIndex = 0;
		List data = null;
		int effectedRows = 0;
		boolean rollBack = false;
    	try
        {
    		connection = getConnection();
    		if(updateAll)
    			connection.setAutoCommit(false);
            int[] totalUpdates = null;
            
            preparedStatement = connection.prepareStatement(query.getQuery());
            int valueMapSize = 0;
            if(valueMap != null && valueMap.size() != 0)
            {  
            	valueMapSize = valueMap.size();
            	for(int batchIndex = 0, totalBatches = valueMap.size(); batchIndex < totalBatches; batchIndex++)
                {
                    parameterIndex = 1;
                    data = (List) valueMap.get(new Integer(batchIndex));
                    preparedStatement = populateData(preparedStatement, parameters, data);
                    preparedStatement.addBatch();
                }
                totalUpdates = preparedStatement.executeBatch();
                effectedRows = 0;
                for(int index = 0; index < totalUpdates.length; index++)
                {
                    effectedRows += totalUpdates[index];
                }
            }
            else
            {
                effectedRows = preparedStatement.executeUpdate();
            }
            if(updateAll)
            {
            	if(effectedRows == valueMapSize)
            	{
            		rollBack = false;
            	}
            	else
            	{
            		rollBack = true;
            		connection.rollback();
            	}
            }
        }
        finally
        {
        	closeConnection(connection);
        	if(rollBack)
            {
            	throw new Exception("ECP001");
            }
        }
        return effectedRows;
    }	
}