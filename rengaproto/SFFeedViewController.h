//
//  SFFeedViewController.h
//  rengaproto
//
//  Created by Sophie Fader on 7/18/14.
//  Copyright (c) 2014 Harlem App Collective LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFFeedViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *feedScrollView;
@property (nonatomic) IBOutlet UIImageView *feedText;

@end
