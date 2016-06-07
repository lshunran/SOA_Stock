package dao;

import entity.Stock;

/**
 * Created by fordevelopment on 15/6/22.
 */
public interface StockDao {

    Stock get_stock_information(String stockCode);
    String get_history(String stockCode);
    String get_real_time(String stockCode);

    String get_tick_data(String stockCode, String date);

    String get_today(String stockCode);

    String get_index();

    String get_realtime_list(String request);
}
