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
    
//    @"As bar button without selection image"
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 280, 15)];
    [lbl setText:@"As UIBarButtonItem zoom animation"];
    [lbl setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:lbl];
    
    iBAButton *button = [[iBAButton alloc] initWithFrame:CGRectMake(20, 50, 25, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    [button setSelectionImage:[UIImage imageNamed:@"info"]];
    [button setAnimationType:BAHeartBeat];
    [button addTarget:self action:@selector(infoTapped:) forControlEvents:UIControlEventTouchUpInside];
    [button setClipsToBounds:YES];
    [self.view addSubview:button];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(60, 50, 280, 30)];
    [lbl setText:@"Same image, Heart beat animation"];
    [lbl setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:lbl];
    
    
    button = [[iBAButton alloc] initWithFrame:CGRectMake(20, 100, 25, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    [button setSelectionImage:[UIImage imageNamed:@"itunes"]];
    [button setAnimationType:BAZoom];
    [button addTarget:self action:@selector(infoTapped:) forControlEvents:UIControlEventTouchUpInside];
    [button setClipsToBounds:YES];
    [self.view addSubview:button];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(60, 100, 280, 30)];
    [lbl setText:@"Different image, Zoom animation"];
    [lbl setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:lbl];
    
    button = [[iBAButton alloc] initWithFrame:CGRectMake(20, 150, 25, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    [button setSelectionImage:[UIImage imageNamed:@"itunes"]];
    [button setAnimationType:BAHeartBeat];
    [button addTarget:self action:@selector(infoTapped:) forControlEvents:UIControlEventTouchUpInside];
    [button setClipsToBounds:YES];
    [self.view addSubview:button];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(60, 150, 280, 30)];
    [lbl setText:@"Different image, Heart beat animation"];
    [lbl setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:lbl];
    
    
    button = [[iBAButton alloc] initWithFrame:CGRectMake(20, 200, 25, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    [button setAnimationType:BAHeartBeat];
    [button addTarget:self action:@selector(infoTapped:) forControlEvents:UIControlEventTouchUpInside];
    [button setClipsToBounds:YES];
    [self.view addSubview:button];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(60, 200, 280, 30)];
    [lbl setText:@"Without Selection image, Heart beat animation"];
    [lbl setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:lbl];
    
    button = [[iBAButton alloc] initWithFrame:CGRectMake(20, 250, 30, 30)];
    [button setTitle:@":-)" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setAnimationType:BAZoom];
    [button addTarget:self action:@selector(infoTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(60, 250, 280, 30)];
    [lbl setText:@"Simple text, Zoom animation"];
    [lbl setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:lbl];
    
    
    button = [[iBAButton alloc] initWithFrame:CGRectMake(0, 0, 25, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    [button setSelectionImage:[UIImage imageNamed:@"info"]];
    [button addTarget:self action:@selector(infoTapped:) forControlEvents:UIControlEventTouchUpInside];

   [self.toolbar setItems:[NSArray arrayWithObjects:[[UIBarButtonItem alloc] initWithCustomView:button],nil]];
}

- (void)infoTapped:(UIButton *)button
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
