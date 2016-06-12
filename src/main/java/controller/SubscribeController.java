package controller;

import entity.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.AlertService;
import service.MsgService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ashun on 16/6/11.
 */
@Controller
@RequestMapping(value = "/subscribe")
public class SubscribeController {
    @Autowired
    AlertService alertService;
    @Autowired
    MsgService msgService;


    @RequestMapping(value = "/")
    public String subscribePage(){
        return "subscribe";
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public void add_alert(String username, int limitup, int limitdown, int infomine, int bigdeal, int volume, int amount){
        alertService.add_Alert(username,limitup,limitdown,infomine,bigdeal,volume,amount);
    }

    @RequestMapping(value = "/getalert")
    @ResponseBody
    public Map<String,Object> get_alert(String username){
        Map<String,Object> result = new HashMap<String, Object>();
        List<Alert> alerts = new ArrayList<Alert>();
        alerts = alertService.get_AlertByUsername(username);
        result.put("username", alerts.get(0).getUsername());
        result.put("limitup", alerts.get(0).getLimitup());
        result.put("limitdown", alerts.get(0).getLimitdown());
        result.put("infomine", alerts.get(0).getInfomine());
        result.put("bigdeal", alerts.get(0).getBigdeal());
        result.put("volume", alerts.get(0).getVolume());
        result.put("amount", alerts.get(0).getAmount());
        return result;
    }

    @RequestMapping(value = "/set")
    @ResponseBody
    public void set_msg(String stockCode, String username){
        msgService.sendLimitMsg(stockCode, username);
    }
}
