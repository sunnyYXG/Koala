//
//  HelperTools.h
//  CNTaiPingEhome
//
//  Created by rongyun on 16/11/2.
//  Copyright © 2016年 cntaiping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperTools : NSObject

+ (int)compareDate:(NSString*)date01 withDate:(NSString*)date02;

//存放问卷
+ (void)userID:(NSString *)userID questID:(NSString *)questID timeDic:(NSDictionary *)timeDic quesArr:(NSArray *)quesArr page:(NSInteger)page;
//存放投票
+ (void)userID:(NSString *)userID voteID:(NSString *)voteID voteArr:(NSArray *)voteArr page:(NSInteger)page;

+ (NSString *)typeForImageData:(NSData *)data;

+ (BOOL)isPureInt:(NSString*)string;
+ (BOOL)isPureFloat:(NSString*)string;

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)scaleSize;
+ (NSData *)scaleImage:(UIImage *)image;
+ (float) heightForString:(UITextView *)textView andWidth:(float)width;//根据输入的字符 动态改变textView的高度
+ (BOOL)textFiledEditChanged:(NSNotification *)obj;
+ (BOOL)textViewEditChanged:(NSNotification *)obj withLength:(NSInteger)length;
+ (CGRect)height:(UILabel *)label frame:(CGRect)frame;
+ (float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height;
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;

+ (void)showView:(UIView *)view withControl:(UIControl *)control ToController:(UIViewController *)ctr;
+ (void)dismissView:(UIView *)view withControl:(UIControl *)control;
+ (int)compareOneDay:(NSDate *)nowDate withAnotherDay:(NSDate *)anotherDate;
@end
