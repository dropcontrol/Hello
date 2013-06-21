//
//  HelloViewController.m
//  Hello
//
//  Created by hiroshi yamato on 4/26/13.
//  Copyright (c) 2013 Alliance Port, LLC. All rights reserved.
//

#import "HelloViewController.h"

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
    label = [[UILabel alloc] initWithFrame:CGRectMake(110, 120, 100, 50)];
    label.text = @"hoge";
    [contentView addSubview:label];
    [label release];
    
    // UIButtonで、ボタンをラベルの下に表示しておいてください。
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"ボタン" forState:UIControlStateNormal];
    button.frame = CGRectMake(110, 180, 100, 50);
    button.tag = 0;
    [button addTarget:self action:@selector(changeLabel:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"ボタン1" forState:UIControlStateNormal];
    button1.frame = CGRectMake(110, 240, 100, 50);
    button1.tag = 1;
    [button1 addTarget:self action:@selector(changeLabel:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:button1];
    
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

@end
