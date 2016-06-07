package service;

import dao.StockDao;
import entity.Stock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fordevelopment on 15/6/22.
 */
@Service
public class Webapi {

    @Autowired
    StockDao stockDao;

    public String get_history(String stockCode)
    {
        return stockDao.get_history(stockCode);
    }
    public String get_real_time(String stockCode)
    {
        return stockDao.get_real_time(stockCode);
    }

    public String get_tick_data(String stockCode,String date)
    {
        return stockDao.get_tick_data(stockCode,date);
    }

    public Stock get_stock_information(String stockCode)
    {
        return stockDao.get_stock_information(stockCode);
    }

    public String get_today(String stockCode) {
        return stockDao.get_today(stockCode);
    }

    public String get_index(){ return stockDao.get_index();}

    public String get_realtime_list(String request) {
        return stockDao.get_realtime_list(request);
    }
}
