package controller;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.platformService;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ashun on 16/6/9.
 */

@Controller
public class platformController {

    @Autowired
    private platformService platformService;

    @RequestMapping(value = "/platform",method = RequestMethod.GET)
    public String showHomepage1()
    {

        return "platform";
    }

    //测试responseBody
    @RequestMapping(value = "/json",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> hello(){
        Map<String,Object> result = new HashMap<String, Object>();
        String s = "Mark";
        ArrayList<String> list = new ArrayList<String>();
        list.add("Hello");
        list.add("World");
        Map<String,String> abc = new HashMap<String, String>();
        abc.put("abb", "蠢驴");
        abc.put("aaa", "逗比");

        result.put("first", s);
        result.put("second", list);
        result.put("third", abc);

        return result;
    }

    @RequestMapping(value = "/openplatform",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> openplatform(String stockCode, boolean box1, boolean box2, boolean box3, boolean box4, boolean box5, boolean box6, boolean box7, boolean box8, boolean box9, boolean box10, boolean box11, boolean box12, String start, String end){
        Map<String,Object> result = new HashMap<String, Object>();
        String real = platformService.get_real_time_tag(stockCode);
        JSONArray jsonArray = JSONArray.fromObject(real);
        JSONObject object = jsonArray.getJSONObject(0);
        Map<String,String> RealQuoteData = new HashMap<String, String>();
        if(box1){
            RealQuoteData.put("price",object.getString("price"));
        }
        if(box2){
            RealQuoteData.put("name",object.getString("name"));
        }
        if(box3){
            RealQuoteData.put("open",object.getString("open"));
        }
        if(box4){
            RealQuoteData.put("pre_close",object.getString("pre_close"));
        }
        if(box5){
            RealQuoteData.put("high",object.getString("high"));
        }
        if(box6){
            RealQuoteData.put("low",object.getString("low"));
        }
        if(box7){
            RealQuoteData.put("bid",object.getString("bid"));
        }
        if(box8){
            RealQuoteData.put("ask",object.getString("ask"));
        }
        if(box9){
            RealQuoteData.put("volume",object.getString("volume"));
        }
        if(box10){
            RealQuoteData.put("amount",object.getString("amount"));
        }
        if(box11){
            RealQuoteData.put("date",object.getString("date"));
        }
        if(box12){
            RealQuoteData.put("time",object.getString("time"));
        }

        String history = platformService.get_history_tag(stockCode,start,end);
        JSONArray json = JSONArray.fromObject(history);
        //JSONObject item = json.getJSONObject(0);
        //result.put("test",json.getJSONObject(0).getString("date"));
        result.put("RealQuoteData",RealQuoteData);
        result.put("HistoryQuoteData",json);


        return result;

    }


}
