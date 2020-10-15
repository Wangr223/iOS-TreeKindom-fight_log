//
//  Hero.m
//  sanguo
//
//  Created by 王瑞 on 2020/10/3.
//

#import <Foundation/Foundation.h>
#import "Hero.h"

@implementation Hero
//int armed = 0;
-(NSInteger)getblood_value{
    return blood_value;
}

-(NSString*)getCountry{
    return country;
}

-(NSInteger)getenergy_value{
    return energy_value;
}

-(NSInteger)getflex{
    return flex;
}

-(NSInteger)getattack{
    return attack;
}

-(NSString*)getname{
    return name;
}

-(instancetype)init{
    return  self;
}

-(void)managrow{
    energy_value += 10;
}

-(void)Weapon{
    
}

-(void)PKOneUnit:(Hero *)target{
    
    if(flex == 1)flex = 0;
    if(poison > 0){
        --poison;
        blood_value -= 300;
        NSLog(@"%@因为中毒，损失300点生命值",name);
    }
    
    //mana on
    [self managrow];
    
    //skill
    int value = (arc4random()%100)+1;
    NSInteger miss = [target getflex];
    //if(miss == 0){
        if(value > 80) [self ultimate:target];
        if(value < 60 && value > 40) [self skill];
        if(value <= 50 && armed == 0){
            //newarm = 1;
            armed = 1;
            [self Weapon];
        }
    
    if(grand >= 1){
        --grand;
        attack += 120;
        blood_value += 100;
    }//State "Grand"
    
    if(sheld == 1)
        [target ChangeOnBlood_Value:0 Energy_Vlaue:-30 attack:-(0.1*[target getattack])]; //State "Sheld"
    
        //attack
    if(miss == 0){
        [target ChangeOnBlood_Value:-attack Energy_Vlaue:0 attack:0];
        NSString * selfname = [self getname];
        NSLog(@"%@攻击了%@，造成%ld点伤害",selfname,[target getname],attack);
    }
    else{
        NSLog(@"%@躲避了%@的攻击",[target getname],name);
    }
    return;
}

-(void)poisoned:(NSInteger)turn{
    poison = turn;
}

-(void)ChangeOnBlood_Value:(NSInteger)Hp Energy_Vlaue:(NSInteger)Np attack:(NSInteger)Ad{
    blood_value += Hp;
    energy_value += Np;
    attack += Ad;
}

-(void)skill{
    
}

-(void)ultimate:(Hero *)target{
    
}

@end


@implementation ZhangFei //1

-(instancetype)init{
    self = [super init];
    if(self){
        country = @"Shu";
        blood_value = 2200;
        energy_value = 100;
        attack = 120;
        armed = 0;
        flex = 0;
        sheld = 0;
        poison = 0;
        grand = 0;
        name = @"张飞";
        NSLog(@"%@自%@疾驰而来！",name,country);
    }
    return self;
}

-(void)skill{
    if(energy_value < 20)return;
    energy_value -= 20;
    blood_value += 200;
    NSLog(@"张飞大快朵颐，恢复了200生命值");
}

-(void)ultimate:(Hero *)target{
    if(energy_value < 80)return;
    energy_value -= 80;
    attack += 200;
    blood_value -= 200;
    NSLog(@"张飞怒火中烧，攻击力上升200，生命值减少200");
}

@end

@implementation LvBu //2

-(instancetype)init{
    self = [super init];
    if(self){
        country = @"free";
        blood_value = 1800;
        energy_value = 100;
        attack = 100;
        armed = 0;
        sheld = 0;
        flex = 0;
        poison = 0;
        grand = 0;
        name = @"吕布";
        NSLog(@"%@自%@疾驰而来！",name,country);
    }
    return self;
}

-(void)Weapon{
    armed = 1;
    attack += 200;
    NSLog(@"吕布手持方天画戟，攻击力上升200");
}

