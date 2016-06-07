package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ashun on 16/4/16.
 */
@Controller

public class USAStockController {

    @RequestMapping(value = "/USAstockpage",method = RequestMethod.GET)
    public String showStockpage()
    {
        return "USAstockpage";
    }


    @ResponseBody
    @RequestMapping(value = "/USArealdata",method = RequestMethod.GET)
    public Map<String,Object> USA_real_data(String code ,ServletResponse response, HttpServletRequest request) throws IOException, ParserConfigurationException, SAXException {

        Map<String,Object> result = new HashMap<String, Object>();
//        System.out.print(a);
        String stockcode = null;
//        stockcode = request.getParameter("stockcode");
        String httpUrl = "http://www.enclout.com/api/v1/yahoo_finance/show.xml?&auth_token=8kmgUK5_xosAsuAw9SDe&text=" + code;
//        String httpUrl = "http://ondemand.websol.barchart.com/getChart.xml?symbols=YHOO%2CMSFT&type=LINE&width=700&height=550&volume=false&period=1d&indicators=BBANDS%2820%2C2%29%3BMACD%2812%2C26%2C9%29 ";
     // String httpUrl = "http://api.tradier.com/v1/markets/quotes?symbols=" + stockcode;
//        BufferedReader reader = null;
//        String result = null;
//        StringBuffer sbf = new StringBuffer();
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();


        URL url = new URL(httpUrl);
        HttpURLConnection connection = (HttpURLConnection) url
                .openConnection();
        connection.setRequestMethod("GET");
        // 填入apikey到HTTP header
//
        connection.setRequestProperty("Accept", "application/xml");
//        connection.setRequestProperty("Authorization", "Bearer {CDDQJxk8309qGN7JcRjOFaQqHYG0}");
 //       connection.setRequestProperty("_Token", "8C5B23D3B4DA4F998D87921C61244D67");

        connection.connect();
        InputStream is = connection.getInputStream();
        InputStreamReader isr = new InputStreamReader(is, "UTF-8");

//        reader = new BufferedReader(isr);
//        String strRead = null;
//        while ((strRead = reader.readLine()) != null) {
//            sbf.append(strRead);
//            sbf.append("\r\n");
//        }
//        reader.close();
//        result = sbf.toString();





//        PrintWriter out = response.getWriter();
//        out.print(result);
//        out.close();
//        System.out.print("result:"+result);

        InputSource source = new InputSource(isr);
        Document doc = builder.parse(source);
        Element symbol = (Element) doc.getElementsByTagName("symbol").item(0);
        Element open = (Element) doc.getElementsByTagName("open").item(0);
        Element close = (Element) doc.getElementsByTagName("close").item(0);
        Element high = (Element) doc.getElementsByTagName("high").item(0);
        Element low = (Element) doc.getElementsByTagName("low").item(0);
        Element high52 = (Element) doc.getElementsByTagName("high-52-weeks").item(0);
        Element low52 = (Element) doc.getElementsByTagName("low-52-weeks").item(0);
        Element enddate = (Element) doc.getElementsByTagName("last-trade-date").item(0);
        Element volume = (Element) doc.getElementsByTagName("volume").item(0);

        //System.out.print("symbol:"+symbol.getTextContent());
        result.put("stockname",symbol.getTextContent());
        result.put("open",open.getTextContent());
        result.put("close",close.getTextContent());
        result.put("high",high.getTextContent());
        result.put("low",low.getTextContent());
        result.put("high52",high52.getTextContent());
        result.put("low52",low52.getTextContent());
        result.put("enddate",enddate.getTextContent());
        result.put("volume",volume.getTextContent());

        return result;

    }


    @ResponseBody
    @RequestMapping(value = "/USArealdata1",method = RequestMethod.GET)
    public Map<String,Object> USA_real_data1(String code ,ServletResponse response, HttpServletRequest request) throws IOException, ParserConfigurationException, SAXException {

        Map<String, Object> result = new HashMap<String, Object>();
        String httpUrl = "http://ws.cdyne.com/delayedstockquote/delayedstockquote.asmx/GetQuote?StockSymbol="+code+"&LicenseKey=0";

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        URL url = new URL(httpUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Accept", "application/xml");

        connection.connect();
        InputStream is = connection.getInputStream();
        InputStreamReader isr = new InputStreamReader(is, "UTF-8");

        InputSource source = new InputSource(isr);
        Document doc = builder.parse(source);
        Element symbol = (Element) doc.getElementsByTagName("StockSymbol").item(0);
        Element LastTradeDateTime = (Element) doc.getElementsByTagName("LastTradeDateTime").item(0);
        Element StockChange = (Element) doc.getElementsByTagName("StockChange").item(0);
        Element PrevCls = (Element) doc.getElementsByTagName("PrevCls").item(0);
        Element ChangePercent = (Element) doc.getElementsByTagName("ChangePercent").item(0);
        Element EarnPerShare = (Element) doc.getElementsByTagName("EarnPerShare").item(0);
        Element PE = (Element) doc.getElementsByTagName("PE").item(0);
        Element CompanyName = (Element) doc.getElementsByTagName("CompanyName").item(0);

        result.put("LastTradeDateTime",LastTradeDateTime.getTextContent());
        result.put("StockChange",StockChange.getTextContent());
        result.put("PrevCls",PrevCls.getTextContent());
        result.put("ChangePercent",ChangePercent.getTextContent());
        result.put("EarnPerShare",EarnPerShare.getTextContent());
        result.put("PE",PE.getTextContent());
        result.put("CompanyName",CompanyName.getTextContent());

        System.out.print("CompanyName:" + CompanyName);


        return result;
    }
//
}
