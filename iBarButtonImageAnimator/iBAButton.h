//
//  iBAButton.h
//  iBarButtonImageAnimator
//
//  Created by Rajesh on 4/6/15.
//

#import <UIKit/UIKit.h>

typedef enum {
    BAZoom,
    BAHeartBeat
}iButtonImageAnimationType;

@interface iBAButton : UIButton

@property(nonatomic,strong) UIImage *selectionImage;
@property(nonatomic,assign) iButtonImageAnimationType animationType;
@end