-(void)ultimate:(Hero *)target{
    if(energy_value < 80)return;
    energy_value -= 80;
    NSInteger miss = [target getflex];
    if(miss ==0){
        [target ChangeOnBlood_Value:-500 Energy_Vlaue:0 attack:0];
        NSLog(@"吕布召唤天雷，对敌人造成500伤害");
    }
    else
        NSLog(@"天雷未命中目标");
}

@end

@implementation ZhuGeliang//3

-(instancetype)init{
    self = [super init];
    if(self){
        country = @"Shu";
        blood_value = 1600;
        energy_value = 150;
        attack = 80;
        armed = 0;
        poison = 0;
        grand = 0;
        sheld = 0;
        flex = 0;
        name = @"诸葛亮";
        NSLog(@"%@自%@疾驰而来！",name,country);
    }
    return self;
}

-(void)skill{
    if(energy_value < 20)return;
    energy_value -= 20;
    flex = 1;
    NSLog(@"诸葛亮识破敌人的攻击，下回合将闪避攻击");
}

-(void)ultimate:(Hero *)target{
    if(energy_value < 80)return;
    energy_value -= 80;
    blood_value += 200;
    [target ChangeOnBlood_Value:-400 Energy_Vlaue:0 attack:0];
    NSLog(@"诸葛亮借助东风，对敌人造成400伤害，恢复自己200生命值");
}

@end


@implementation CaoCao//4

-(instancetype)init{
    self = [super init];
    if(self){
        country = @"Wei";
        blood_value = 1800;
        energy_value = 100;
        attack = 120;
        armed = 0;
        flex = 0;
        grand = 0;
        sheld = 0;
        poison = 0;
        name = @"曹操";
        NSLog(@"%@自%@疾驰而来！",name,country);
    }
    return self;
}

-(void)Weapon{
    armed = 1;
    attack += 200;
    NSLog(@"曹操挥起了倚天剑，攻击力上升150点");
}

-(void)ultimate:(Hero *)target{
    if(energy_value < 80)return;
    energy_value -= 80;
    attack += 20;
    [target ChangeOnBlood_Value:0 Energy_Vlaue:0 attack:-20];
    NSLog(@"曹操使用奸计，使敌人攻击力降低10点，自身攻击力提升10点");
}

@end

@implementation SunQuan //5

-(instancetype)init{
    self = [super init];
    if(self){
        country = @"Wu";
        blood_value = 2200;
        energy_value = 100;
        attack = 80;
        armed = 0;
        sheld = 0;
        grand = 0;
        flex = 0;
        name = @"孙权";
        NSLog(@"%@自%@疾驰而来！",name,country);
    }
    return self;
}

-(void)skill{
    if(energy_value < 10)return;
    energy_value -= 10;
    attack += 5;
    blood_value += 200;
    NSLog(@"孙权运筹帷幄，自身攻击力+5，生命值+200");
}

-(void)ultimate:(Hero *)target{
    if(energy_value < 80)return;
    energy_value -= 80;
    [target poisoned:3];
    NSLog(@"孙权使用宴安鸠毒，使敌方中毒3回合");
}

@end

@implementation ZhaoYun //6

-(instancetype)init{
    self = [super init];
    if(self){
        country = @"Shu";
        blood_value = 2000;
        energy_value = 100;
        attack = 120;
        armed = 0;
        flex = 0;
        sheld = 0;
        grand = 0;
        name = @"赵云";
        NSLog(@"%@自%@疾驰而来！",name,country);
    }
    return self;
}

-(void)Weapon{
    armed = 1;
    attack += 150;
    blood_value += 200;
    NSLog(@"赵云拔出青钢剑，攻击力上升了150点，生命值上升了200点");
}

-(void)ultimate:(Hero *)target{
    if(energy_value < 100)return;
    energy_value -= 100;
    poison = 0;
    grand = 1;
    NSLog(@"赵云气定神闲，净化不利状态，进入圣临状态1回合");
}

@end

@implementation SiMayi //7

