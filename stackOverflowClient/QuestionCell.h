//
//  QuestionCell.h
//  stackOverflowClient
//
//  Created by Randall Leung on 11/11/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UILabel *tags;
@property (strong, nonatomic) IBOutlet UILabel *userName;

@end
