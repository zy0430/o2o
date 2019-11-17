package com.imooc.o2o.web.superadmin;

import java.util.Map;
import java.util.List;
import java.util.HashMap;
import java.util.ArrayList;

import com.imooc.o2o.entity.Area;
import com.imooc.o2o.service.AreaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/superAdmin")
public class SuperAdminController {
    Map<String, Object> mapMode = new HashMap();
    List<Area> result = new ArrayList();

    @Autowired
    private AreaService areaService;

    @RequestMapping(value = "/area", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAreas() {
        try {
            result = areaService.getAreas();
            mapMode.put("rows", result.toString());
            mapMode.put("total", result.size());
        } catch (Exception e) {
            mapMode.put("rows", e.toString());
            mapMode.put("total", 0);
        }
        return mapMode;
    }
}
