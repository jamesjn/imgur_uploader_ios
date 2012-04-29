//
//  IMViewController.m
//  imgur_uploader
//
//  Created by James Chiang on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IMViewController.h"

@implementation IMViewController 
@synthesize imageview;
@synthesize url_label;

- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissModalViewControllerAnimated:YES];
    image = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    imageview.image = image;
    
}

-(void)imageUploadedWithURLString:(NSString*)urlString
{   NSLog(urlString);
    url_label.text = urlString;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{

    [self setImageview:nil];
    [self setUrl_label:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)useCamera:(id)sender {  
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    [self presentModalViewController:imagePicker animated:YES];
}

- (IBAction)sendToImgur:(id)sender {
    uploader = [[ImgurUploader alloc] init];
    uploader.delegate = self;
    [uploader uploadImage:image];
}
@end
