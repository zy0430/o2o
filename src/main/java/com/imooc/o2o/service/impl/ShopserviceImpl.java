package com.imooc.o2o.service.impl;

import com.imooc.o2o.dao.ShopDao;
import com.imooc.o2o.dto.ShopExecution;
import com.imooc.o2o.entity.Shop;
import com.imooc.o2o.enums.ShopStateEnum;
import com.imooc.o2o.exception.OperShopException;
import com.imooc.o2o.service.Shopservice;
import com.imooc.o2o.util.ImageUtil;
import com.imooc.o2o.util.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.util.Date;

@Service
public class ShopserviceImpl implements Shopservice {
    @Autowired
    ShopDao shopDao;

    @Override
    @Transactional
    public ShopExecution addShop(Shop shop, File shopImg) {
        if (shop == null) {
            return new ShopExecution(ShopStateEnum.NULL_SHOP_INFO);
        }
        Shop newShop = new Shop();
        newShop.setEnableStatus(0);
        newShop.setCreateTime(new Date());
        newShop.setLastEditTime(new Date());
        int insertNums = shopDao.insertShop(shop);

        if (insertNums <= 0) {
            throw new OperShopException("店铺创建失败");
        } else {
            if (shopImg != null) {
                try {
                    addShopImg(shop, shopImg);
                } catch (Exception e) {
                    throw new OperShopException("插入图片发生异常：" + e.getMessage());
                }
                int updateNums = shopDao.updateShop(shop);
                if (updateNums <= 0) {
                    throw new OperShopException("更新店铺发生异常" );
                }
            }
        }
        return new ShopExecution(ShopStateEnum.CHECK, shop);
    }

    public void addShopImg(Shop shop, File shopImg) {
        String dest = PathUtil.getShopImgPath(shop.getShopId());
        String addr = ImageUtil.generateThumbnail(shopImg, dest);
        shop.setShopImg(addr);
    }
}
