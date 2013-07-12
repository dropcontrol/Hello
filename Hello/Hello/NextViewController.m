//
//  NextViewController.m
//  Hello
//
//  Created by hiroshi yamato on 6/28/13.
//  Copyright (c) 2013 Alliance Port, LLC. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
{
    UILabel *label;
}

@end

@implementation NextViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

- (void)loadView
{
    //下地のビューを作っておく
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = contentView;    //retainされるので
    [contentView release];      //解放しておくよ
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(110, 80, 100, 50)];
    label.text = @"next";
    [contentView addSubview:label];
    [label release];
    
    // UIButtonで、ボタンをラベルの下に表示しておいてください。
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"リセット" forState:UIControlStateNormal];
    button.frame = CGRectMake(110, 140, 100, 50);
    button.tag = 0;
    [button addTarget:self action:@selector(resetHelloView:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:button];

}

- (void)resetHelloView:(UIButton *)button
{
    NSLog(@"resetHelloView was pushed");
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
