package controller;

import org.eclipse.persistence.annotations.RangePartition;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ashun on 16/6/10.
 */
@Controller
public class CompanyController {
    @RequestMapping(value = "/company")
    public String CompanyPage(){
        return "company";
    }
}
