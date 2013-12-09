//
//  LXRViewController.m
//  HMSegmentedControlTest
//
//  Created by Sylvain Guillopé on 12/6/2013.
//  Copyright (c) 2013 Lixar I.T. Inc. All rights reserved.
//

#import "LXRViewController.h"
#import <HMSegmentedControl/HMSegmentedControl.h>

@interface LXRViewController ()

@property (nonatomic, weak) IBOutlet UIView *segmentedControlWrapper;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@end

@implementation LXRViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  [self _configureSegmentedControl];
  [self _configureSegmentedControlWrapper];
}

- (void)_configureSegmentedControl
{
  NSMutableArray *sectionTitles = [NSMutableArray arrayWithArray:@[NSLocalizedString(@"PAY NOW", nil),
                                                                   NSLocalizedString(@"ADD TO TAB", nil),
                                                                   NSLocalizedString(@"CREATE TAB", nil)]];
  
  _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:sectionTitles];
  _segmentedControl.backgroundColor = [UIColor redColor];
  _segmentedControl.textColor = [UIColor grayColor];
  _segmentedControl.font = [UIFont boldSystemFontOfSize:16.0f];
  
  _segmentedControl.selectedTextColor = [UIColor blackColor];
  _segmentedControl.selectionIndicatorHeight = 5.0f;
  _segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:0.5 green:0.6 blue:0.7 alpha:1];
  _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
  _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
  _segmentedControl.selectedSegmentIndex = 1;
}

- (void)_configureSegmentedControlWrapper
{
  self.segmentedControlWrapper.backgroundColor = [UIColor blueColor];
  
  self.segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
  [self.segmentedControlWrapper addSubview:self.segmentedControl];
  [self.segmentedControlWrapper addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[segmentedControl]-0-|"
                                                                                       options:0
                                                                                       metrics:nil
                                                                                         views:@{@"segmentedControl": _segmentedControl}]];
  [self.segmentedControlWrapper addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[segmentedControl]-0-|"
                                                                                       options:0
                                                                                       metrics:nil
                                                                                         views:@{@"segmentedControl": _segmentedControl}]];
}

@end
