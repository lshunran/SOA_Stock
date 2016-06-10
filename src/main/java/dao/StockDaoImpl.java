package dao;

import entity.Stock;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

/**
 * Created by fordevelopment on 15/6/22.
 */
@Repository
public class StockDaoImpl implements StockDao {


    private EntityManager em;
    @PersistenceContext
    void setEntityManager(EntityManager entityManager) { this.em = entityManager; }

    public String get_data(String urlAll,String charset)
    {

        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        String userAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";//模拟浏览器
        try {
            URL url = new URL(urlAll);
            HttpURLConnection connection = (HttpURLConnection)url.openConnection();
            connection.setRequestMethod("GET");
            connection.setReadTimeout(30000);
            connection.setConnectTimeout(30000);
            connection.setRequestProperty("User-agent",userAgent);
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(
                    is, charset));
            String strRead = null;
            while ((strRead = reader.readLine()) != null) {
                sbf.append(strRead);
                sbf.append("\r\n");
            }
            reader.close();
            result = sbf.toString();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }




    public Stock get_stock_information(String stockCode) {
        Query query = em.createQuery("select s from Stock s where s.code like :stockCode");
        query.setParameter("stockCode",stockCode);
        return (Stock)query.getSingleResult();
    }

    public String get_history(String stockCode) {



        //构造url
        String urlAll = "http://localhost:8080/history?request="+stockCode;
        String charset = "UTF-8";


       return get_data(urlAll,charset);


    }

    public String get_history_tag(String stockCode, String start, String end) {
        String urlAll = "http://localhost:8080/historytag?request="+stockCode+"&start="+start+"&end="+end;
        String charset = "UTF-8";


        return get_data(urlAll,charset);
    }

    public String get_real_time(String stockCode) {
        //构造url
        String urlAll = "http://localhost:8080/realtime?request="+stockCode;
        String charset = "UTF-8";


        return get_data(urlAll,charset);
    }

    public String get_tick_data(String stockCode, String date) {
        String urlAll = "http://localhost:8080/tick_data?request="+stockCode+"&date="+date;
        String charset = "UTF-8";


        return get_data(urlAll,charset);
    }

    public String get_today(String stockCode) {
        String urlAll = "http://localhost:8080/today?request="+stockCode;
        String charset = "UTF-8";


        return get_data(urlAll,charset);
    }


    public String get_index() {
        String urlAll = "http://localhost:8080/index";
        String charset = "UTF-8";

        return get_data(urlAll,charset);
    }

    public String get_realtime_list(String request) {
        String urlAll = "http://localhost:8080/realtime_list?request="+request;
        String charset = "UTF-8";

        return get_data(urlAll, charset);
    }
}
