package com.imooc.o2o.service.impl;

import com.imooc.o2o.dao.AreaDao;
import com.imooc.o2o.entity.Area;
import com.imooc.o2o.service.AreaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {
    @Autowired
    private AreaDao areaDao;

    Logger logger = LoggerFactory.getLogger(AreaServiceImpl.class);

    @Override
    public  List<Area>  getAreas() {
        logger.debug("debug");
        List<Area> areas = areaDao.queryArea();
        return areas;
    }
}
