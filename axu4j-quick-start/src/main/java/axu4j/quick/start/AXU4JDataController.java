package axu4j.quick.start;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * Created by HJ.Park on 2015-06-02.
 */
@RequestMapping("/data")
@RestController
public class AXU4JDataController {

    @RequestMapping("/list")
    public Map<String, Object> list() {

        return null;
    }

}