-(instancetype)init{
    self = [super init];
    if(self){
        country = @"Wei";
        blood_value = 1700;
        energy_value = 100;
        attack = 80;
        armed = 0;
        flex = 0;
        grand = 0;
        sheld = 0;
        name = @"司马懿";
        NSLog(@"%@自%@疾驰而来！",name,country);
    }
    return self;
}

-(void)skill{
    if(energy_value < 20)return;
    energy_value -= 20;
    sheld = 1;
    NSLog(@"司马懿使用障目法，敌人的攻击力下降%%10，能量值下降30");
}

-(void)ultimate:(Hero *)target{
    if(energy_value < 50)return;
    energy_value -= 50;
    NSInteger miss = [target getflex];
    if(miss == 0){
        [target ChangeOnBlood_Value:-600 Energy_Vlaue:0 attack:0];
        NSLog(@"司马懿指派千军万马，对敌人造成600伤害");
    }
    NSLog(@"%@躲过了千军万马",[target getname]);
}

@end

@implementation SunCe//8

-(instancetype)init{
    self = [super init];
    if(self){
        country = @"Wu";
        blood_value = 1800;
        energy_value = 100;
        attack = 130;
        armed = 0;
        sheld = 0;
        flex = 0;
        poison = 0;
        grand = 0;
        name = @"孙策";
        NSLog(@"%@自%@疾驰而来！",name,country);
    }
    return self;
}

-(void)Weapon{
    armed = 1;
    attack += 100;
    blood_value += 300;
    NSLog(@"孙策持手戟，攻击力上升100，生命值上升300");
}

-(void)ultimate:(Hero *)target{
    if(energy_value < 80)return;
    energy_value -= 80;
    NSInteger miss = [target getflex];
    if(miss ==0){
        blood_value += 200;
        [target ChangeOnBlood_Value:-500 Energy_Vlaue:0 attack:0];
        NSLog(@"孙策大杀四方，对敌人造成400伤害，并恢复200生命值");
    }
    else
        NSLog(@"大杀四方未命中目标");
}

@end


@implementation ChenGong//9

-(instancetype)init{
    self = [super init];
    if(self){
        country = @"free";
        blood_value = 1400;
        energy_value = 120;
        attack = 80;
        armed = 0;
        poison = 0;
        grand = 0;
        sheld = 0;
        flex = 0;
        name = @"陈宫";
        NSLog(@"%@自%@疾驰而来！",name,country);
    }
    return self;
}

-(void)skill{
    if(energy_value < 30)return;
    energy_value -= 30;
    blood_value += 300;
    NSLog(@"陈宫进行阵地建造，提升自身300点生命值");
}

-(void)ultimate:(Hero *)target{
    if(energy_value < 80 || blood_value < 300)return;
    energy_value -= 80;
    NSInteger miss = [target getflex];
    if(miss == 0){
        blood_value -= 300;
        [target ChangeOnBlood_Value:-600 Energy_Vlaue:0 attack:0];
        NSLog(@"陈宫献祭自身300生命，对敌人造成600伤害");
    }
    else NSLog(@"%@避开了%@的献祭",[target getname],name);
}

@end

@implementation ZhangLiao//10

-(instancetype)init{
    self = [super init];
    if(self){
        country = @"Wei";
        blood_value = 2000;
        energy_value = 120;
        attack = 80;
        armed = 0;
        poison = 0;
        grand = 0;
        sheld = 0;
        flex = 0;
        name = @"张辽";
        NSLog(@"%@自%@疾驰而来！",name,country);
    }
    return self;
}

-(void)Weapon{
    armed = 1;
    attack += 100;
    blood_value += 100;
    NSLog(@"张辽挥动钩镰刀，生命值增加100点，攻击力增加100点");
}

-(void)ultimate:(Hero *)target{
    if(energy_value < 90 )return;
    energy_value -= 90;
    attack *= 2;
    NSLog(@"张辽越战越勇，攻击力翻倍！");
}

@end
