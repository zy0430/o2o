package com.imooc.o2o.util;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.imageio.ImageIO;
import java.io.File;
import java.io.IOException;

public class ImageUtil {

    public static String generateThumbnail(File shopImgFile, String shopId) {

        String basePath = Thread.currentThread().getContextClassLoader().getResource("").getPath();

        // 新文件名
        String realFileName = PathUtil.getRandomFileName();

        // 文件后缀
        String extension = getFileExtension(shopImgFile);

        makeDirPath(shopId);

        // 新文件的地址
        String newImgAddr = shopId + "\\" + realFileName + extension;

        String dest = PathUtil.getImgBasePath() + "/shop/" + newImgAddr;
        String newFilePath = PathUtil.changePathFormat(dest);
        System.out.println(newFilePath);
        try {
            Thumbnails.of(shopImgFile.getPath()).size(200, 200)
            .watermark(Positions.BOTTOM_RIGHT, ImageIO.read(new File(basePath + "26.png")), 0.25f)
            .outputQuality(0.8f).toFile("F:/centos7/pic/shop/11/2019120823455055824.png");
            // "F:/centos7/pic/new11111.png"    F:/centos7/pic/shop/11/2019120823455055824.png
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newImgAddr;
    }

    private static String getFileExtension(File cFile) {
        String originalFileName = cFile.getName();
        return originalFileName.substring(originalFileName.lastIndexOf("."));
    }

    private static void makeDirPath(String shopId) {
        String newFileParentPath = PathUtil.getImgBasePath() + "shop/" +  shopId;
        File dirPath = new File(newFileParentPath);
        if (!dirPath.exists()) {
            dirPath.mkdirs();
        }
    }
}
