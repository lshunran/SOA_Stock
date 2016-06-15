package service;

import dao.AlertDao;
import entity.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ashun on 16/6/12.
 */
@Service("alertService")
public class AlertService{
    @Autowired
    AlertDao alertDao;
    public void add_Alert(String username, boolean limitup, boolean limitdown, int infomine, int bigdeal, int volume, int amount, String stockId){
        System.out.print("stockId:"+stockId+","+bigdeal);
        int up = 0;
        int down = 0;
        if(limitup){
            up = 1;
        }
        if(limitdown){
            down = 1;
        }
        alertDao.add_Alert(username,up,down,infomine,bigdeal,volume,amount,stockId);
    }
    public List<Alert> get_AlertByUsername(String username){
        return alertDao.get_AlertByUsername(username);
    }
}
