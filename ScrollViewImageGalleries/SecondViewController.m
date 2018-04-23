//
//  SecondViewController.m
//  ScrollViewImageGalleries
//
//  Created by Mike Cameron on 2018-04-23.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *secondScroll;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondScroll.delegate = self;
    self.secondScroll.minimumZoomScale = 0.2;
    self.secondScroll.maximumZoomScale = 2.0;
    self.imageView.tag = 100;
    self.imageView.image = [UIImage imageNamed:@"Lighthouse-night.jpg"];
    self.imageView.clipsToBounds = YES;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    

}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [scrollView viewWithTag:100];
}

@end
