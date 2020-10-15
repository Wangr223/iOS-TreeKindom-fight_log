# MOSAD hw1
## 代码概况

 - 父类
 ![父类的属性和方法](https://img-blog.csdnimg.cn/20201015164708946.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbmdyMjIz,size_16,color_FFFFFF,t_70#pic_center)
 
    | 父类属性/方法        | 类型/返回类型    |  描述  |
    | --------   | :-----:   | :----: |
    | country  | String |   国家    |
    | blood_value        | NS整形      |   血量    |
    | energy_value        | NS整形      |   法力值    |
	| attack        | NS整形      |   攻击力    |
	| name        | String      |   名字    |
	| armed        | NS整形      |   是否装备武器    |
	| flex        | NS整形      |   是否在闪避状态    |
	| poison       | NS整形      |   是否中毒    |
	| sheld        | NS整形      |   是否施加钝化    |
	| grand       | NS整形      |   是否进入超然状态    |
	| init();        | instancetype      |   初始化英雄    |
	| PKOneUnit();        | void      |   己方回合    |
	| get___();        | -      |   返回对应值    |
	| managrow()；        | void      |   自然恢复法力值    |
	| poisioned();        | void      |   中毒伤害清算    |
	| change__(,,);        | void      |   buff、他伤清算    |
	| weapon();        | void      |   装备武器    |
	| skill();        | void      |   小技能    |
	| ultimate(Hero*);        | void      |   终极技能    |
	每个英雄都固有这些属性.

- 子类
由于具体实现的代码较繁杂，这里只给出子类的多态体现。

| 英雄        | weapon   |  skill  |  ultimate |
| --------   | :-----:   | :----: | :----:|
| 吕布       | attack+= 200; armed = 1      |   -   |500 damge ; energy_value -= 80|
| 张飞        | -     |   blood_value += 200; energy_value -= 20   |blood_value -= 200;  attack== 200；|
| 诸葛亮        | -  |   flex = 1; energy_value -= 20; //only for one turn     | 400damage; blood_value += 200;|
| 曹操       | attack+= 200; armed = 1      |   -   |attack += 10;target.attack -= 10 ; energy_value -= 80|
| 孙权       | -      |   attack += 5;  blood_value += 200; energy_damge -= 20;  | target.poisoned =  1|
| 赵云  | attack+= 150; armed = 1  blood_value += 200     |   -   |grand = 1; poison = 0; energy_value -= 100;
| 司马懿       | -      |   sheld = 1; energy_value -= 20  |600 damge ; energy_value -= 50|
| 孙策       | attack+= 100; armed = 1; blood_value += 300  |   -   |400 damge ; energy_value -= 80; blood_value += 200;|
|  陈宫      | -   |   energy_value - = 30; blood_value += 300;   |600 damge ; energy_value -= 80; blood_value -= 300;|
|  张辽      |  armed = 1; blood_value += 100; attack += 100   |   -  |attack *= 2; energy_value -= 90; |
基于父类，每一个子类都有不同的weapon、skill、ultimate，这里体现了多态与继承。

## 战斗机制
- 父类中包含一个PKOneUnit();
- 所有子类继承父类Hero的PKOneUnit()；
- 在PKOneUnit（）中，会对己方和敌方的当前状态进行结算，然后概率装备weapon以及发动skill和ultimate，其中skill、ultimate需要满足energy_value要求才可以发动。在PKOneUnit()执行完毕后，会得到一个双方的当前状态。在main函数中进行判断，若有一方先出现血量 <= 0 的情况， 则判定败北；另一种情况是回合数超过10，双方被判平手。
- 关于数据隐秘性、封装性，则体现在各个属性保存在父类当中，若需调用则必须使用对应的get_();函数，外界无法直接取得。

## 结果截图
 ![具体战斗Log](https://img-blog.csdnimg.cn/20201015225904319.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbmdyMjIz,size_16,color_FFFFFF,t_70#pic_center)
