//
//  main.m
//  sanguo
//
//  Created by 王瑞 on 2020/10/3.
//

#import <Foundation/Foundation.h>
#import "Hero.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\n欢迎进入三国杀，请选择你的英雄：\n1-张飞 2-吕布 3-诸葛亮 4-曹操 5-孙权\n6-赵云 7-司马懿 8-孙策 9-陈宫 10-张辽\n");
        int a,b;
        Hero * A;
        Hero * B;
        while(scanf("%d %d",&a,&b)){
            if(a == b){
                NSLog(@"不可选取相同英雄！");
                continue;
            }
            break;
        }
        switch (a) {
            case 1:
                A = [[ZhangFei alloc]  init];
                break;
            case 2:
                A = [[LvBu alloc]  init];
                break;
            case 3:
                A = [[ZhuGeliang alloc]  init];
                break;
            case 4:
                A = [[CaoCao alloc]  init];
                break;
            case 5:
                A = [[SunQuan alloc]  init];
                break;
            case 6:
                A = [[ZhaoYun alloc]  init];
                break;
            case 7:
                A = [[SiMayi alloc]  init];
                break;
            case 8:
                A = [[SunCe alloc]  init];
                break;
            case 9:
                A = [[ChenGong alloc]  init];
                break;
            case 10:
                A = [[ZhangLiao alloc]  init];
                break;
            default:
                break;
        }
        switch (b) {
            case 1:
                B = [[ZhangFei alloc]  init];
                break;
            case 2:
                B = [[LvBu alloc]  init];
                break;
            case 3:
                B = [[ZhuGeliang alloc]  init];
                break;
            case 4:
                B = [[CaoCao alloc]  init];
                break;
            case 5:
                B = [[SunQuan alloc]  init];
                break;
            case 6:
                B = [[ZhaoYun alloc]  init];
                break;
            case 7:
                B = [[SiMayi alloc]  init];
                break;
            case 8:
                B = [[SunCe alloc]  init];
                break;
            case 9:
                B = [[ChenGong alloc]  init];
                break;
            case 10:
                B = [[ZhangLiao alloc]  init];
                break;
            default:
                break;
        }
        
        int nturn = 0;
        int A_danger = 0;
        int B_danger = 0;
        while(1){
            ++nturn;
            [A PKOneUnit:B];
            NSLog(@"\n%@_blood:%ld\n%@_blood:%ld",[A getname],[A getblood_value],[B getname],[B getblood_value]);
            if([B getblood_value] <= 0) {
                NSLog(@"%@再起不能，%@大获全胜!!",[B getname],[A getname]);
                break;
            }
            [B PKOneUnit:A];
            NSLog(@"\n%@_blood:%ld\n%@_blood:%ld",[A getname],[A getblood_value],[B getname],[B getblood_value]);
            if([A getblood_value] <= 0){
                NSLog(@"%@再起不能，%@大获全胜!!",[A getname],[B getname]);
                break;
            }
            if([A getblood_value] <= 500 && A_danger == 0){
                A_danger = 1;
                NSLog(@"%@已经身负重伤！",[A getname]);
            }
            if([B getblood_value] <= 500 && B_danger == 0) {
                B_danger = 1;
                NSLog(@"%@已经身负重伤！",[B getname]);
            }
            if(nturn >= 10){
                NSLog(@"%@与%@战绩激烈，胜负未明",[A getname],[B getname]);
                break;
            }
        }
        
    }
    return 0;
}
