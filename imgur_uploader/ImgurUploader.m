//
//  ImgurUploader.m
//  imgur_uploader
//
//  Created by James Chiang on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImgurUploader.h"
#import "NSData.h"
#import "NSString.h"
#import "NSString_url.h"

@implementation ImgurUploader

@synthesize delegate;

-(void)uploadImage:(UIImage*) image
{
    NSLog(@"made it here");
    NSData *imageData = UIImageJPEGRepresentation(image, 0.3);
    NSString *imageB64   = [imageData base64EncodingWithLineLength:0];
    imageB64 = [imageB64 encodedURLString];
    
    NSString *uploadCall = [NSString stringWithFormat:@"key=b1507316815a853a7a23318ff905a486&image=%@",imageB64];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.imgur.com/2/upload"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"%d",[uploadCall length]] forHTTPHeaderField:@"Content-length"];
    [request setHTTPBody:[uploadCall dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(theConnection)
    {
        receivedData = [NSMutableData data];
        
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
    NSLog(@"did receive data");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{

    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:receivedData];
    [parser setDelegate:self];
    [parser parse];
    NSLog(@"did finish loading");
}


-(void)parserDidEndDocument:(NSXMLParser*)parser
{
    NSLog(@"Parse Finished");
    // NSLog(@"%@", thought);
    [delegate imageUploadedWithURLString:imageURL];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentNode = elementName;
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if( [currentNode isEqualToString:elementName] )
    {
        currentNode = @"";
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if( [currentNode isEqualToString:@"original"] )
    {
        NSLog(@"found characters");
        NSLog(string);
        imageURL = string;
    }
}


@end
