//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Mike Cameron on 2018-04-23.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (nonatomic) SecondViewController* second;
@property (nonatomic) UIPageControl *pageControl;

//@property (nonatomic) UITapGestureRecognizer *tapRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ScrollView.delegate = self;
    SecondViewController *second = [SecondViewController new];
    self.second = second;
    
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
    [image3.trailingAnchor constraintEqualToAnchor:self.ScrollView.trailingAnchor].active = YES;
    
    UITapGestureRecognizer *tapRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wasTapped:)];
    UITapGestureRecognizer *tapRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wasTapped:)];
    UITapGestureRecognizer *tapRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wasTapped:)];
    

    [image1 addGestureRecognizer:tapRecognizer1];
    [image2 addGestureRecognizer:tapRecognizer2];
    [image3 addGestureRecognizer:tapRecognizer3];

    
    float cWidth = image1.bounds.size.width + image2.bounds.size.width + image3.bounds.size.width;
    float cHeight = image1.bounds.size.height + image2.bounds.size.height + image3.bounds.size.height;
    CGSize size = CGSizeMake(cWidth, cHeight);
    
    self.ScrollView.contentSize = size;
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
    self.pageControl.layer.zPosition = 10;
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.pageControl.heightAnchor constraintEqualToConstant:30].active = YES;
    [self.pageControl.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.pageControl.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.pageControl.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    self.pageControl.alpha = 0.5;
    self.pageControl.backgroundColor = [UIColor blackColor];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 1;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f", scrollView.contentOffset.x);
    if (scrollView.contentOffset.x == 0) {
        self.pageControl.currentPage = 1;
    } else if (scrollView.contentOffset.x == 414) {
        self.pageControl.currentPage = 2;
    } else if (scrollView.contentOffset.x == 828) {
        self.pageControl.currentPage = 3;
    }
}

-(IBAction)wasTapped:(UITapGestureRecognizer*)sender {
    NSLog(@"tapped");
    UIImageView *test = (UIImageView *)sender.view;
    UIImage *testImage = test.image;

    [self performSegueWithIdentifier:@"detailSegue" sender:testImage];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SecondViewController *secondV = (SecondViewController *)segue.destinationViewController;
    secondV.image = sender;

}


@end
