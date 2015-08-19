package com.db.access;

import java.util.ArrayList;
import java.util.List;

public class QueryResults {
    private List results      = null;

    private List headers      = null;

    private int  dataLength   = 0;

    private int  headerLength = 0;
    
    private int affectedRows = 0;
    
    private int generatedNum = 0;
    //-- ideally these two should be equal --//
    public List getHeaders() {
        return headers;
    }

    public int getAffectedRows() {
        return affectedRows;
    }

    public void setAffectedRows(int affectedRows) {
        this.affectedRows = affectedRows;
    }

    public void setHeaders(List headers) {
        this.headers = headers;
    }

    public List getResults() {
        return results;
    }

    public void setResults(List results) {
        this.results = results;
    }
    public void add(Object value) {
        if(results == null){
            results = new ArrayList(0);
        }
        results.add(value);
        dataLength = results.size();
    }
    public void add(DataRow value) {
        if(results == null){
            results = new ArrayList(0);
        }
        results.add(value);
        dataLength = results.size();
    }

    public void add(List values) {
        if(results == null){
            results = new ArrayList(0);
        }
        results.addAll(values);
        dataLength = results.size();
    }

    public void addHeader(String value) {
        if(headers == null){
            headers = new ArrayList(0);
        }
        headers.add(value);
        headerLength = headers.size();
    }

    public void addHeader(List values) {
        if(headers == null){
            headers = new ArrayList(0);
        }
        headers.addAll(values);
        headerLength = headers.size();
    }

    public int getHeaderLength() {
        if(headers != null){
            headerLength = headers.size();
        }
        return headerLength;
    }
    public Object getBeanData(int rowIndex) {
        if(results != null && rowIndex <= (dataLength - 1)){
            return results.get(rowIndex);
        }
        return new Object();
    }
    public DataRow getRowData(int rowIndex) {
        if(results != null && rowIndex <= (dataLength - 1)){
            return (DataRow) results.get(rowIndex);
        }
        return new DataRow();
    }

    public int getHeaderSize() {
        return getHeaderLength();
    }

    public int headerSize() {
        return getHeaderLength();
    }

    public int getLength() {
        return dataLength;
    }

    public int getSize() {
        return dataLength;
    }

    public int size() {
        return dataLength;
    }

	public int getGeneratedNum() {
		return generatedNum;
	}

	public void setGeneratedNum(int generatedNum) {
		this.generatedNum = generatedNum;
	}
}