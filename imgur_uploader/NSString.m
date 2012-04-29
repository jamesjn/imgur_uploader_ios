#import "NSString.h"


@implementation NSString (OAURLEncodingAdditions)

- (NSString *)encodedURLString {
    NSString *result = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (__bridge CFStringRef)self,
                                                                           NULL, // characters to leave unescaped (NULL = all escaped sequences are replaced)
                                                                           CFSTR("?=&+"), // legal URL characters to be escaped (NULL = all legal characters are replaced)
                                                                           kCFStringEncodingUTF8); // encoding
    return result;
}

- (NSString *)encodedURLParameterString {
    NSString *result = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (__bridge CFStringRef)self,
                                                                           NULL,
                                                                           CFSTR(":/=,!$&'()*+;[]@#?"),
                                                                           kCFStringEncodingUTF8);
    return result;
}

- (NSString *)decodedURLString {
    NSString *result = (__bridge NSString*)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                          (__bridge CFStringRef)self,
                                                                                          CFSTR(""),
                                                                                          kCFStringEncodingUTF8);
    
    return result;
    
}

-(NSString *)removeQuotes
{
    NSUInteger length = [self length];
    NSString *ret = self;
    if ([self characterAtIndex:0] == '"') {
        ret = [ret substringFromIndex:1];
    }
    if ([self characterAtIndex:length - 1] == '"') {
        ret = [ret substringToIndex:length - 2];
    }
    
    return ret;
}

@end