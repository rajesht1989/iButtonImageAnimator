//
//  ViewController.m
//  iBarButtonImageAnimator
//
//  Created by Rajesh on 4/6/15.//

#import "ViewController.h"
#import "iBAButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    iBAButton *button = [[iBAButton alloc] initWithFrame:CGRectMake(100, 100, 25, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    [button setSelectionImage:[UIImage imageNamed:@"info"]];
    [button addTarget:self action:@selector(infoTapped:) forControlEvents:UIControlEventTouchUpInside];
    [button setClipsToBounds:YES];
    [self.view addSubview:button];
    
    
    button = [[iBAButton alloc] initWithFrame:CGRectMake(100, 100, 25, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    [button setSelectionImage:[UIImage imageNamed:@"itunes"]];
    [button addTarget:self action:@selector(infoTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barbtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.toolbar setItems:[NSArray arrayWithObject:barbtn]];

}

- (void)infoTapped:(UIButton *)button
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
