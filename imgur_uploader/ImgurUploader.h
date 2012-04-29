//
//  ImgurUploader.h
//  imgur_uploader
//
//  Created by James Chiang on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ImgurUploaderDelegate

-(void)imageUploadedWithURLString:(NSString*)urlString;
-(void)uploadProgressedToPercentage:(CGFloat)percentage;
-(void)uploadFailedWithError:(NSError*)error;

@end

@interface ImgurUploader : NSObject <NSXMLParserDelegate>
{
    id<ImgurUploaderDelegate> delegate;
    NSMutableData *receivedData;
    NSString* imageURL;
    NSString* currentNode;
}

-(void)uploadImage:(UIImage*)image;
 
@property (strong, nonatomic) id <ImgurUploaderDelegate> delegate;

@end
