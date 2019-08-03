package org.java.dao;
/**
 * 公共数据访问对象
 * @author Administrator
 *
 */
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import sun.net.www.MeteredStream;
public class BaseDao {

	protected Connection con;
	protected PreparedStatement pst;
	protected ResultSet rs;
	
	private static String url;
	private static String driver;
	private static String user;
	private static String pwd;
	
	static{
		init();
	}
	//初始化的方法 ，获得基本的连接信息
	public static void init(){
		//创建属性类
		Properties p = new Properties();
		//用输入流，读取指定的属性文件 
		InputStream in  = BaseDao.class.getClassLoader().getResourceAsStream("jdbc.properties");
		//把输入流的信息加到properties对象中
		try {
			p.load(in);
			//通过p对象，通过key取对应的值
			url = p.getProperty("url");
			driver = p.getProperty("driver");
			user = p.getProperty("user");
			pwd = p.getProperty("pwd");
			
			//关闭流
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	//产生连接的方法 
	public Connection getConn() throws Exception{
		Class.forName(driver);
		con = DriverManager.getConnection(url,user,pwd);
		return con;
	}
	
	//关闭资源
	public void close(){
		try {
			if(rs!=null)rs.close();
			if(pst!=null)pst.close();
			if(con!=null)con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}
	public int getCount(String sql,Object...args){
		try {
			pst = getConn().prepareStatement(sql);
			if(args!=null){
				for(int i=0;i<args.length;i++){
					pst.setObject(i+1,args[i]);
				}
			}
			rs = pst.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return 0;
	}
	
	
	//增删改的方法 
	public int executeUpdate(String sql,Object...args){
		try {
			pst = getConn().prepareStatement(sql);
			if(args!=null){
				for(int i=0;i<args.length;i++){
					pst.setObject(i+1,args[i]);
				}
			}
			int rows =pst.executeUpdate();
			return rows;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return 0;
	}
	
	//查询的方法 
	public ResultSet executeQuery(String sql,Object...args) throws Exception{
		pst = getConn().prepareStatement(sql);
		if(args!=null){
			for(int i=0;i<args.length;i++){
				pst.setObject(i+1,args[i]);
			}
		}
		rs = pst.executeQuery();
		return rs;
	}

	public List<Map<String,String>> findAllMap(String sql,Object...args){
		List<Map<String,String>> list  = new ArrayList<Map<String,String>>();
		try {
			pst = getConn().prepareStatement(sql);
			if(args!=null){
				for(int i=0;i<args.length;i++){
					pst.setObject(i+1,args[i]);
				}
			}
			rs = pst.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			String[] names = new String[metaData.getColumnCount()];
			for(int i=0;i<names.length;i++){
				names[i]=metaData.getColumnName(i+1);
			}
			while(rs.next()){
				Map<String,String> map = new HashMap<String,String>();
				for(String key:names){
					map.put(key,rs.getString(key));
					
				}
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}

	
}
