//
//  FlickrPhotoTVC.h
//  Shutterbug
//
//  Created by Alex Paul on 2/26/13.
//  Copyright (c) 2013 Alex Paul. All rights reserved.
//
//  Will call setImageURL: as part of any "Show Image" segue

#import <UIKit/UIKit.h>

@interface FlickrPhotoTVC : UITableViewController

@property (nonatomic, strong) NSArray *photos; // of NSDictionary

@end
