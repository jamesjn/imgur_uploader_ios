#import <Foundation/Foundation.h>


@interface NSString (OAURLEncodingAdditions)

- (NSString *)encodedURLString;
- (NSString *)encodedURLParameterString;
- (NSString *)decodedURLString;
- (NSString *)removeQuotes;
@end