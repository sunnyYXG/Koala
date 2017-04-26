//
//  BaseUrl.h
//  Kaola
//
//  Created by sunny_FX on 2017/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#ifndef BaseUrl_h
#define BaseUrl_h
//
//_httimestamp=1492084765
//#define login_url   @"http://webcache-sp.kaola.com/api/version_check/webapp"
//#define login_url   @"http://log-collector.kaola.com/api/alarmCommon?_httimestamp=1492084765"

//#define main_url    @"http://sp.kaola.com/api/application?"
//#define openad_url  @"http://sp.kaola.com/api/openad?"
//#define path_url    @"http://sp.kaola.com/api/patch?"


//#define login_url @"http://webcache-sp.kaola.com/api/version_check/webapp"

#define login_url @"http://log-collector.kaola.com/api/alarmCommon?"
#define main_url @"http://sp.kaola.com/api/application?"
#define openad_url @"http://sp.kaola.com/api/openad?"
#define path_url @"http://sp.kaola.com/api/patch?"

/**
 *  首页接口
 */
//首页主数据
#define home_url    @"http://sp.kaola.com/api/home?"
//首页 今日精选
#define home_auslese_url    @"http://sp.kaola.com/api/home?"

//首页 个性推荐
#define home_recommend_url  @"http://sp.kaola.com/api/home?"


//每日签到
#define point_url   @"http://m.kaola.com/m/point/my_point.html"
//限时购
#define onsale_url  @"http://m.kaola.com/activity/onsale.html"
//会员专属
#define index_url   @"http://m.kaola.com/member/activity/index.html"
//拼团
#define list_url    @"http://m.kaola.com/groupBuyMall/goods/list.html"
//立省
#define introduce_url   @"http://m.kaola.com/one_invite_one/introduce.html"

/**
 *  分类接口
 */
//左边treeMenu
#define classfy_url @"http://sp.kaola.com/api/category?V330"
//右边CollectionView
#define category_url @"http://sp.kaola.com/api/category/frontCategory?V330"
#define recForYou_url @"http://sp.kaola.com/api/category/recForYou?V330"


#endif /* BaseUrl_h */
