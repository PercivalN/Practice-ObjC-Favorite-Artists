//
//  Favorite_Artists2Tests.m
//  Favorite Artists2Tests
//
//  Created by Percy Ngan on 1/25/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIArtist.h"
#import "LSIFileHelper.h"

@interface Favorite_Artists2Tests : XCTestCase

@end

@implementation Favorite_Artists2Tests

- (void)testExample {
NSBundle *bundle = [NSBundle bundleForClass:[self class]];
NSData *data = loadFile(@"Artist.Json", bundle);

NSError *error = nil;
	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

NSLog(@"Error: %@", error);
NSLog(@"JSON: %@", json);

NSArray *artists = json[@"artists"];
LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artists[0]];
NSLog(@"artist: %@", artist);

XCTAssertNotNil(artist);
	XCTAssertEqualObjects(@"Coldplay", artist.artistName);
	XCTAssertEqual(1996, artist.yearFormed);
}

@end
