<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/4/004
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Website Template by freehtml5.co"/>
    <meta name="keywords"
          content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive"/>
    <meta name="author" content="freehtml5.co"/>
    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>
</head>
<body style="background-color: #eaf5ff">

<div class="fh5co-loader"></div>

<div id="page">
    <jsp:include page="nav.jsp"/>
    <header id="fh5co-header" class="fh5co-cover js-fullheight" role="banner">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 text-center" style="height: 600px">
                    <div class="display-t js-fullheight" style="padding-top: 160px;">
                        <h2 style="font-size: 35px;font-weight: lighter">${poetryInfo.one}</h2>
                        <h2 style="font-size: 35px;font-weight: lighter">${poetryInfo.two}</h2>
                        <p style="padding-top: 60px"><a class="btn btn-primary btn-lg btn-demo" href="/enjoy/detail_poetry/${poetryInfo.id}"></i>
                            我想了解这首诗</a></p>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div id="fh5co-features" style="background-color: #d6ecf0">
        <div class="container">
            <div class="services-padding">
                <div class="row">
                    <div class="col-md-4 animate-box">
                        <div class="feature-left">
							<span class="icon">
								<i class="icon-hotairballoon"></i>
							</span>
                            <div class="feature-copy">
                                <h3>唐</h3>
                                <p>
                                    唐诗，泛指创作于唐朝诗人的诗。唐诗是中华民族珍贵的文化遗产之一，是中华文化宝库中的一颗明珠，同时也对世界上许多民族和国家的文化发展产生了很大影响，对于后人研究唐代的政治、民情、风俗、文化等都有重要的参考意义和价值。</p>
                                <p><a style="font-size: 20px" href="/enjoy/tangshi_list/1">我要看看<i
                                        class="icon-arrow-right22"></i></a></p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 animate-box">
                        <div class="feature-left">
							<span class="icon">
								<i class="icon-search"></i>
							</span>
                            <div class="feature-copy">
                                <h3>宋</h3>
                                <p>
                                    宋诗是在唐诗的基础上发展起来的﹐但又自具特色。文学史上提到宋诗﹐有时是作为宋代诗歌的简称﹐有时则指某种与唐诗相对的诗歌风格。宋代诗歌依时间先后可以分为六个不同的发展时期，每个时期都有各自的风格和表达方式。</p>
                                <p><a style="font-size: 20px" href="/enjoy/songshi_list/1">我要看看<i
                                        class="icon-arrow-right22"></i></a></p>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 animate-box">
                        <div class="feature-left">
							<span class="icon">
								<i class="icon-wallet"></i>
							</span>
                            <div class="feature-copy">
                                <h3>元</h3>
                                <p>
                                    元代诗主要是指元代诗人的文学作品，有那个时代粗狂，豪放的特点。元朝初年，北方和南方的诗各自保持统一前的原有特色。北方的，清淡古朴,豪放自然。南方的，崇尚唐调，清丽婉约。</p>
                                <p><a style="font-size: 20px" href="/enjoy/yuan_list/1">我要看看<i
                                        class="icon-arrow-right22"></i></a></p>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-4 animate-box">

                        <div class="feature-left">
							<span class="icon">
								<i class="icon-wine"></i>
							</span>
                            <div class="feature-copy">
                                <h3>明</h3>
                                <p>明代诗文数量却浩如烟海，在将近300年的明代历史上，诗歌总的来说是相当繁荣的，无论诗人或诗作的数量，都超过前代。但是明代诗歌发展的道路是很曲折的，呈现复杂的状况。</p>
                                <p><a style="font-size: 20px" href="/enjoy/ming_list/1">我要看看<i
                                        class="icon-arrow-right22"></i></a></p>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-4 animate-box">
                        <div class="feature-left">
							<span class="icon">
								<i class="icon-genius"></i>
							</span>
                            <div class="feature-copy">
                                <h3>清</h3>
                                <p>清代诗是指清代诗人创作的诗歌。清代诗人善于借鉴前代，扬长补短，对于古典诗歌有所发展。风格多样，其成就是超过元明两代，足以下启近代而成为中国古典诗歌的后劲的。</p>
                                <p><a style="font-size: 20px" href="/enjoy/qing_list/1">我要看看<i
                                        class="icon-arrow-right22"></i></a></p>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 animate-box">
                        <div class="feature-left">
							<span class="icon">
								<i class="icon-star"></i>
							</span>
                            <div class="feature-copy">
                                <h3>随便来一首</h3>
                                <p>将从数据库随机抽取一首诗词,我相信一见钟情,你呢?</p>
                                <p style="padding-top: 75px"><a style="font-size: 20px" href="/enjoy/random_poetry">来一首<i
                                        class="icon-arrow-right22"></i></a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="fh5co-blog">
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <h2>大数据眼里的诗词</h2>
                    <p>依据30w+诗词做的一些简单的高频分析</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="fh5co-blog animate-box">
                        <a href="#" class="blog-bg" style="background-image: url(/images/blog-1.jpg);"></a>
                        <div class="blog-text" style="background-color: #f9f8eb">
                            <p style="text-align:center;">宋词高频词</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-blog animate-box">
                        <a href="#" class="blog-bg" style="background-image: url(/images/blog-2.jpg);"></a>
                        <div class="blog-text" style="background-color: #f9f8eb">
                            <p style="text-align:center;">唐诗高频词</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-blog animate-box">
                        <a href="#" class="blog-bg" style="background-image: url(/images/blog-3.jpg);"></a>
                        <div class="blog-text" style="background-color: #f9f8eb">
                            <p style="text-align: center;">两宋喜欢的词牌名</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="fh5co-started">
        <div class="overlay" style="background-color: #e4c6d0"></div>
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <h2 style="color:#fff;padding-bottom: 20px">发扬光大中国的文化瑰宝——古诗词</h2>
                    <p style="text-align: left">&nbsp;&nbsp;&nbsp;简说意义，"读史书使人明智，读诗书使人灵秀。"学习古诗词不仅能使人灵秀，更重要的是使人脱离庸俗和低级趣味，更加文明和高雅。学习古诗词能造就和改变一个人的性格，能陶冶一个人的情操，能使人的志向、情操得到陶冶和升华。一首好诗就是一位良师益友。学习古诗词犹如在花的世界中徜徉，染其色、闻其香、尝其味，不断地提高自己的文化修养、净化自己的灵魂、开阔自己的视野，求得身体和精神上的健康。其实诗的好处，是终生受用的。中国这么千百年来，能够流传到现在的诗词，像李白、杜甫的，一定是在万千人中最好的。那些不够好的早就淘汰了。所以读的古诗词，是经过了千百年的筛选、淘汰……</p>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
</div>

</body>
</html>


