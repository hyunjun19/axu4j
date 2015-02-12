package com.axisj.axu4j;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.let.cop.bbs.service.EgovBBSManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by HJ.Park on 2015-02-12.
 */
@Controller
public class AXU4JController {

    @Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

    @Resource(name = "EgovBBSAttributeManageService")
    private EgovBBSAttributeManageService bbsAttrbService;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;

    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @RequestMapping("/main.do")
    public void main() { }

    @RequestMapping("/list.do")
    public void list() { }

    @RequestMapping("/list.json")
    public void listJson() { }

    @RequestMapping("/view.do")
    public void view() { }

    @RequestMapping("/edit.do")
    public void edit() { }

    @RequestMapping("/edit.json")
    public void editJson() { }

}
