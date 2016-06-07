package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Webapi;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by fordevelopment on 15/6/22.
 */
@Controller
@RequestMapping(value = "/data",method = RequestMethod.GET)
public class AjaxController {
    @Autowired
    private Webapi webapi;

    @ResponseBody
    @RequestMapping(value = "/history")
    public String get_history(String request,ServletResponse response)
    {
        String json = webapi.get_history(request);
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(json);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return json;
    }

    @RequestMapping(value = "/realtime")
    public void get_real_time(String request,ServletResponse response)
    {
        String json = webapi.get_real_time(request);
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/json;charset=UTF-8");

            PrintWriter out = response.getWriter();
            out.print(json);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/realtime_list")
    public void get_realtime_list(String request,ServletResponse response)
    {
        String json = webapi.get_realtime_list(request);
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/json;charset=UTF-8");

            PrintWriter out = response.getWriter();
            out.print(json);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/tick_data")
    public void get_tick_data(String request,String date,ServletResponse response)
    {
        String json = webapi.get_tick_data(request,date);
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/json;charset=UTF-8");

            PrintWriter out = response.getWriter();
            out.print(json);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping(value = "/today")
    public void get_today(String request,ServletResponse response)
    {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json;charset=UTF-8");

        String json = webapi.get_today(request);
        try {
            PrintWriter out = response.getWriter();
            out.print(json);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/index")
    public void get_index(ServletResponse response)
    {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json;charset=UTF-8");

        String json = webapi.get_index();
        try {
            PrintWriter out = response.getWriter();
            out.print(json);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}


