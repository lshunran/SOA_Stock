package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ashun on 16/6/9.
 */

@Controller
public class platformController {

    @RequestMapping(value = "/platform",method = RequestMethod.GET)
    public String showHomepage1()
    {

        return "platform";
    }
}
