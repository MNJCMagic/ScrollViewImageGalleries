//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Mike Cameron on 2018-04-23.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ScrollView.delegate = self;
    
    //UIImageviews
    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lighthouse.jpg"]];
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lighthouse-in-Field.jpg"]];
    UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lighthouse-night.jpg"]];
    
    [self.ScrollView addSubview:image1];
    [self.ScrollView addSubview:image2];
    [self.ScrollView addSubview:image3];
    
    image1.userInteractionEnabled = YES;
    image2.userInteractionEnabled = YES;
    image3.userInteractionEnabled = YES;
    
    image1.clipsToBounds = YES;
    image2.clipsToBounds = YES;
    image3.clipsToBounds = YES;

    image1.contentMode = UIViewContentModeScaleAspectFit;
    image2.contentMode = UIViewContentModeScaleAspectFit;
    image3.contentMode = UIViewContentModeScaleAspectFit;

    image1.translatesAutoresizingMaskIntoConstraints = NO;
    image2.translatesAutoresizingMaskIntoConstraints = NO;
    image3.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    [image1.leadingAnchor constraintEqualToAnchor:self.ScrollView.leadingAnchor].active = YES;
    [image1.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [image1.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [image1.widthAnchor constraintEqualToConstant:width].active = YES;
    [image1.heightAnchor constraintEqualToConstant:height].active = YES;

    
    [image2.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [image2.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [image2.leadingAnchor constraintEqualToAnchor:image1.trailingAnchor].active = YES;
    [image2.trailingAnchor constraintEqualToAnchor:image3.leadingAnchor].active = YES;
    [image2.widthAnchor constraintEqualToConstant:width].active = YES;
    [image2.heightAnchor constraintEqualToConstant:height].active = YES;
    
    [image3.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [image3.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [image3.widthAnchor constraintEqualToConstant:width].active = YES;
    [image3.heightAnchor constraintEqualToConstant:height].active = YES;
    
    

    
////    CGRect bounds = self.view.bounds;
////    [image1 setBounds:bounds];
//    [image1.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
//    [image1.topAnchor constraintEqualToAnchor:self.ScrollView.topAnchor].active = YES;
//    [image1.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
//    [image1.bottomAnchor constraintEqualToAnchor:image2.topAnchor].active = YES;
//
////    image2.bounds =CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
////    [image2.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
//    [image2.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
//    [image2.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active =  YES;
//
////    image3.bounds =CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//    [image3.topAnchor constraintEqualToAnchor:image2.bottomAnchor].active = YES;
//    [image3.bottomAnchor constraintEqualToAnchor:self.ScrollView.bottomAnchor].active = YES;
//    [image3.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
//    [image3.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    
    float cWidth = image1.bounds.size.width + image2.bounds.size.width + image3.bounds.size.width;
    float cHeight = image1.bounds.size.height + image2.bounds.size.height + image3.bounds.size.height;
    CGSize size = CGSizeMake(cWidth, cHeight);
    
    self.ScrollView.contentSize = size;
    
    

}

-(void)viewDidLayoutSubviews {
//    self.ScrollView.frame = self.view.frame;
}

@end
