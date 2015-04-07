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
    self.selectionImage = self.selectionImage ? self.selectionImage : [self loadImage];
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
    [self resetProperties:NO];
    switch (_animationType)
    {
        case BAZoom:
        {
            [UIView animateWithDuration:.3 animations:^{
                CGSize imageSize = iButtonImageImageView.frame.size;
                [iButtonImageImageView setFrame:CGRectMake(- imageSize.width/2, - imageSize.height/2, imageSize.width * 2, imageSize.height * 2)];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:.3 animations:^{
                    [iButtonImageImageView setFrame:self.bounds];
                } completion:^(BOOL finished) {
                    [self resetProperties:YES];
                }];
            }];
        }
            break;
        case BAHeartBeat:
        {
            CGSize imageSize = iButtonImageImageView.frame.size;
            [UIView animateWithDuration:.3 animations:^{
                [iButtonImageImageView setFrame:CGRectMake(0,0, imageSize.width * 1.3, imageSize.height * 1.3)];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:.2 animations:^{
                    [iButtonImageImageView setFrame:CGRectMake(0,0, imageSize.width * 1, imageSize.height * 1)];
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:.2 animations:^{
                        [iButtonImageImageView setFrame:CGRectMake(0,0, imageSize.width * 1.2, imageSize.height * 1.2)];
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:.2 animations:^{
                            [iButtonImageImageView setFrame:self.bounds];
                        } completion:^(BOOL finished) {
                            [self resetProperties:YES];
                        }];
                    }];
                }];
            }];
        }
        default:
            break;
    }
    
}

- (void)resetProperties:(BOOL)isAnimationEnd
{
    [iButtonImageImageView setHidden:isAnimationEnd];
    [self setUserInteractionEnabled:isAnimationEnd];
    if (isAnimationEnd)
    {
        self.clipsToBounds = iButtonImageClipsToBounds;
        [iButtonImageImageView setImage:nil];
    }
    else
    {
        iButtonImageClipsToBounds = self.clipsToBounds;
        [self setClipsToBounds:isAnimationEnd];
        [iButtonImageImageView setImage:self.selectionImage];
    }
}

- (UIImage*) loadImage {
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

@end
