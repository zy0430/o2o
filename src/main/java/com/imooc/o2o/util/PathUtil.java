package com.imooc.o2o.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class PathUtil {
    private static String seperator = System.getProperty("file.separator");
    private static final Random r = new Random();
    private static final SimpleDateFormat sDateFormat = new SimpleDateFormat(
            "yyyyMMddHHmmss"); // 时间格式化的格式

   public static String getImgBasePath() {
       String os = System.getProperty("os.name");
       String basePath = "";

       if (os.toLowerCase().startsWith("win")) {
           basePath = "F:/centos7/pic";
       } else {
           basePath = "/upload/item/shop/";
       }
       basePath = basePath.replace("/", seperator);
       return basePath;
   }

   public static String getShopImgPath(long shopId) {
       String imagePath = "/upload/item/shop/" + shopId + "/";
       String basePath = imagePath.replace("/", seperator);
       return basePath;
   }

   public static String getRandomFileName() {
// 生成随机文件名：当前年月日时分秒+五位随机数（为了在实际项目中防止文件同名而进行的处理）
       int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000; // 获取随机数
       String nowTimeStr = sDateFormat.format(new Date()); // 当前时间
       return nowTimeStr + rannum;
   }
}
