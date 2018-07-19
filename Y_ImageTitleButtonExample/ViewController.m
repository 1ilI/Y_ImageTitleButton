//
//  ViewController.m
//  Y_ImageTitleButtonExample
//
//  Created by Yue on 2017/7/19.
//  Copyright © 2017年 Yue. All rights reserved.
//

#import "ViewController.h"
#import "Y_ImgTitlButton.h"

#define ButtonBaseTag 1000
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
static const NSInteger num = 9;
static const CGFloat buttonViewMargin = 20;
@interface ViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UISegmentedControl *segment;

@end

@implementation ViewController

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.segment.frame = CGRectMake(20, 20, SCREEN_WIDTH-40, 20);
    self.scrollView.frame = CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-40);
    [self reloadSubViewsFrame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.segment];
    [self addSubViews];
}

#pragma mark - ===== 添加视图 =====
- (void)addSubViews {
    NSArray *titleArr = @[@"图上字下",
                          @"图下字上",
                          @"图左字右",
                          @"图右字左",
                          @"图左字右 字靠右",
                          @"图左字右 字居中",
                          @"图右字左 字居中",
                          @"图右字左 图靠左",
                          @"图右字左适应",
                          @"🙃",
                          @"😂",
                          @"😎"];
    for (NSInteger i = 0; i != num; i++) {
        Y_ImgTitlButton *button = [[Y_ImgTitlButton alloc] initWithStyle:(int)i];
        button.titleLabel.numberOfLines = 0;
        
        [button setImage:[UIImage imageNamed:@"image.jpg"] forState:UIControlStateNormal];
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        button.tag = ButtonBaseTag + i;
        
        button.titleLabel.backgroundColor = [UIColor lightGrayColor];
        button.backgroundColor = [UIColor cyanColor];
        [button setClickAction:^(UIButton *sender) {
            NSLog(@"click---->%@",sender.titleLabel.text);
        }];
        [self.scrollView addSubview:button];
    }
    
    Y_ImgTitlButton *button1 = [[Y_ImgTitlButton alloc] initWithStyle:ImageTopTitleBottom margin:UIEdgeInsetsMake(10, 20, 30, 40)];
    [button1 setImage:[UIImage imageNamed:@"image.jpg"] forState:UIControlStateNormal];
    [button1 setTitle:@"Margin-上10左20下30右40" forState:UIControlStateNormal];
    button1.tag = ButtonBaseTag + num + 1;
    button1.titleLabel.numberOfLines = 0;
    button1.titleLabel.backgroundColor = [UIColor lightGrayColor];
    button1.backgroundColor = [UIColor cyanColor];
    [button1 addTarget:self action:@selector(button1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button1];
    
    //上下布局的按钮 只看padding 的 size.height
    Y_ImgTitlButton *button2 = [[Y_ImgTitlButton alloc] initWithStyle:ImageTopTitleBottom margin:UIEdgeInsetsMake(0, 0, 0, 0) padding:CGSizeMake(2333, 20)];
    [button2 setImage:[UIImage imageNamed:@"image.jpg"] forState:UIControlStateNormal];
    [button2 setTitle:@"Padding-top-bottom-20" forState:UIControlStateNormal];
    button2.tag = ButtonBaseTag + num + 2;
    button2.titleLabel.backgroundColor = [UIColor lightGrayColor];
    button2.backgroundColor = [UIColor cyanColor];
    [self.scrollView addSubview:button2];
    
    //左右布局的按钮 只看padding 的 size.width
    Y_ImgTitlButton *button3 = [[Y_ImgTitlButton alloc] initWithStyle:ImageLeftTitleRight margin:UIEdgeInsetsMake(0, 0, 0, 0) padding:CGSizeMake(20, 2333)];
    [button3 setImage:[UIImage imageNamed:@"image.jpg"] forState:UIControlStateNormal];
    [button3 setTitle:@"Padding-left-right-20" forState:UIControlStateNormal];
    button3.tag = ButtonBaseTag + num + 3;
    button3.titleLabel.numberOfLines = 0;
    button3.titleLabel.backgroundColor = [UIColor lightGrayColor];
    button3.backgroundColor = [UIColor cyanColor];
    [self.scrollView addSubview:button3];
}

#pragma mark - ===== 点击事件 =====
- (void)button1Clicked:(UIButton *)sender {
    NSLog(@"button1Clicked---->%@",sender.titleLabel.text);
}

- (void)segmentValueChanged:(UISegmentedControl *)sender {
    [self reloadSubViewsFrame];
}

#pragma mark - ===== 刷新布局 =====
- (void)reloadSubViewsFrame {
    NSInteger col = self.segment.selectedSegmentIndex + 1;
    NSInteger row = num/col + num%col;
    CGFloat buttonW = (SCREEN_WIDTH - 2*buttonViewMargin) / col;
    CGFloat buttonH = buttonW;
    for (NSInteger i = 0; i != num; i++) {
        UIButton *button = [self.scrollView viewWithTag:ButtonBaseTag+i];
        
        CGFloat buttonX = buttonViewMargin + (i%col) *buttonW;
        CGFloat buttonY = buttonViewMargin + (i/col) *buttonH;
        
        [UIView animateWithDuration:0.2 animations:^{
            button.frame = CGRectMake(buttonX, buttonY, buttonW-5, buttonH-5);
        }];
    }
    
    CGFloat subViewX = 80;
    CGFloat subViewW = SCREEN_WIDTH-2*subViewX;
    [UIView animateWithDuration:0.2 animations:^{
        CGFloat bottonViewBottom = buttonH *row + 2*buttonViewMargin;
        UIButton *button1 = [self.scrollView viewWithTag:ButtonBaseTag + num + 1];
        [button1 setFrame:CGRectMake(subViewX, bottonViewBottom, subViewW, subViewW)];
        
        CGFloat botton1Bottom = button1.frame.origin.y + button1.frame.size.height + 20;
        UIButton *button2 = [self.scrollView viewWithTag:ButtonBaseTag + num + 2];
        [button2 setFrame:CGRectMake(subViewX, botton1Bottom, subViewW, subViewW)];
        
        CGFloat botton2Bottom = button2.frame.origin.y + button2.frame.size.height  + 20;
        UIButton *button3 = [self.scrollView viewWithTag:ButtonBaseTag + num + 3];
        [button3 setFrame:CGRectMake(subViewX, botton2Bottom, subViewW, subViewW)];
        
        CGFloat botton3Bottom = button3.frame.origin.y + button3.frame.size.height  + 20;
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, botton3Bottom);
    }];
}

#pragma mark - ===== 懒加载 =====
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (UISegmentedControl *)segment {
    if (!_segment) {
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"1列",@"2列",@"3列"]];
        segment.selectedSegmentIndex = 2;
        [segment addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
        _segment = segment;
    }
    return _segment;
}

@end
