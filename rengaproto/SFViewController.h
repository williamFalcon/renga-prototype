//
//  SFViewController.h
//  rengaproto
//
//  Created by Sophie Fader on 7/17/14.
//  Copyright (c) 2014 Harlem App Collective LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) IBOutlet UIScrollView *verseScrollView;
@property (nonatomic) IBOutlet UIImageView *noText;

@end
