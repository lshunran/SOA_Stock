package service;

import dao.StockDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ashun on 16/6/10.
 */
@Service
public class platformService {

    @Autowired
    StockDao stockDao;

    public String get_history_tag(String stockCode, String start,String end)
    {
        return stockDao.get_history_tag(stockCode,start,end);
    }
    public String get_real_time_tag(String stockCode)
    {
        return stockDao.get_real_time(stockCode);
    }
}
