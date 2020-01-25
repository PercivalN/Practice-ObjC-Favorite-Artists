//
//  LSIArtistController.h
//  Favorite Artists2
//
//  Created by Percy Ngan on 1/25/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

@interface LSIArtistController : NSObject

- (void)searchArtistWithName:(NSString *)artistName completion:(void (^)(LSIArtist *artist, NSError *error))completion;

@end


