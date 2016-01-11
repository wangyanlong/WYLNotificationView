# WYLNotificationView
为公司封装的一个简单的吐司view

##Getting Start

**使用 [CocoaPods](http://cocoapods.org)**


1 . 添加 `pod WYLNotificationView` 到你的 [podfile](http://guides.cocoapods.org/using/the-podfile.html)

```
pod 'WYLNotificationView'
```

2 . 在终端运行 `pod install` 然后打开新生成的`xcworkspace`

3 . 在你需要添加的地方添加头文件 `WYLNotificationView.h`


**通过github集成**

1 . download`WYLNotificationView`文件夹,放入你的`project`中

2 . 在你需要添加的地方添加头文件 `WYLNotificationView.h`


##如何使用

1.在你的项目中的AppDelegate.h文件和任何你想发送吐司的文件里,import"WYLNotification.h"

2.如果你想发送普通的吐司需求,你可以写下如下代码.例如:

	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTS:) name:kTSNotification object:nil];
    
    return YES;
	}

	- (void)showTS:(NSNotification *)not{
    
    NSDictionary *dict = [not userInfo];
    
    WYLNotificationView *view = [[WYLNotificationView alloc]init];
    
    view.window = self.window;
    view.tusiStr = [dict objectForKey:kTUCAOStr];
    view.height = self.window.frame.size.height / 10.0f;
    view.font = [UIFont systemFontOfSize:18];
    view.duration = [[dict objectForKey:kTUCAODuration] floatValue];
    
    [view createTuSi];

	}
	
我们将吐司的view添加到window上,然后使其可以在任意界面展示.如果你要发送,你只需要配置一个dict,然后post它即可,例如:

	- (IBAction)post:(id)sender {

    NSDictionary *dict = @{kTUCAOStr:[NSString stringWithFormat:@"这次的测试数字是 : %d",255 - (arc4random()%255)],kTUCAODuration:@(1)};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kTSNotification object:nil userInfo:dict];

	}
	
其中,`kTUCAOStr`是要发送字符串的key,`kTUCAODuration`是要展示的时间.