//
//  ViewController.m
//  QR
//
//  Created by Simon Persson on 2018-01-18.
//  Copyright © 2018 Simon Persson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// Method for generating QR code.
- (CIImage *)createQRForString:(NSString *)qrString {
    NSData *stringData = [qrString dataUsingEncoding: NSISOLatin1StringEncoding];
    
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    
    return qrFilter.outputImage;
}

- (void)generateQRCode {
    // String to become QR code.
    NSString *qrString = [NSString stringWithFormat:@"Hello world!"];
    
    // Generate QR code.
    CIImage *image = [self createQRForString:qrString];
    
    // Make QR code clearer.
    CGAffineTransform transform = CGAffineTransformMakeScale(10, 10);
    CIImage *output = [image imageByApplyingTransform:transform];
    
    // Assign QR code to UIImageView.
    qrImageView.image = [UIImage imageWithCIImage:output];
}

- (void)viewDidLoad {
    [self generateQRCode];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
