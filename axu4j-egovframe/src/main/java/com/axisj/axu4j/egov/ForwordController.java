package com.axisj.axu4j.egov;

import egovframework.let.main.web.EgovMainController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by HJ.Park on 2015-02-07.
 */
@RequestMapping("/ax")
@Controller
public class ForwordController {

    @Autowired
    private EgovMainController egovMainController;

    @RequestMapping(value = "/cmm/main/mainPage.do")
    public String getMgtMainPage(HttpServletRequest request, ModelMap model)
            throws Exception{

        egovMainController.getMgtMainPage(request, model);

        return "ax/main/EgovMainView";
    }
}
