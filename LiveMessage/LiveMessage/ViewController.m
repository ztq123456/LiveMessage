//
//  ViewController.m
//  LiveMessage
//
//  Created by 雷欧 on 2020/3/25.
//  Copyright © 2020 雷欧. All rights reserved.
//

#import "ViewController.h"
#import "ZTQLiveMsgView.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZTQLiveMsgView *liveMsgView = [[ZTQLiveMsgView alloc] initWithFrame:CGRectMake(12, SCREEN_HEIGHT - MessageMaxHeight -39, MessageMaxWidth, MessageMaxHeight)];
    [self.view addSubview:liveMsgView];
    
    ZTQLiveMsgModel *msg = [[ZTQLiveMsgModel alloc]init];
        msg.msgType = RoomMessageTypeSystem;
       msg.fromUserName = @"伊志平";
       msg.msgText = @"小龙女老师，我来围观你的直播啦，为你点赞！";
        [liveMsgView reciveMessage:msg];

    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        ZTQLiveMsgModel *msg = [[ZTQLiveMsgModel alloc]init];
             msg.msgType = RoomMessageTypeText;
             msg.fromUserName = @"伊志平";
             msg.msgText = @"小龙女老师，你还记得后山发生的蒙眼奇缘吗！";
             [liveMsgView reciveMessage:msg];
    }];
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [time invalidate];
    });
    
    // Do any additional setup after loading the view.
}


@end
