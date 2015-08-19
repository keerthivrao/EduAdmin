package com.db.access;

public class SampleDTO {
    public String lookupcode = "";

   
    public String toString()
    {
        return "lookupcode : ["+lookupcode+"]";
    }

	public String getLookupcode() {
		return lookupcode;
	}

	public void setLookupcode(String lookupcode) {
		this.lookupcode = lookupcode;
	}
}
