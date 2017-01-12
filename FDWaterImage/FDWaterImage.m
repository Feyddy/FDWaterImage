//
//  FDWaterImage.m
//  FDWaterImage
//
//  Created by 徐忠林 on 12/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "FDWaterImage.h"

@implementation FDWaterImage

+(UIImage *) image:(NSString *)bg water:(NSString *)logo text:(NSString *)txt{
    
    UIImage *image=[UIImage imageNamed:bg];
    //创建基于位图的图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    //图片水印
    //画背景,给图片创建一个可以显示的地方，添加到上下文中。
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //设置水印的大小方位，以及将水印上下文保存
    UIImage *water =[UIImage imageNamed:logo];
    CGFloat scale =0.4;
    CGFloat margin =5;
    CGFloat waterW=water.size.width * scale;
    CGFloat waterh=water.size.height *scale;
    CGFloat waterX= image.size.width*0.1 ;
    CGFloat waterY= image.size.width*0.425 +margin;
    [water  drawInRect:CGRectMake(waterX, waterY, waterW, waterh)];
    
    
    
    //绘制水印属性
    UIFont *font = [UIFont systemFontOfSize:18];
    
    UIColor *color = [UIColor orangeColor];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.alignment = NSTextAlignmentLeft;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : font,
                                 NSForegroundColorAttributeName : color,
                                 NSParagraphStyleAttributeName : style
                                 };
    
    [txt drawInRect:CGRectMake(50, image.size.height-30, 200, 30) withAttributes:attributes];
    
    
    //从图形上下文中获取制作完毕的图像
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束上下文，相当于内存释放
    UIGraphicsEndImageContext();
    
    
    
    // 7.将image对象压缩为PNG格式的二进制数据
    NSData *data = UIImagePNGRepresentation(newImage);
    
    // 8.写入文件,h获取沙盒路径方法。
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
    [data writeToFile:path atomically:YES];
    NSLog(@"asasd =%@",path);
    
    return newImage;
}

@end
