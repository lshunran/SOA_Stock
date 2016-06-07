package controller;

import dao.HoldDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.GroupService;
import service.UserService;

import javax.servlet.http.HttpSession;

/**
 * Created by fordevelopment on 15/6/24.
 */
@Controller
public class GroupController {
    @Autowired
    GroupService groupService;
    @Autowired
    HoldDao holdDao;
    @Autowired
    UserService userService;

    @RequestMapping(value = "/group",method = RequestMethod.POST)
    public void create_group(String groupName,HttpSession session)
    {
        groupService.create_group(groupName,(Integer)session.getAttribute("id"));
    }

    @RequestMapping(value = "/userpage",method = RequestMethod.GET)
    public String show_userpage(Model model,HttpSession session)
    {
        if(session.getAttribute("id")!=null) {

            model.addAttribute("focuses",userService.get_all_focus((Integer) session.getAttribute("id")));
            model.addAttribute("groups", groupService.get_group_list((Integer) session.getAttribute("id")));
            return "userpage";

        }
        else
            return "homepage";
    }

    @RequestMapping(value = "/addhold",method = RequestMethod.POST)
    public String add_hold(Integer group_id,String stockCode,Integer amount,double cost,HttpSession session)
    {
        if(session.getAttribute("id")!=null) {
            holdDao.add_hold(group_id,stockCode,amount,cost);
            return "userpage";
        }
        else
            return "homepage";
    }

}
