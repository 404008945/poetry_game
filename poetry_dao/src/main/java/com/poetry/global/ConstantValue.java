package com.poetry.global;

import java.util.Arrays;
import java.util.List;

public class ConstantValue {
    public static final String TANGSHI_VALUE="唐诗，泛指创作于唐朝诗人的诗。唐诗是中华民族珍贵的文化遗产之一，是中华文化宝库中的一颗明珠，同时也对世界上许多民族和国家的文化发展产生了很大影响，对于后人研究唐代的政治、民情、风俗、文化等都有重要的参考意义和价值。";
    public static final String SONGSHI_VALUE="宋诗是在唐诗的基础上发展起来的﹐但又自具特色。文学史上提到宋诗﹐有时是作为宋代诗歌的简称﹐有时则指某种与唐诗相对的诗歌风格。宋代诗歌依时间先后可以分为六个不同的发展时期，每个时期都有各自的风格和表达方式。对后代研究宋代具有重要意义";
    public static final String SONGCI_VALUE="宋代盛行的一种中国文学体裁，宋词是一种相对于古体诗的新体诗歌之一，标志宋代文学的最高成就。宋词句子有长有短，便于歌唱。因是合乐的歌词，故又称曲子词、乐府、乐章、长短句、诗余、琴趣等。";
    public static final String SHIJNG_VALUE="《诗经》内容丰富，反映了劳动与爱情、战争与徭役、压迫与反抗、风俗与婚姻、祭祖与宴会，甚至天象、地貌、动物、植物等方方面面，是周代社会生活的一面镜子。";
    public static final String LUNYU_VALUE="《论语》是孔子及其弟子的语录结集，由孔子弟子及再传弟子编写而成，至战国前期成书。《论语》较为集中地体现了孔子的政治主张、伦理思想、道德观念及教育原则等。";
    public static final String YUAN_VALUE="元代诗主要是指元代诗人的文学作品，有那个时代粗狂，豪放的特点。元朝初年，北方和南方的诗各自保持统一前的原有特色。北方的，清淡古朴,豪放自然。南方的，崇尚唐调，清丽婉约。";
    public static final String MING_VALUE="明代诗文数量却浩如烟海，在将近300年的明代历史上，诗歌总的来说是相当繁荣的，无论诗人或诗作的数量，都超过前代。但是明代诗歌发展的道路是很曲折的，呈现复杂的状况。\n";
    public static final String QING_VALUE="清代诗是指清代诗人创作的诗歌。清代诗人善于借鉴前代，扬长补短，对于古典诗歌有所发展。风格多样，其成就是超过元明两代，足以下启近代而成为中国古典诗歌的后劲的。";
    //随机色
    private static final String colorsStr2="#FFFFCC,#CCFFFF,#FFCCCC,#99CCCC,#FFCC99,#FF9999,#996699," +
            "#CCCC99," +
            "#FFFF99,#CCCCFF,#0099CC,#CCCCCC,#FF6666,#FF9966," +
            "#FF6666,#FFFF99,#99CC99," +
            "#CCFF99,#99CCFF,#FF9966," +
            "#99CC99,#FF9900,#336699,#CCCC33," +
            "#FFFF99,#CC9933,#996600,#FFCC33," +
            "#CC9933,#336666,#99CC00,#FF99CC,#993366," +
            "#CC99CC,#FFFF99,#CCCCFF,#FFFF99," +
            "#993399,#FF99CC,#66CCCC,#CCFF66,#FF99CC,#FF99CC," +
            "#003399,#CCCC00,#FF99CC," +
            "#FF99CC,#669966,#CC6699,#FFCCFF,#CCCCCC," +
            "#CC99CC,#CC3399,#CC3399,#FF6666," +
            "#CCCC99," +
            "#CCCCCC,#CC99CC,#FFCC00," +
            "#CCCCCC,#006699,#999900,#009966,#66CC99,#CC6699,#CC9999,#bce672,#c9dd22,#f0f0f4,#ffa400,#a3d900,#f36838," +
            "#afdd22,#ffb3a7,#f2ecde,#ffb61e,#96ce54,#a1afc9,#db5a6b," +
            "#4a4266,#426666,#c0ebd7,#bbcdc5,#d3b17d,#00e09e,#3de1ad," +
            "#725e82,#2edfa3,#cb3a56,#4c8dae,#b0a4e3,#cca4e3,#a4e2c6,#75664d,#edd1d8,#e4c6d0," +
            "#9c5333,#549688,#896c39,#789262,#758a99,#9d2933,#be002f";

    private static String colorsStr="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53";

    public static final String[] colors=colorsStr.split(",");
    public static final String[] colors2 = colorsStr2.split(",");

    public static final int colorsSize=colors.length;

    //获取所有的诗词分类
    public static List<String> getAllCategory()
    {
        return Arrays.asList(new String[]{"写景","抒情","励志","哲理","咏物","友情"});
    }
}
