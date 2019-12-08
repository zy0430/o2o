package com.imooc.o2o.service.impl;

import com.imooc.o2o.BaseTest;
import com.imooc.o2o.dto.ShopExecution;
import com.imooc.o2o.entity.Area;
import com.imooc.o2o.entity.PersonInfo;
import com.imooc.o2o.entity.Shop;
import com.imooc.o2o.entity.ShopCategory;
import com.imooc.o2o.enums.ShopStateEnum;
import com.imooc.o2o.service.Shopservice;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.util.Date;

import static org.junit.Assert.assertEquals;

public class ShopserviceImplTest extends BaseTest {

    @Autowired
    private Shopservice shopservice;

    @Test
    public void ShopserviceImplTest() {
        Shop shop1 = new Shop();
        ShopCategory shopCategory = new ShopCategory();
        Area area = new Area();
        PersonInfo personInfo = new PersonInfo();

        area.setAreaId(1L);
        shopCategory.setShopCategoryId(1L);
        personInfo.setUserId(1L);

        shop1.setArea(area);
        shop1.setShopCategory(shopCategory);
        shop1.setOwner(personInfo);

        shop1.setShopName("天天酸菜");
        shop1.setShopDesc("添加店铺测试");
        shop1.setShopAddr("添加店铺测试");
        shop1.setPhone("13111111111");
        shop1.setPriority(1);
        shop1.setCreateTime(new Date());
        shop1.setLastEditTime(new Date());
        shop1.setEnableStatus(0);
        shop1.setAdvice("审核中");

        File shopImg = new File("F:\\centos7\\pic\\yuantu.png");

        ShopExecution se = shopservice.addShop(shop1, shopImg);
        assertEquals(ShopStateEnum.CHECK.getState(), se.getState());
    }
}