package com.db.access;

/**
@Title          : Parameter.java
@Description    : Parameter that will be used to set the data in a prepared statement     
@Author         : Keerthi Venkateswara Rao
@Version        : 1.0   
*/

import java.sql.Types;

public class Parameter {
    private short  index    = Short.MIN_VALUE;

    private short    dataType = Types.VARCHAR;

    private String value    = null;

    public short getDataType() {
        return dataType;
    }

    public void setDataType(short dataType) {
        this.dataType = dataType;
    }

    public short getIndex() {
        return index;
    }

    public void setIndex(short index) {
        this.index = index;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
