package com.edu.adm.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class CacheService {
	private static CacheService cacheService = null;
	private  HashMap distributorParentMap = null;
	private  HashMap parentDistributorMap = null;
	private  HashMap distributorsPaths = null;
	private  boolean initializationInProgress = true;
	private  HashMap distributorsDetailMap = null;
	private CacheService() {
		this.distributorParentMap = new HashMap();
		this.distributorsPaths = new HashMap();
		this.parentDistributorMap = new HashMap();
		this.distributorsDetailMap = new HashMap();
    }
    public static CacheService getInstance() {
        if (cacheService == null)
            cacheService = new CacheService();
        return cacheService;
    }
    public void addDistributor()
    {
    	if(null != null)
    	{
    		distributorsDetailMap.put(null,null);
    		addDistributor(null,null);
    	}
    }
    public void addDistributor(String distributorId, String parentId)
    {
    	distributorParentMap.put(distributorId,parentId);
    	List childList = (List)parentDistributorMap.get(parentId);
    	if(childList == null)
    		childList = new ArrayList();
    	if(!childList.contains(distributorId))
    		childList.add(distributorId);
    	parentDistributorMap.put(parentId, childList);
    	if(!initializationInProgress)
    		generateDistributorPath(distributorId);
    }
    public  void deleteDistributor(String distributorId)
    {
    	distributorParentMap.remove(distributorId);
    } 
    public  Object getDistributorDetails(String distributorId)
    {
    	//DistributorDTO distributorDTO = (DistributorDTO)distributorsDetailMap.get(distributorId);
    	return null;
    } 
    public  void addDistributors(HashMap distributors)
    {
		Set keys = distributors.keySet();
		Iterator keyIterator = keys.iterator();
		String key = "";
		//DistributorDTO distributorDTO = null;
		
		while(keyIterator.hasNext())
		{
			key = (String) keyIterator.next();
		//	distributorDTO = (DistributorDTO)distributors.get(key);
		//	addDistributor(distributorDTO);
		}
    }
	public  List getDistributorPath(String distributorId)
    {
		List distributorsList = new ArrayList();
		boolean canIterate = true;
		String tmpDistributorId = distributorId;
		String parentId = "";
		while(canIterate)
		{
			distributorsList.add(tmpDistributorId);
			parentId = (String)distributorParentMap.get(tmpDistributorId);
			tmpDistributorId = parentId;
			if(tmpDistributorId == null || "".equals(tmpDistributorId) || distributorsList.contains(tmpDistributorId) )
				canIterate = false;
		}
		return distributorsList;
    }
	public  void generateDistributorsPaths()
	{
		Set keys = distributorParentMap.keySet();
		Iterator keyIterator = keys.iterator();
		String key = "";
		List upwardPath = null;
		while(keyIterator.hasNext())
		{
			key = (String) keyIterator.next();
			upwardPath = getDistributorPath(key);
			distributorsPaths.put(key, upwardPath);
		}
	}
	public  void generateDistributorPath(String distributorId)
	{
		Set keys = distributorParentMap.keySet();
		Iterator keyIterator = keys.iterator();
		String key = "";
		List upwardPath = null;
		while(keyIterator.hasNext())
		{
			key = (String) keyIterator.next();
			upwardPath = getDistributorPath(key);
			distributorsPaths.put(key, upwardPath);
			List downTree = getDistributorTree(key,new ArrayList());
		}
	}
	public List getDownTree(String distributorId,List childDistributorsTree)
	{
		return getDistributorTree(distributorId,childDistributorsTree);
	}
    public List getDistributorTree(String distributorId,List childDistributorsTree) {
        List reportingMembersTree = new ArrayList(0);
        List reportingMembersList = null;
        int reportingMembersCount = 0;
        String reportingMemberId = null;
        if(childDistributorsTree == null )
        {
        	childDistributorsTree = new ArrayList();
        }
        if(childDistributorsTree.size()==0)
        {
        	childDistributorsTree.add(distributorId);
        }
        if (parentDistributorMap.containsKey(distributorId)) {
            reportingMembersList = (List) parentDistributorMap.get(distributorId);
            if (reportingMembersList != null)
                reportingMembersCount = reportingMembersList.size();
            for (int index = 0; index < reportingMembersCount; index++) {
            	reportingMemberId = (String) reportingMembersList.get(index);                
                if (reportingMemberId != distributorId)
                {
                	if(!reportingMembersTree.contains(reportingMemberId))
                	{
                		childDistributorsTree.add(reportingMemberId);
                	}
                }
            }
            for (int index = 0; index < reportingMembersCount; index++) {
                reportingMemberId = (String) reportingMembersList.get(index);
                
                if (reportingMemberId != distributorId)
                {
               		getDistributorTree(reportingMemberId,childDistributorsTree);
                }
            }
        }
        return childDistributorsTree;
    }	
	public  boolean isInitializationInProgress() {
		
		return initializationInProgress;
	}
	public  void setInitializationInProgress(boolean initializationInProgress) {
		this.initializationInProgress = (this.initializationInProgress && initializationInProgress);
		generateDistributorsPaths();
	}
	public HashMap getDistributorParentMap() {
		return distributorParentMap;
	}
	public HashMap getParentDistributorMap() {
		return parentDistributorMap;
	}
}
