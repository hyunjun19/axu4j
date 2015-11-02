package axu4j.quick.start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by HJ.Park on 2015-06-01.
 */
@RequestMapping("/view")
@Controller
public class AXU4JViewController {

    @RequestMapping("/main")
    public void main() {
    }

    @RequestMapping("/list")
    public void list() {
    }

    @RequestMapping("/list-2")
    public void list2() {
    }

    @RequestMapping(value = "/help")
    public void help() {
    }

    @RequestMapping(value = "/modal")
    public void modal() {
    }

    @RequestMapping(value = {"/form", "/form-non-axu4j"})
    public void form() {
    }

    @RequestMapping(value = "/split")
    public void split() {
    }

    @RequestMapping(value = "/table")
    public void table() {
    }

    @RequestMapping("/view")
    public void view() {
    }

    @RequestMapping(value = {"/edit", "/edit-non-axu4j"})
    public void edit() {
    }

}
