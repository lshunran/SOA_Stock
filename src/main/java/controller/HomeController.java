package controller;

import com.demo.client.HelloWorld;
import com.demo.client.HelloWorldService;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.UserService;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

/**
 * Created by fordevelopment on 15/6/22.
 */
@Controller
public class HomeController {

    @Autowired
    UserService userService;

    String httpUrl = "http://apis.baidu.com/showapi_open_bus/channel_news/search_news";
    String httpArg = "channelId=5572a109b3cdc86cf39001e0&channelName=%E5%9B%BD%E5%86%85%E6%9C%80%E6%96%B0&title=%E4%B8%8A%E5%B8%82&page=1";


    @RequestMapping(value = "/homepage",method = RequestMethod.GET)
    public String showHomepage()
    {
        //HelloWorldService mywebService = new HelloWorldService();

        /**
         * <port name="HelloServicePort" binding="tns:HelloServicePortBinding">
         */
        //HelloWorld hs = mywebService.getHelloWorldPort();
        //System.out.println(hs.sayHelloWorldFrom("sjk"));


        return "homepage";
    }
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String showHomepage1()
    {

        return "homepage";
    }


    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public void Login1(ModelMap map,HttpServletRequest resquest,HttpServletResponse response,HttpSession session)  {
        String username = resquest.getParameter("username");
        String password = resquest.getParameter("password");
        int flag;
        List<User> loginresult = userService.UserLogin(username,password);
        if(loginresult.size()==0)
        {
            flag=0;
            System.out.print("failure");
        }
        else
        {
            flag=1;
            System.out.print("success");
            session.setAttribute("id",userService.get_user(username).getId());
            session.setAttribute("name",username);
            session.setAttribute("word",password);
        }
        System.out.print(flag);

        try {
            PrintWriter pw = response.getWriter();
            pw.print(flag);
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String Register(HttpServletRequest request,HttpSession session){
        String username = request.getParameter("reg-username");
        String password = request.getParameter("reg-password");
        userService.UserRegister(username,password);
        session.setAttribute("id",userService.get_user(username).getId());
        session.setAttribute("name",username);
        session.setAttribute("word",password);
        return "homepage";
    }

    @RequestMapping(value = "/exit")
    public void myexit(HttpSession session,HttpServletResponse response){
        session.removeAttribute("id");
        session.removeAttribute("name");
        session.removeAttribute("word");
        System.out.print(1234);
        try {
            response.sendRedirect("/homepage");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/get_News")
    public void get_News(HttpSession session,ServletResponse response,HttpServletRequest request) throws IOException {
        String page = request.getParameter("page");

        System.out.print("page:" + page);


        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        String get_news_url;
        get_news_url = httpUrl + "?" + httpArg;

        URL url = new URL(get_news_url);
        HttpURLConnection connection = (HttpURLConnection) url
                .openConnection();
        connection.setRequestMethod("GET");
        // 填入apikey到HTTP header
        connection.setRequestProperty("apikey", "b84775ee75417c608c4cfadaa4248b13");
        connection.connect();
        InputStream is = connection.getInputStream();
        reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
        String strRead = null;
        while ((strRead = reader.readLine()) != null) {
            sbf.append(strRead);
            sbf.append("\r\n");
        }
        reader.close();
        result = sbf.toString();

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(result);
        out.close();

        System.out.print(result);

        System.out.print("\n"+"-------------------------------------------");


        }



    @RequestMapping(value = "/update_News")
    public void update_News(HttpSession session,ServletResponse response,HttpServletRequest request) throws IOException {
        String page = request.getParameter("page");

        System.out.print("pppppppppp"+page);
        String httpArg1 = "channelId=5572a109b3cdc86cf39001e0&channelName=%E5%9B%BD%E5%86%85%E6%9C%80%E6%96%B0&title=%E4%B8%8A%E5%B8%82&page=" + page;



        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        String update_news_url;
        update_news_url = httpUrl + "?" + httpArg1;

        URL url = new URL(update_news_url);
        HttpURLConnection connection = (HttpURLConnection) url
                .openConnection();
        connection.setRequestMethod("GET");
        // 填入apikey到HTTP header
        connection.setRequestProperty("apikey", "b84775ee75417c608c4cfadaa4248b13");
        connection.connect();
        InputStream is = connection.getInputStream();
        reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
        String strRead = null;
        while ((strRead = reader.readLine()) != null) {
            sbf.append(strRead);
            sbf.append("\r\n");
        }
        reader.close();
        result = sbf.toString();

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(result);
        out.close();

        System.out.print(result);

        System.out.print("\n"+"-------------------------------------------");


    }


}
