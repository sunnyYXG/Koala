//
//  HelperTools.m
//  CNTaiPingEhome
//
//  Created by rongyun on 16/11/2.
//  Copyright © 2016年 cntaiping. All rights reserved.
//

#import "HelperTools.h"

#define kMaxTextFieldLength 20
#define kMaxTextViewLength 300

@implementation HelperTools


+ (void)userID:(NSString *)userID questID:(NSString *)questID timeDic:(NSDictionary *)timeDic quesArr:(NSArray *)quesArr page:(NSInteger)page{
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"questionnaire.plist"];
    NSMutableDictionary *BaseDic = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
    NSMutableDictionary *Mdic = [NSMutableDictionary dictionaryWithDictionary:BaseDic];
    
    NSMutableDictionary  *userMdic= [BaseDic objectForKey:userID];
    NSMutableDictionary  *quesMdic= [userMdic objectForKey:questID];
    
    [quesMdic setObject:timeDic forKey:@"times"];
    [quesMdic setObject:quesArr forKey:[NSString stringWithFormat:@"%ld",page]];
    
    [userMdic setObject:quesMdic forKey:questID];
    
    [Mdic setObject:userMdic forKey:userID];
    [Mdic writeToFile:filename atomically:YES];
//    NSLog(@"BaseDic:%@",BaseDic);
}

+ (void)userID:(NSString *)userID voteID:(NSString *)voteID voteArr:(NSArray *)voteArr page:(NSInteger)page{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"UserVote.plist"];
    NSMutableDictionary *BaseDic = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
    NSMutableDictionary *Mdic = [NSMutableDictionary dictionaryWithDictionary:BaseDic];
    
    NSMutableDictionary  *userMdic= [BaseDic objectForKey:userID];
    NSMutableDictionary  *voteMdic= [userMdic objectForKey:voteID];
    
    [voteMdic setObject:voteArr forKey:[NSString stringWithFormat:@"%ld",page]];
    [userMdic setObject:voteMdic forKey:voteID];
    
    [Mdic setObject:userMdic forKey:userID];
    [Mdic writeToFile:filename atomically:YES];
//    NSLog(@"PlistBaseDic:%@",BaseDic);

}

#pragma mark - 获取图片类型
+ (NSString *)typeForImageData:(NSData *)data {
    uint8_t c;
    
    [data getBytes:&c length:1];
    switch (c) {
            
        case 0xFF:
            
            return @"jpg";
            
        case 0x89:
            
            return @"png";
            
        case 0x47:
            
            return @"gif";//image/gif
            
        case 0x49:
            
        case 0x4D:
            
            return @"tiff";
    }
    return nil;
}

//判断纯数字
+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}
//判断是否为Float：
+ (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
#pragma mark - 设置图片的尺寸
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)scaleSize{
    //创建上下文，开始图片绘制
    UIGraphicsBeginImageContext(scaleSize);
    [image drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束图片的绘制
    UIGraphicsEndImageContext();
    return newImage;
}
+ (NSData *)scaleImage:(UIImage *)image{
    return  UIImageJPEGRepresentation(image, 0.9);
}


+ (BOOL)textFiledEditChanged:(NSNotification *)obj{
    BOOL yet = NO;
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
//    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    NSString *lang = [[[UIApplication sharedApplication]textInputMode] primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > kMaxTextFieldLength) {
                textField.text = [toBeString substringToIndex:kMaxTextFieldLength];
                 yet = YES;
            }
        }else{
            // 有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    }else{
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > kMaxTextFieldLength) {
            textField.text = [toBeString substringToIndex:kMaxTextFieldLength];
            yet = YES;
        }
    }
    return yet;
}

+ (BOOL)textViewEditChanged:(NSNotification *)obj withLength:(NSInteger)length{
    BOOL yet = NO;
    UITextView *textView = (UITextView *)obj.object;
    NSString *toBeString = textView.text;
    //    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    NSString *lang = [[[UIApplication sharedApplication]textInputMode] primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > length) {
                textView.text = [toBeString substringToIndex:length];
                yet = YES;
            }
        }else{
            // 有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    }else{
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > length) {
            textView.text = [toBeString substringToIndex:length];
            yet = YES;
        }
    }
    return yet;
    
}

#pragma mark -- Label 多行显示 自适应高度
+ (CGRect)height:(UILabel *)label frame:(CGRect)frame{
    label.lineBreakMode=NSLineBreakByWordWrapping;
    label.numberOfLines=0;
    CGRect txtFrame = label.frame;
    label.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,
                             txtFrame.size.height =[label.text boundingRectWithSize:
                                                    CGSizeMake(txtFrame.size.width, CGFLOAT_MAX)
                                                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                                         attributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,NSFontAttributeName, nil] context:nil].size.height);
    return CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, txtFrame.size.height);
}

//获取字符串的宽度
+ (float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(CGFLOAT_MAX, height) lineBreakMode:NSLineBreakByWordWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.width;
}
//获得字符串的高度
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.height;
}

+ (float) heightForString:(UITextView *)textView andWidth:(float)width{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

+(void)showView:(UIView *)view withControl:(UIControl *)control ToController:(UIViewController *)ctr{
    [ctr.view addSubview:control];
    [ctr.view addSubview:view];
    control.alpha = 0;
    view.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 1;
        control.alpha=0.5;
    }];

}
+(void)dismissView:(UIView *)view withControl:(UIControl *)control{
    [UIView animateWithDuration:0.3 animations:^{
        control.alpha = 0;
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        [control removeFromSuperview];
    }];

}
//日期比较大小
+ (int)compareOneDay:(NSDate *)nowDate withAnotherDay:(NSDate *)anotherDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *nowDateStr = [dateFormatter stringFromDate:nowDate];
    NSString *anotherDateStr = [dateFormatter stringFromDate:anotherDate];
    
    NSDate *dateA = [dateFormatter dateFromString:nowDateStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDateStr];
    NSComparisonResult result = [dateA compare:dateB];
    //    DDLog(@"date1 : %@, date2 : %@", nowDate, anotherDate);
    if (result == NSOrderedDescending) {
        //NSLog(@"anotherDate  is in the past");
        return -1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"anotherDate is in the future");
        return 1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
    
}

@end
