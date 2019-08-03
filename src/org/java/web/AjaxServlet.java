package org.java.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.dao.AjaxDao;

import com.alibaba.fastjson.JSON;

public class AjaxServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AjaxDao dao = new AjaxDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if(method.equals("load"))load(request, response);
    }
    //�������ݵķ���
    protected void load(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //������Ӧ����
        response.setContentType("text/html;charset=utf-8");
        //���������
        PrintWriter out = response.getWriter();

        //��÷�ҳ�Ĳ���
        int page = Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));

        //��ѯ���ݿ⣬�õ�����
        List<Map<String,String>> list = dao.load(page,limit);
        //��������
        int count = dao.getMyCount();
        //layuiҪ��json�󶨵����ݱ���У������ݸ�ʽ��Ҫ��
        //json�У���������ĸ�����
        //1��code:��ʾ�����״̬������Ϊ0����ʾ����������
        //2��msg:��Ϣ��ʾ������ Ϊ��
        //3��count:���ص����ݱ��������
        //4��data:Ҫ�����ݱ��ļ���

        Map<String,Object> m = new HashMap<String, Object>();
        m.put("code",0);
        m.put("msg", "");
        m.put("data",list);
        m.put("count",count);

        //��json�ķ�ʽ����
        String json = JSON.toJSONString(m);
        out.write(json);
        out.flush();
        out.close();



    }

}
