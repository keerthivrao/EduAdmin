package com.db.access;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import java.util.Properties;


public class DBProperties
{
    //~ Static fields/initializers ---------------------------------------------

    private static DBProperties dbProperties = null;

    //~ Instance fields --------------------------------------------------------

    private Properties properties = new Properties();
    private String     fileName = "DBProperties.properties";

    //~ Constructors -----------------------------------------------------------

    private DBProperties()
    {
        try
        {
            properties.load(new FileInputStream(fileName));
        }
        catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    //~ Methods ----------------------------------------------------------------

    public static DBProperties getInstance()
    {
        if (dbProperties == null)
        {
            dbProperties = new DBProperties();
        }

        return dbProperties;
    }

    public String getProperty(String property)
    {
        return properties.getProperty(property);
    }
}
