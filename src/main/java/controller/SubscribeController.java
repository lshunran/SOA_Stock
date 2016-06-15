package controller;

import entity.Alert;
import entity.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    @ResponseBody
    public void add_alert(String username, int limitup, int limitdown, int infomine, int bigdeal, int volume, int amount,String stockId){
        boolean up = false;
        boolean down = false;
        if(limitup == 1){
            up = true;
        }
        if(limitdown == 1){
            down = true;
        }
        alertService.add_Alert(username,up,down,infomine,bigdeal,volume,amount,stockId);
    }

    @RequestMapping(value = "/getalert")
    @ResponseBody
    public Map<String,Object> get_alert(String username){
        System.out.print("username:"+username);
        Map<String,Object> result = new HashMap<String, Object>();
        List<Alert> alerts = new ArrayList<Alert>();
        alerts = alertService.get_AlertByUsername(username);
        String name = alerts.get(0).getUsername();
        int limitup = alerts.get(0).getLimitup();
        int limitdown = alerts.get(0).getLimitdown();
        String stockId = alerts.get(0).getStockid();
        int bigdealnum = alerts.get(0).getBigdeal();
        int volumenum = alerts.get(0).getVolume();
        int amountnum = alerts.get(0).getAmount();

        if(limitup == 1){
            msgService.sendLimitMsg(stockId, name, 1);
        }
        if(limitdown == 1){
            msgService.sendLimitMsg(stockId, name, 0);
        }
        if(bigdealnum > 0){
            msgService.sendOtherMsg(stockId, name, 1, bigdealnum);
        }
        if(volumenum > 0){
            msgService.sendOtherMsg(stockId, name, 2, volumenum);
        }
        if(amountnum > 0){
            msgService.sendOtherMsg(stockId, name, 3, amountnum);
        }

        return result;
    }

    @RequestMapping(value = "/getmsg")
    @ResponseBody
    public Map<String,Object> get_msg(String username){
        Map<String,Object> result = new HashMap<String, Object>();
        List<Msg> msgs = new ArrayList<Msg>();
        msgs = msgService.getMsg(username);
        result.put("msg", msgs);
        return result;
    }

    @RequestMapping(value = "/setlimit")
    @ResponseBody
    public void set_limitmsg(String stockCode, String username, int tag){
        msgService.sendLimitMsg(stockCode, username, tag);
    }

    @RequestMapping(value = "/setother")
    @ResponseBody
    public void set_othermsg(String stockCode, String username, int catalog, int num){
        msgService.sendOtherMsg(stockCode, username,catalog,num);
    }
}
