package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ashun on 16/6/11.
 */
@Controller
public class msgController {

    @RequestMapping(value = "/msg")
    public String msgPage(){
        return "msg";
    }
}
