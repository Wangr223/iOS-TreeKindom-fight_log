//
//  Hero.h
//  sanguo
//
//  Created by 王瑞 on 2020/10/3.
//

#ifndef Hero_h
#define Hero_h

@interface Hero : NSObject{
    NSString *country;
    NSInteger blood_value;
    NSInteger energy_value;
    NSInteger attack;
    NSString *name;
    NSInteger armed;
    NSInteger flex;
    NSInteger poison;
    NSInteger sheld;
    NSInteger grand;
}

-(instancetype)init;
-(void)PKOneUnit:(Hero *)target;
-(NSInteger)getblood_value;
-(NSInteger)getenergy_value;
-(NSInteger)getattack;
-(NSString *)getCountry;
-(NSInteger)getflex;
-(NSString *)getname;
-(void)managrow;// mana += 20
-(void)Weapon;
-(void)poisoned:(NSInteger)turn;
-(void)ChangeOnBlood_Value:(NSInteger)Hp
              Energy_Vlaue:(NSInteger)Np
                    attack:(NSInteger)Ad;
-(void)skill;
-(void)ultimate:(Hero *)target;

@end

@interface ZhangFei : Hero{//shu 2200 100 120
    

}

-(void)skill;//blood_value += 200 20mana
-(void)ultimate:(Hero *)target;//attack += 100 blood_value -= 400 80mana

@end

@interface LvBu : Hero{ //free 1800 100 100
    
}

-(void)Weapon;//attack += 200 0mana
-(void)ultimate:(Hero *)target;// 500 damage 80mana

@end

@interface ZhuGeliang : Hero{//shu 1600 100 80
    
}
-(void)skill;//flex
-(void)ultimate:(Hero *)target; //500damage +500blood 80mana

@end

@interface CaoCao : Hero{//wei 2000 100 150
    
}
-(void)Weapon;// yi tian jian
-(void)ultimate:(Hero *)target; //600damage 80mana

@end

@interface SunQuan : Hero{//wu 1600 100 80
    
}
-(void)skill;//hui fu
-(void)ultimate:(Hero *)target; //poison

@end

@interface ZhaoYun : Hero{//shu 2000 100 120
    
}
-(void)Weapon;//qing gang jian
-(void)ultimate:(Hero *)target; //

@end

@interface SiMayi : Hero{//Wei 2000 100 120
    
}
-(void)skill;//xue jian di fang gong ji li
-(void)ultimate:(Hero *)target; // gong ji

@end

@interface SunCe : Hero{//Wu 2000 100 120
    
}
-(void)Weapon;//shou ji
-(void)ultimate:(Hero *)target; // fa shu gong ji

@end

@interface ChenGong : Hero{//Wei 2000 100 120
    
}
-(void)skill;//jia xue
-(void)ultimate:(Hero *)target; // 1:2 zi bao

@end

@interface ZhangLiao : Hero{//Wei 2000 100 120
    
}
-(void)Weapon;// jia lan
-(void)ultimate:(Hero *)target; // 1:2

@end


#endif /* Hero_h */
