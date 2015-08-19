package com.db.access;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class Utils {
    public Object populateProperties(String beanName, HashMap propertyMap) {
        Object beanToBePopulated = null;
        try{
            beanToBePopulated = Class.forName(beanName).newInstance();
        }
        catch(InstantiationException e){
            e.printStackTrace();
        }
        catch(IllegalAccessException e){
            e.printStackTrace();
        }
        catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        return populateProperties(beanToBePopulated, propertyMap);
    }

    public Object populateProperties(Object beanToBePopulated, HashMap propertyMap) {
        if(beanToBePopulated != null && propertyMap != null){
            Set keys = propertyMap.keySet();
            Iterator keyIterator = keys.iterator();
            String key = "";
            Method[] methods = beanToBePopulated.getClass().getMethods();
            while(keyIterator.hasNext()){
                key = (String) keyIterator.next();
                Method method;
                Field field;
                String fieldValue;
                try{
                	//field = beanToBePopulated.getClass().getField(key);
                	fieldValue =(String) propertyMap.get(key);
                	if(fieldValue == null)
                	{
                		fieldValue = "";
                	}
                	key = "set"+key.substring(0,1).toUpperCase()+key.substring(1);
                	Class[] parameter = new Class[1];
                	parameter[0] = String.class;
            		if(isMethodAvailable(methods,key))
            		{
            			method = beanToBePopulated.getClass().getMethod(key,parameter);
                		if(!method.isAccessible())
                			method.invoke(beanToBePopulated, new Object[]{fieldValue});
                		else
                			System.out.println("["+key+"] Method not accessible");
            		}
            		else
            		{
                		System.out.println("["+key+"] Method not available");
            		}
                    //field.set(beanToBePopulated, propertyMap.get(key));
                }
                catch(SecurityException e){
                    e.printStackTrace();
                }
                //catch(NoSuchFieldException e){
                    //e.printStackTrace();
                //}
                catch(IllegalArgumentException e){
                    e.printStackTrace();
                }
                catch(IllegalAccessException e){
                    e.printStackTrace();
                } catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            }
        }
        return beanToBePopulated;
    }
    private boolean isMethodAvailable(Method[] methods,String methodName)
    {
    	if(methods != null && methods.length>0 && methodName != null && !"".equals(methodName))
    	{
    		Method method = null;
    		for(int index =0; index < methods.length;index++)
    		{
    			method = methods[index];
    			if(methodName.equals(method.getName()))
    			{
    				return true;
    			}
    		}
    	}
    	return false;
    }
}
