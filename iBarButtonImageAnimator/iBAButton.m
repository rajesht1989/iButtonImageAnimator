//
//  iBAButton.m
//  iBarButtonImageAnimator
//
//  Created by Rajesh on 4/6/15.

#import "iBAButton.h"
@interface iBAButton()
{
    SEL iButtonImageSelector;
    id iButtonImageTarget;
    BOOL iButtonImageClipsToBounds;
    UIImageView *iButtonImageImageView;
}
@end
@implementation iBAButton

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    iButtonImageTarget = target;
    iButtonImageSelector = action;
    [super addTarget:self action:@selector(buttonTapped:) forControlEvents:controlEvents];
    if (!iButtonImageImageView)
    {
        iButtonImageImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:iButtonImageImageView];
        [iButtonImageImageView setHidden:YES];
    }
}

- (void)buttonTapped:(UIButton *)button
{
    [iButtonImageTarget performSelector:iButtonImageSelector withObject:button];
    iButtonImageClipsToBounds = self.clipsToBounds;
    self.clipsToBounds = NO;
    [iButtonImageImageView setHidden:NO];
    [iButtonImageImageView setImage:self.selectionImage];
    [self setUserInteractionEnabled:NO];
    [UIView animateWithDuration:.3 animations:^{
        [iButtonImageImageView setFrame:CGRectMake(- iButtonImageImageView.frame.size.width/2, - iButtonImageImageView.frame.size.height/2, iButtonImageImageView.frame.size.width * 2, iButtonImageImageView.frame.size.height * 2)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.3 animations:^{
            [iButtonImageImageView setFrame:self.bounds];
        } completion:^(BOOL finished) {
            [self setUserInteractionEnabled:YES];
            self.clipsToBounds = iButtonImageClipsToBounds;
            [iButtonImageImageView setHidden:YES];
            [iButtonImageImageView setImage:nil];
        }];
    }];
}

@end
