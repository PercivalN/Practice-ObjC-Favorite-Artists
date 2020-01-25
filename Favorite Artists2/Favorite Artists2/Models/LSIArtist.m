//
//  LSIArtist.m
//  Favorite Artists2
//
//  Created by Percy Ngan on 1/25/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [self init]) {

		//NSDictionary *artistInfo = dictionary[@"artists"];

		NSString *artistName = dictionary[@"strArtist"];
		NSString *artistBio = dictionary[@"strBiographyEN"];
		NSString *yearFormedStr = dictionary[@"intFormedYear"];

		if (artistName != nil &&
			artistBio != nil &&
			yearFormedStr != nil) {
			_artistName = artistName;
			_bio = artistBio;
			_yearFormed = [yearFormedStr intValue];
		} else {
			NSLog(@"Error: unable to parse artist: %@", dictionary);
			return nil;
		}

	}
	return self;
}

- (NSString *)formedInYearDesc {
	return [NSString stringWithFormat:@"Formed in %d", self.yearFormed];
}

@end
