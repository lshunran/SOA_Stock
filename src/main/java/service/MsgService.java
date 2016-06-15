package service;

import dao.MsgDao;
import dao.StockDao;
import entity.Msg;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by ashun on 16/6/12.
 */
@Service("MsgService")
@Transactional
public class MsgService {

    @Autowired
    StockDao stockDao;
    @Autowired
    MsgDao msgDao;

    private EntityManager em;
    @PersistenceContext
    void setEntityManager(EntityManager entityManager) { this.em = entityManager; }

    public void sendLimitMsg(String stockCode, String username, int tag)
    {
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
        String time = dateFormat.format( now );
        //System.out.println(time);

        String real = stockDao.get_real_time(stockCode);
        //String real = "[{\"pre_close\":\"39.120\",\"price\":\"48.540\"}]";
        JSONArray json = JSONArray.fromObject(real);
        JSONObject item = json.getJSONObject(0);
        float price = Float.parseFloat(item.get("price").toString());
        float pre_close = Float.parseFloat(item.get("pre_close").toString());
        System.out.print("/////msg:"+price+pre_close);
        float change = (price - pre_close)/pre_close*100;
        String msg_content = "The stock ("+stockCode;
        if(change > 9.5 && tag == 1){
            Msg msg = new Msg();
            msg.setUsername(username);
            msg.setContent(msg_content+") you subscribe will limit up,Please see the details immediately.");
            msg.setDate(time);
            em.persist(msg);

        }else if (change < -9.5 && tag == 0){
            Msg msg = new Msg();
            msg.setUsername(username);
            msg.setContent(msg_content+") you subscribe will limit down,Please see the details immediately.");
            msg.setDate(time);
            em.persist(msg);
        }
    }

    public void sendOtherMsg(String stockCode, String username, int catalog, int num){
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
        String time = dateFormat.format( now );
        String real = stockDao.get_real_time(stockCode);
        //String real = "[{\"amount\":\"111140794.070\",\"volume\":\"2876247\",\"b1_v\":\"73\"}]";
        JSONArray json = JSONArray.fromObject(real);
        JSONObject item = json.getJSONObject(0);
        int amount = item.getInt("amount");
        int volume = item.getInt("volume");
        int b1_v = item.getInt("b1_v");
        String msg_content = "The stock ("+stockCode;
        System.out.print("catalog:"+catalog+num);

        if(catalog == 1 && b1_v >= num){
            Msg msg = new Msg();
            msg.setUsername(username);
            msg.setContent(msg_content+") is Commissioned to buy on large size,Please see the details immediately.");
            msg.setDate(time);
            em.persist(msg);

        }
        else if(catalog == 2 && volume >= num){
            Msg msg = new Msg();
            msg.setUsername(username);
            msg.setContent("The stock's ("+stockCode+") volume reached threshold,Please see the details immediately.");
            msg.setDate(time);
            em.persist(msg);
        }
        else if(catalog == 3 && amount >= num){
            Msg msg = new Msg();
            msg.setUsername(username);
            msg.setContent("The stock's ("+stockCode+") turnover reached the threshold,Please see the details immediately.");
            msg.setDate(time);
            em.persist(msg);
        }

    }

    public List<Msg> getMsg(String username){
        List<Msg> msg = new ArrayList<Msg>();

        msg = msgDao.getMsg(username);
        return msg;

    }
}
