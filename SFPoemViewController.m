//
//  SFPoemViewController.m
//  rengaproto
//
//  Created by Sophie Fader on 7/18/14.
//  Copyright (c) 2014 Harlem App Collective LLC. All rights reserved.
//

#import "SFPoemViewController.h"
#import "YLGIFImage.h"

@interface SFPoemViewController ()

@property (strong, nonatomic) IBOutlet UITextField *titleText;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) UILabel *placeHolder;


@end

@implementation SFPoemViewController




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
    // Do any additional setup after loading the view.
    UIColor *color = [UIColor lightTextColor];
    self.titleText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Title your poem" attributes:@{NSForegroundColorAttributeName: color}];
    
    //init placeholder
    if (!self.placeHolder) {
        self.placeHolder = [[UILabel alloc]initWithFrame:self.textView.frame];
        self.placeHolder.text = @"Start writing...";
        self.placeHolder.font = self.textView.font;
        self.placeHolder.textColor = self.textView.textColor;
        self.placeHolder.frame = CGRectOffset(self.placeHolder.frame, 5, -55);
        [self.view insertSubview:self.placeHolder belowSubview:self.textView];
        
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.textView addGestureRecognizer:tap];
}

-(void)tap:(UITapGestureRecognizer *)tap{
    
    if (self.textView.isFirstResponder) {
        [self.textView resignFirstResponder];
    }else{
        [self.textView becomeFirstResponder];
    }
}


-(BOOL)textViewShouldReturn:(UITextView *)textField{
    //[textField resignFirstResponder];
    
    return YES;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    //toggle placeholder
    [self togglePlaceHolder:textView];
    
    return YES;
}

- (void)togglePlaceHolder:(UITextView *)textView{
    if (self.textView.text.length == 0) self.placeHolder.alpha = 1;
    else self.placeHolder.alpha = 0;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [self togglePlaceHolder:textView];
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    [self togglePlaceHolder:textView];
    
    
    // For any other character return TRUE so that the text gets added to the view
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)textfield:(id)sender {
}
@end
