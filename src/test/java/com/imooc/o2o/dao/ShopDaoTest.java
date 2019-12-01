package com.imooc.o2o.dao;

import com.imooc.o2o.BaseTest;
import com.imooc.o2o.entity.Area;
import com.imooc.o2o.entity.PersonInfo;
import com.imooc.o2o.entity.Shop;
import com.imooc.o2o.entity.ShopCategory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

public class ShopDaoTest extends BaseTest {
    @Autowired
    ShopDao shopDao;

    public void insertShop() {
        Shop shop = new Shop();
        ShopCategory shopCategory = new ShopCategory();
        Area area = new Area();
        PersonInfo personInfo = new PersonInfo();

        area.setAreaId(1L);
        shopCategory.setShopCategoryId(1L);
        personInfo.setUserId(1L);

        shop.setArea(area);
        shop.setShopCategory(shopCategory);
        shop.setOwner(personInfo);

        shop.setShopName("测试店铺");
        shop.setShopDesc("这是一个测试的店铺");
        shop.setShopAddr("北京");
        shop.setPhone("13111111111");
        shop.setShopImg("/imgs");
        shop.setPriority(1);
        shop.setCreateTime(new Date());
        shop.setLastEditTime(new Date());
        shop.setEnableStatus(1);
        shop.setAdvice("审核中");
        shopDao.insertShop(shop);
    }

    @Test
    public void updateShop() {
        Shop shop1 = new Shop();
        ShopCategory shopCategory = new ShopCategory();
        Area area = new Area();
        PersonInfo personInfo = new PersonInfo();

        shop1.setShopId(10L);
        area.setAreaId(1L);
        shopCategory.setShopCategoryId(1L);
        personInfo.setUserId(1L);

        shop1.setArea(area);
        shop1.setShopCategory(shopCategory);
        shop1.setOwner(personInfo);

        shop1.setShopName("测试店铺更新");
        shop1.setShopDesc("这是一个测试的店铺");
        shop1.setShopAddr("北京");
        shop1.setPhone("13111111111");
        shop1.setShopImg("/imgs");
        shop1.setPriority(1);
        shop1.setCreateTime(new Date());
        shop1.setLastEditTime(new Date());
        shop1.setEnableStatus(1);
        shop1.setAdvice("审核中");
        shopDao.updateShop(shop1);
    }
}
