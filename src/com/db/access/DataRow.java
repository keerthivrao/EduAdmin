package com.db.access;

import java.util.ArrayList;
import java.util.List;

public class DataRow {
    private List columnValues = null;

    private int  length       = 0;

    public List getColumnValues() {
        return columnValues;
    }

    public void setColumnValues(List columnValues) {
        this.columnValues = columnValues;
        if(columnValues != null){
            length = columnValues.size();
        }
    }

    public void add(String value) {
        if(columnValues == null){
            columnValues = new ArrayList(0);
        }
        columnValues.add(value);
        length = columnValues.size();
    }

    public void add(List values) {
        if(columnValues == null){
            columnValues = new ArrayList(0);
        }
        columnValues.addAll(values);
        length = columnValues.size();
    }

    public int getLength() {
        return length;
    }

    public int getSize() {
        return length;
    }

    public int size() {
        return length;
    }

    public String get(int colIndex) {
        if(columnValues != null && colIndex <= (length - 1)){
            return (String) columnValues.get(colIndex);
        }
        return "";
    }
}
