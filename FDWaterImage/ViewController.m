//
//  ViewController.m
//  FDWaterImage
//
//  Created by 徐忠林 on 12/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "ViewController.h"
#import "FDWaterImage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.返回水印图片
    UIImage *image =[FDWaterImage image:@"scene.jpg" water:@"Icons" text:@"Feyddy"];

    
    
    // 2.显示图片
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 80, 200, 200)];
    iconView.backgroundColor = [UIColor redColor];
    [self.view addSubview:iconView];
    iconView.image = image;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
