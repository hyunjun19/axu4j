package axu4j.quick.start;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by HJ.Park on 2015-06-02.
 */
@RequestMapping("/data")
@RestController
public class AXU4JDataController {

    @RequestMapping("/list")
    public Map<String, Object> list() {

        Map<String, Object> data = new LinkedHashMap<>();
        Map<String, Object> page = new LinkedHashMap<>();
        List<Map<String, Object>> list = new ArrayList<>();

        data.put("page", page);
        data.put("list", list);

        page.put("pageCount", 1);
        page.put("listCount", 4);
        page.put("pageNo", 1);

        Map<String, Object> view;
        for (int i = 1; i < 6; i++) {
            view = new LinkedHashMap<>();
            view.put("nttId", i);
            view.put("nttSj", "악수4제이 목록 " + i);
            view.put("frstRegisterNm", "HJ.Park");
            view.put("frstRegisterPnttm", "2015-03-07 23:55:51");
            view.put("nttCn", "");

            list.add(view);
        }

        return data;
    }

}
