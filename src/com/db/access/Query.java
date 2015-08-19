package com.db.access;

/**
 @Title          : Query.java
 @Description    : Query, an object representation of a Query <SELECT selectFields order by column sortOrder>     
 @Author         : Keerthi Venkateswara Rao
 @Version        : 1.0   
 */
import java.util.ArrayList;
import java.util.List;

public class Query {
    private String identifier  = null;

    private String query       = null;

    private String description = null;

    private String mode        = null;

    private List   parameters  = null;
    
    private boolean executeAsBatch = false;

    public boolean isExecuteAsBatch() {
		return executeAsBatch;
	}

	public void setExecuteAsBatch(boolean executeAsBatch) {
		this.executeAsBatch = executeAsBatch;
	}

	public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public List getParameters() {
        return parameters;
    }

    public void setParameters(List parameters) {
        this.parameters = parameters;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    /*
    public void addParameter(short dataType) {
        Parameter param = new Parameter();
        param.setDataType(dataType);
        if(parameters == null){
            parameters = new ArrayList(0);
        }
        parameters.add(param);
    }
    */

    /*
     * adding a where clause requires adding constraints
     */
    /*
    public void appendAndCritirion(String constraint) {
        if(query.toLowerCase().indexOf(" where ") != -1){
            constraint = " AND " + constraint;
        }
        else{
            constraint = " WHERE " + constraint;
        }
        query += constraint;
    }

    public void appendOrCritirion(String constraint) {
        if(query.toLowerCase().indexOf(" where ") != -1){
            constraint = " OR " + constraint;
        }
        else{
            constraint = " WHERE " + constraint;
        }
        query += constraint;
    }

    public void addWhereClause(String constraint) {
        appendAndCritirion(constraint);
    }

	public void setWhereClause(String whereClause) {
		if(query.indexOf("WHERE")>0){
			query+=" AND ( "+whereClause+" )";
		}else {
			query+=" WHERE ( "+whereClause+" )";
		}
			
		
	}

	public void setOrderBy(String orderBy) {
		query+=orderBy;		
	}
    */
}
