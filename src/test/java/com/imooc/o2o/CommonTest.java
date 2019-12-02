package com.imooc.o2o;

import org.junit.Test;

import java.util.Random;

public class CommonTest extends BaseTest{

    private static final Random r = new Random();

    @Test
    public void func() {
        int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000;
        System.out.println(r.nextDouble());
        System.out.println(rannum);
    }
}
