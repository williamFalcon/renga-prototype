//
//  SFViewController.m
//  rengaproto
//
//  Created by Sophie Fader on 7/17/14.
//  Copyright (c) 2014 Harlem App Collective LLC. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()

@property (strong, nonatomic) IBOutlet UIButton *verseButton;
@property (strong, nonatomic) UIView *titleMenu;

- (IBAction)versePressed:(UIButton *)sender;
- (IBAction)titleButtonPressed:(UIButton *)sender;


@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    
    UIImage *optionsImage = [UIImage imageNamed:@"poemMenu"];
    UIImageView *optionsImageView = [[UIImageView alloc] initWithImage:optionsImage];
    optionsImageView.frame = CGRectMake(0,65, optionsImage.size.width/2,optionsImage.size.height/2);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tttitleTapped:)];
    [optionsImageView addGestureRecognizer:tap];
    
    
    [self.view addSubview:optionsImageView];
    [optionsImageView setUserInteractionEnabled:YES];
    self.titleMenu = optionsImageView;
    self.titleMenu.alpha = 0;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    
    // add image to main scroll view
    UIImage *image = [UIImage imageNamed:@"justtext"];
    UIImageView *noText = [[UIImageView alloc] initWithImage: image];
    
    noText.frame = CGRectMake(0, 6, image.size.width, image.size.height);
    
    self.scrollView.contentSize = noText.frame.size;
    self.scrollView.delegate = self;
    
    [self.scrollView addSubview:noText];
    
    
    //add image to inner scroll view
    
    UIImage *longImage = [UIImage imageNamed:@"long-text"];
    UIImageView *longImageView = [[UIImageView alloc]initWithImage: longImage];
    
    longImageView.frame = CGRectMake(0,0, longImage.size.width, longImage.size.height -5);
    
    self.verseScrollView.contentSize = longImageView.frame.size;
    self.verseScrollView.delegate = self;
    
    [self.verseScrollView addSubview:longImageView];
    
    
}


//Show verse actions image

- (IBAction)versePressed:(UIButton *)sender {
    int i;
    for (i=0; i<self.scrollView.subviews.count; i++) {
        [self.scrollView.subviews[i] setHidden:YES];
    }
    
    UIImage *image = [UIImage imageNamed:@"expand-verse"];
    UIImageView *feedText = [[UIImageView alloc] initWithImage:image];
    feedText.frame = CGRectMake(0,0, image.size.width, image.size.height);
    
    self.scrollView.contentSize = feedText.frame.size;
    self.scrollView.delegate = self;
    [self.scrollView addSubview:feedText];
    
    
}

- (IBAction)titleButtonPressed:(UIButton *)sender {
    
    [UIView animateWithDuration:.2 animations:^{
        self.titleMenu.alpha = 1;

    }];
    
}

-(void)tttitleTapped:(UITapGestureRecognizer *) tap {
    [UIView animateWithDuration:.2 animations:^{
        self.titleMenu.alpha = 0;
        
    }];

}
@end
