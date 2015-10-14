//
//  ViewController.m
//  LB_3DTouch
//
//  Created by luobbe on 15/10/14.
//  Copyright © 2015年 luobbe. All rights reserved.
//

#import "ViewController.h"
#import "PreViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate>

@property (weak, nonatomic) IBOutlet UIButton *preBt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:self.preBt];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    
    previewingContext.sourceRect = CGRectMake(0, 0, previewingContext.sourceView.frame.size.width, previewingContext.sourceView.frame.size.height);
    
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PreViewController *vc = [s instantiateViewControllerWithIdentifier:@"PreViewController"];
    vc.preferredContentSize = CGSizeMake(0, 300);
    return vc;
    
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit 
{
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}

@end
