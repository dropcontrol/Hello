//
//  HelloViewController.m
//  Hello
//
//  Created by hiroshi yamato on 4/26/13.
//  Copyright (c) 2013 Alliance Port, LLC. All rights reserved.
//

#import "HelloViewController.h"
#import "NextViewController.h"

@interface HelloViewController ()
{
    UILabel *label;
}

@end

@implementation HelloViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)loadView
{
    //下地のビューを作っておく
    // alloc するので参照カウントが1
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = contentView;    //retainされるので、参照カウントが2
    [contentView release];      //解放したので、参照カウントが1
    
    contentView.backgroundColor = [UIColor redColor]; //参照カウントは1
    
    // UILabelで、HELLOって表示してください。
    label = [[UILabel alloc] initWithFrame:CGRectMake(110, 80, 100, 50)];
    label.text = @"hoge";
    [contentView addSubview:label];
    [label release];
    
    // UIButtonで、ボタンをラベルの下に表示しておいてください。
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"ボタン" forState:UIControlStateNormal];
    button.frame = CGRectMake(110, 140, 100, 50);
    button.tag = 0;
    [button addTarget:self action:@selector(changeLabel:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"ボタン1" forState:UIControlStateNormal];
    button1.frame = CGRectMake(110, 200, 100, 50);
    button1.tag = 1;
    [button1 addTarget:self action:@selector(changeLabel:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:button1];
    
    UIBarButtonItem *nextBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(pushNextButton)];
    
    self.navigationItem.title = @"1st";
    self.navigationItem.rightBarButtonItem = nextBarButtonItem;
    [nextBarButtonItem release];
    
}

// ボタンを押したら上のUILabelの文字が他の文字に変るようにしてください。
- (void)changeLabel:(UIButton *)thisButton
{
    if (thisButton.tag == 0) {
        label.text = @"0";
    } else if (thisButton.tag == 1) {
        label.text = @"1";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushNextButton
{
    NextViewController *nextViewController = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nextViewController animated:YES];
    [nextViewController release];
}

@end
