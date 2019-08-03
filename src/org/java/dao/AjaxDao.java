package org.java.dao;

import java.util.Map;

import java.util.List;

public class AjaxDao extends BaseDao {

    public List<Map<String, String>> load(int page,int  limit){
        //���㿪ʼ�±�
        int start = (page-1)*limit;
        String sql = "select * from info limit ?,?";
        return findAllMap(sql,start,limit);
    }

    public int getMyCount(){
        String sql="select count(*) from info";
        return getCount(sql);
    }

}
