//
//  LSIArtistDetailViewController.m
//  Favorite Artists2
//
//  Created by Percy Ngan on 1/25/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import "LSIArtistDetailViewController.h"
#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;


@end

@implementation LSIArtistDetailViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		_artistController = [[LSIArtistController alloc] init];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.searchBar.delegate = self;
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
}


#pragma mark - Navigation

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
	self.searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
	self.searchBar.showsCancelButton = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	[self.searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	NSString *artistSearchQuery = self.searchBar.text;
	[_artistController searchArtistWithName:artistSearchQuery completion:^(LSIArtist *artist, NSError *error) {
		if (error) {
			NSLog(@"Error fetching artist data with searchQuery: %@:", error);
			return;
		}

		dispatch_async(dispatch_get_main_queue(), ^{
			self.artistNameLabel.text = artist.artistName;
			NSString *yearFormedStr = [NSString stringWithFormat:@"Year formed: %d", artist.yearFormed];
			self.yearFormedLabel.text = yearFormedStr;
			self.bioTextView.text = artist.bio;
		});
	}];

	[self.searchBar resignFirstResponder];
}


@end
