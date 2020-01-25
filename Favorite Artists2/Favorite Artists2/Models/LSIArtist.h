//
//  LSIArtist.h
//  Favorite Artists2
//
//  Created by Percy Ngan on 1/25/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJRArtist : NSObject

@property NSString *artistName;
@property int yearFormed;
@property NSString *bio;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
