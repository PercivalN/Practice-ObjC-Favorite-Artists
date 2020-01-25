//
//  LSIArtistDetailViewController.h
//  Favorite Artists2
//
//  Created by Percy Ngan on 1/25/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIArtistController;
@class LSIArtist;

@interface LSIArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property LSIArtistController *artistController;
@property LSIArtist *artist;

@end


