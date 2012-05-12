//
//  IMViewController.h
//  imgur_uploader
//
//  Created by James Chiang on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgurUploader.h"
#import <MessageUI/MessageUI.h>

@interface IMViewController : UIViewController <UIImagePickerControllerDelegate, MFMailComposeViewControllerDelegate>
{
    UIImage *image;
    ImgurUploader *uploader;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@property (weak, nonatomic) IBOutlet UILabel *url_label;
- (IBAction)useCamera:(id)sender;
- (IBAction)sendToImgur:(id)sender;
- (IBAction)sendEmail:(id)sender;

@end

