//
//  ImageViewController.m
//  Shutterbug
//
//  Created by Alex Paul on 2/25/13.
//  Copyright (c) 2013 Alex Paul. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ImageViewController

- (void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    [self resetImage];
}

- (void)resetImage
{
    if (self.scrollView) {
        self.scrollView.contentSize = CGSizeZero;
        self.imageView.image = nil;
         
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:self.imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        
        if (image) {
            self.scrollView.zoomScale = 1.0; // Reset zoom scale
            self.scrollView.contentSize = image.size; // must be set for scrolling
            self.imageView.image = image;
            self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height); 
        }
    }
}

- (UIImageView *)imageView
{
    if (!_imageView) _imageView = [[UIImageView alloc] initWithFrame:CGRectZero]; // origin 0, size 0
    return _imageView; 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.minimumZoomScale = 0.2; // Must be set in order to Zoom
    self.scrollView.maximumZoomScale = 5.0;
    self.scrollView.delegate = self;
    [self resetImage];
}

//  Must be implemented with the view to zoom
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView; 
}

@end
