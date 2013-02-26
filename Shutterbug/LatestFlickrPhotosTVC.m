//
//  LatestFlickrPhotosTVC.m
//  Shutterbug
//
//  Created by Alex Paul on 2/26/13.
//  Copyright (c) 2013 Alex Paul. All rights reserved.
//

#import "LatestFlickrPhotosTVC.h"
#import "FlickrFetcher.h"

@interface LatestFlickrPhotosTVC ()

@end

@implementation LatestFlickrPhotosTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.photos = [FlickrFetcher latestGeoreferencedPhotos]; // Does a query and gives you an array of dictionaries 
}

@end
