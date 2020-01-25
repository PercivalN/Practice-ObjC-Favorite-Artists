//
//  LSIArtistController.m
//  Favorite Artists2
//
//  Created by Percy Ngan on 1/25/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

@implementation LSIArtistController

static NSString * const baseURLStr = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (void)searchArtistWithName:(NSString *)artistName completion:(void (^)(LSIArtist *artist, NSError *error))completion {

	NSURL *baseURL = [NSURL URLWithString:baseURLStr];

	NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
	NSURLQueryItem *searchQuery = [NSURLQueryItem queryItemWithName:@"s" value:artistName];
	[urlComponents setQueryItems:@[searchQuery]];

	NSURL *requestURL = urlComponents.URL;
	NSLog(@"URL: %@", requestURL);

	NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

		if (error) {
			NSLog(@"Error fetching artist info: %@", error);
			completion(nil, error);
			return;
		}

		if (data == nil) {
			NSLog(@"No data was returned from data task");
			completion(nil, [[NSError alloc] init]);
			return;
		}

		NSError *jsonError;
		NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

		if (jsonError) {
			NSLog(@"jsonSerialization error: %@", jsonError);
			completion(nil, jsonError);
			return;
		}

		NSArray *artistArray = jsonDict[@"artists"];
		if (artistArray != (id) [NSNull null]) {
			LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artistArray[0]];
			completion(artist, nil);
		} else {
			NSLog(@"artistArray error: %@", error);
			completion(nil, error);
		}
	}];
	[dataTask resume];
}

@end
