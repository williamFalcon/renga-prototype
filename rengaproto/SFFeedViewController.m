//
//  SFFeedViewController.m
//  rengaproto
//
//  Created by Sophie Fader on 7/18/14.
//  Copyright (c) 2014 Harlem App Collective LLC. All rights reserved.
//

#import "SFFeedViewController.h"
#import "YLImageView.h"
#import "YLGIFImage.h"

@interface SFFeedViewController ()
@property (strong, nonatomic) IBOutlet UIButton *followingButton;
@property (strong, nonatomic) IBOutlet YLImageView *background;
@property (strong, nonatomic) UIImage *image;
@property (nonatomic) CGSize size;

- (IBAction)followingButtonPress:(UIButton *)sender;

@end

@implementation SFFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //gif
    self.background.image = [YLGIFImage imageNamed:@"4.gif"];
    
    UIView *view = [[UIView alloc]initWithFrame:self.background.frame];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = .7;
    [self.view insertSubview:view aboveSubview:self.background];
     
     // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Add text image over the background on the scrollview 
-(void)viewDidLayoutSubviews{
    

    if (!self.image) {
        self.image = [UIImage imageNamed:@"justtext-new"];
        UIImageView *feedText = [[UIImageView alloc] initWithImage: self.image];
        
        feedText.frame = CGRectMake(0, 6, self.view.frame.size.width -5, self.image.size.height);
        
        self.size = feedText.frame.size;
        self.feedScrollView.delegate = self;
        
        [self.feedScrollView addSubview:feedText];
    }
    
    self.feedScrollView.contentSize = self.size;

    
    
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//Not sure if these actions make sense here because how do you see poem?
/*- (IBAction)detailButtonPress:(UIButton *)sender {

 int i;
    for (i=0; i<self.feedScrollView.subviews.count; i++) {
        [self.feedScrollView.subviews[i] setHidden:YES];
    }
    
    UIImage *image = [UIImage imageNamed:@"feed-text-exp"];
    UIImageView *feedText = [[UIImageView alloc] initWithImage:image];
    feedText.frame = CGRectMake(0,6, image.size.width, image.size.height);
    
    self.feedScrollView.contentSize = feedText.frame.size;
    self.feedScrollView.delegate = self;
    [self.feedScrollView addSubview:feedText];
 
 
    
} */

- (IBAction)followingButtonPress:(UIButton *)sender {

}
@end
