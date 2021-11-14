//
//  SelectCell.h
//  AA_hackUTD
//
//  Created by Saahil on 11/14/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *from;
@property (weak, nonatomic) IBOutlet UILabel *fromto;
@property (weak, nonatomic) IBOutlet UILabel *fromTime;
@property (weak, nonatomic) IBOutlet UILabel *toTime;

@end

NS_ASSUME_NONNULL_END
