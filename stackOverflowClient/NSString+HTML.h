//
//  NSString+HTML.h
//  stackOverflowClient
//
//  Created by Randall Leung on 11/13/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HTML)

- (NSString *)kv_decodeHTMLCharacterEntities;
- (NSString *)kv_encodeHTMLCharacterEntities;

@end