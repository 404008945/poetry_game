package com.poetry.utils;

import com.poetry.global.ConstantValue;

public class PoetryUtils {
    public static String[] getPoetryArray(String poetry)
    {
        String[] split = poetry.split("\r\n");
        return split;
    }

    public static String[] getPoetryArray1(String poetry)
    {
        String[] split = poetry.split("\\|");
        return split;
    }

    //从随机色中随机取六种颜色
    public static String[] getColors()
    {
        String[] colors = ConstantValue.colors;
        //获取随机数数组
        int[] a = randomCommon(0, ConstantValue.colorsSize - 1, 6);
        String[] strs=new String[6];
        for(int i=0;i<a.length;i++)
        {
            strs[i]=colors[a[i]];
        }
        return strs;
    }

    //获取随机数
    public static int[] randomCommon(int min, int max, int n){
        if (n > (max - min + 1) || max < min) {
            return null;
        }
        int[] result = new int[n];
        int count = 0;
        while(count < n) {
            int num = (int) (Math.random() * (max - min)) + min;
            boolean flag = true;
            for (int j = 0; j < n; j++) {
                if(num == result[j]){
                    flag = false;
                    break;
                }
            }
            if(flag){
                result[count] = num;
                count++;
            }
        }
        return result;
    }

    public static String[] getPoetryArrayShiJing(String poetry)
    {
        String replace = poetry.replace("|", "");
        String[] split = replace.split("\\！|\\？|\\。");
        return split;
    }
}
