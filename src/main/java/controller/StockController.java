package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.CommentService;
import service.UserService;
import service.Webapi;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by fordevelopment on 15/6/23.
 */
@Controller
public class StockController {
    @Autowired
    private Webapi webapi;
    @Autowired
    CommentService commentService;
    @Autowired
    UserService userService;
    @RequestMapping(value = "/stock",method = RequestMethod.GET)
    public String showStockpage(String stockCode,Model model,HttpSession session)
    {

        if(session.getAttribute("id")!=null) {
            model.addAttribute("isFocus",userService.is_focus((Integer)session.getAttribute("id"),stockCode));
            model.addAttribute("comments",commentService.get_all_comment(stockCode));
            model.addAttribute("stock", webapi.get_stock_information(stockCode));
            return "stockpage";
        }
        else {
            model.addAttribute("isFocus", false);
            model.addAttribute("comments", commentService.get_all_comment(stockCode));
            model.addAttribute("stock", webapi.get_stock_information(stockCode));
            return "stockpage";
        }
    }

    @RequestMapping(value = "/addfocus",method = RequestMethod.GET)
    public String showStockpage1(String stockId,HttpSession session,Model model)
    {

        if(session.getAttribute("id")!=null) {
            userService.add_focus((Integer) session.getAttribute("id"),stockId);

            model.addAttribute("isFocus",userService.is_focus((Integer)session.getAttribute("id"),stockId));
            model.addAttribute("comments",commentService.get_all_comment(stockId));
            model.addAttribute("stock", webapi.get_stock_information(stockId));
            return "stockpage";


        }
        else {
            model.addAttribute("isFocus",false);
            model.addAttribute("comments",commentService.get_all_comment(stockId));
            model.addAttribute("stock", webapi.get_stock_information(stockId));
            return "stockpage";
        }

    }


    @RequestMapping(value = "/removefocus",method = RequestMethod.GET)
    public String showStockpage2(String stockId,HttpSession session,Model model)
    {

        if(session.getAttribute("id")!=null) {
            userService.remove_focus((Integer) session.getAttribute("id"), stockId);

            model.addAttribute("isFocus",userService.is_focus((Integer)session.getAttribute("id"),stockId));
            model.addAttribute("comments",commentService.get_all_comment(stockId));
            model.addAttribute("stock", webapi.get_stock_information(stockId));
            return "stockpage";


        }
        else {
            model.addAttribute("isFocus",false);
            model.addAttribute("comments",commentService.get_all_comment(stockId));
            model.addAttribute("stock", webapi.get_stock_information(stockId));
            return "stockpage";
        }

    }



}
