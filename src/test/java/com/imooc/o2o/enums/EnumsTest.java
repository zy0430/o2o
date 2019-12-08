package com.imooc.o2o.enums;

import com.imooc.o2o.BaseTest;
import org.junit.Test;

public class EnumsTest extends BaseTest {

    @Test
    public void enumsTest() {
        System.out.println(ShopStateEnum.statrof(-1001).getStateInfo());

    }
}
