package controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by dzkan on 2016/3/8.
 */
@Controller
@RequestMapping(value = "test")
public class MainController {

    @RequestMapping(value = "/aa", method = RequestMethod.GET)
    public String index() {
        return "WEB-INF/pages/index";
    }
}