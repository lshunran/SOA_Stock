package service;

import dao.AlertDao;
import entity.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ashun on 16/6/12.
 */
@Service
public class AlertService {
    @Autowired
    AlertDao alertDao;
    public void add_Alert(String username, int limitup, int limitdown, int infomine, int bigdeal, int volume, int amount){
        alertDao.add_Alert(username,limitup,limitdown,infomine,bigdeal,volume,amount);
    }
    public List<Alert> get_AlertByUsername(String username){
        return alertDao.get_AlertByUsername(username);
    }
}
