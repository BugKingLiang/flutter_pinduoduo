## 仿照拼多多客户端写的一个Flutter版本.(练手项目、练手项目、练手项目)
鄙人Android工程师一枚.初学Flutter时间不长.

## 按照国际惯例,先上图.
|    首页         | 推荐           |      分类       |聊天|个人中心|
|------------- |------------- |-------------|-------------|-------------|
|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/2.png)|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/3.png)|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/4.png)|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/5.png)|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/6.png)|

|    搜索         | 搜索结果           |    搜索筛选 | 百亿补贴|商品详情|
|------------- |------------- |------------- |------------- |------------- |
|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/7.png)|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/8.png)|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/9.png)|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/10.png)|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/9.png)|![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/11.png)|

## 已完成和后续

* 首页、推荐、分类、聊天、个人中心(已完成)
* 搜索 (已完成)
* 百亿补贴(已完成)
* 商品详情 (后续)
* 等等等等等等等等等等等等等等等
* 更不更新看心情和时间

## 数据从哪里获取的?

#### 项目中的数据分为两种.
1. 使用拼多多的网页版 http://yangkeduo.com/ ,通过浏览器的调试获取的.例如`首页->热门`的商品列表中的数据接口.

![](https://github.com/BugKingLiang/flutter_pinduoduo/blob/master/screenshot/1.png)
#### `如果运行项目有部分接口失效问题,就按照上面的方式自行查找对应的接口替换即可.`

2. 模拟数据.
  通过上面方式不是全部接口都能获取到的,也只是部分接口.所以在有的页面使用 `模拟数据+接口方式`获取的.
 
## 主要开源库
* [dio](https://github.com/flutterchina/dio): 网络库
* [flutter_swiper](https://github.com/best-flutter/flutter_swiper):轮播图
* [cached_network_image](https://github.com/renefloor/flutter_cached_network_image)图片缓存
* [badges](https://github.com/yako-dev/flutter_badges):小红点
* [provider](https://github.com/rrousselGit/provider):状态管理
* [pull_to_refresh](https://github.com/peng8350/flutter_pulltorefresh):下拉刷新
* [toast](https://github.com/appdev/FlutterToast):土司
* [flutter_screenutil](https://github.com/OpenFlutter/flutter_screenutil):屏幕适配
