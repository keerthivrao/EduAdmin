package com.db.access;

import java.io.File;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class QueryReader implements QueryConstants {
	private static QueryReader queryReader = null;

	private Hashtable queriesMap = new Hashtable();

	public static QueryReader getInstance() {
		if (queryReader == null) {
			queryReader = new QueryReader();
		}
		return queryReader;
	}

	private QueryReader() {
		try {

			Hashtable userqueriesMap = getQueries("user");
			queriesMap.putAll(userqueriesMap);
			userqueriesMap = getQueries("payment");
			queriesMap.putAll(userqueriesMap);
			userqueriesMap = getQueries("address");
			queriesMap.putAll(userqueriesMap);
			userqueriesMap = getQueries("distributor");
			queriesMap.putAll(userqueriesMap);
			userqueriesMap = getQueries("customer");
			queriesMap.putAll(userqueriesMap);
			userqueriesMap = getQueries("role");
			queriesMap.putAll(userqueriesMap);			
			userqueriesMap = getQueries("customeraccounts");
			queriesMap.putAll(userqueriesMap);
			userqueriesMap = getQueries("accountdetails");
			queriesMap.putAll(userqueriesMap);
			userqueriesMap = getQueries("profile");
			queriesMap.putAll(userqueriesMap);
		} catch (RuntimeException e) {
		}
	}

	public Query getQuery(String identifier) {
		Query query = (Query) queriesMap.get(identifier);
		return query;
	}

	private Hashtable getQueries(String filePrefix) {
		// Initialization
		Element element = null;
		Query query = null;
		Hashtable queriesTable = new Hashtable(0);
		try {
			DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
			File file = new File(filePrefix + "_"+ FILE_LOCATION);
			Document doc = docBuilder.parse(file);
			
			NodeList queries = doc.getElementsByTagName(QUERY);
			Node queryNode = null;
			if (queries != null) {
				for (int queriesIndex = 0; queriesIndex < queries.getLength(); queriesIndex++) {
					queryNode = queries.item(queriesIndex);
					System.out.println(queryNode);
					query = getQuery(queryNode);
					queriesTable.put(query.getIdentifier(), query);
				}
			}
			System.out.println(queriesTable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return queriesTable;
	}

	private Query getQuery(Node node) {
		Query query = new Query();
		query.setIdentifier(IDENTIFIER);
		NodeList childNodes = node.getChildNodes();
		for (int index = 0; index < childNodes.getLength(); index++) {
			Node childNode = childNodes.item(index);
			String nodeName = "";
			if (childNode != null
					&& (childNode.getNodeType() == Node.ELEMENT_NODE)) {
				nodeName = childNode.getNodeName();
				String value = "";
				if (childNode.getFirstChild() != null) {
					value = childNode.getFirstChild().getNodeValue();
				}
				if (IDENTIFIER.equals(nodeName)) {
					query.setIdentifier(value);
					// query = setIdentifier(childNode, query);
				} else if (DECLARATION.equals(nodeName)) {
					query.setQuery(value);
					// query = setDeclaration(childNode, query);
				} else if (DESCRIPTION.equals(nodeName)) {
					query.setDescription(value);
					// query = setDescription(childNode, query);
				} else if (MODE.equals(nodeName)) {
					query.setMode(value);
					// query = setMode(childNode, query);
				} else if (PARAMETERS.equals(nodeName)) {
					query = setParameters(childNode, query);
				}
			}
		}
		return query;
	}

	private Query setIdentifier(Node node, Query query) {
		return null;
	}

	private Query setDescription(Node node, Query query) {
		return null;
	}

	private Query setDeclaration(Node node, Query query) {
		return null;
	}

	private Query setMode(Node node, Query query) {
		return null;
	}

	private Query setParameters(Node node, Query query) {
		NodeList parameters = node.getChildNodes();
		List parametersList = new ArrayList(0);
		for (int index = 0; index < parameters.getLength(); index++) {
			Node childNode = parameters.item(index);
			String nodeName = "";
			if (childNode != null
					&& (childNode.getNodeType() == Node.ELEMENT_NODE)) {
				nodeName = childNode.getNodeName();
				if (PARAMETER.equals(nodeName)) {
					parametersList.add(getParameter(childNode));
				}
			}
		}
		query.setParameters(parametersList);
		return query;
	}

	private Parameter getParameter(Node node) {
		Parameter param = new Parameter();
		NodeList attributes = node.getChildNodes();
		for (int index = 0; index < attributes.getLength(); index++) {
			Node childNode = attributes.item(index);
			String nodeName = "";
			if (childNode != null
					&& (childNode.getNodeType() == Node.ELEMENT_NODE)) {
				nodeName = childNode.getNodeName();
				String value = "";
				if (childNode.getFirstChild() != null) {
					value = (childNode.getFirstChild().getNodeValue()).trim();
				}
				if (INDEX.equals(nodeName)) {
					param.setIndex(Short.parseShort(value));
				} else if (DATATYPE.equals(nodeName)) {
					param.setDataType(Short.parseShort(value));
				}
			}
		}
		return param;
	}

	public Query getQuery() {
		// TODO Auto-generated method stub
		return new Query();
	}
}
