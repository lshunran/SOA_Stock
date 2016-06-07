package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.CommentService;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by fordevelopment on 15/6/24.
 */
@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/addcomment",method = RequestMethod.GET)
    public void add_comment(String stockCode,String comment,HttpServletResponse response,HttpSession session)
    {
        System.out.print(stockCode);

        if(session.getAttribute("id")!=null) {

            commentService.add_comment(stockCode,comment,(Integer)session.getAttribute("id"));
            try {
                response.sendRedirect("/stock?stockCode="+stockCode);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        else
        {
            try {
                response.sendRedirect("/stock?stockCode="+stockCode);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }










    }
    @RequestMapping(value = "/comment",method = RequestMethod.GET)
    public void get_all_comment(String stockCode,ServletResponse response)
    {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json;charset=UTF-8");

        String json = commentService.get_all_comment_json(stockCode);
        try {
            PrintWriter out = response.getWriter();
            out.print(json);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
