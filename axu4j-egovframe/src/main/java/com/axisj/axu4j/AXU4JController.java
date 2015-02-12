package com.axisj.axu4j;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by HJ.Park on 2015-02-12.
 */
public class AXU4JController {

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
