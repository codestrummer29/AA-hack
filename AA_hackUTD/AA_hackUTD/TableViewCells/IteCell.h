//
//  IteCell.h
//  AA_hackUTD
//
//  Created by Saahil on 11/13/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IteCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fromCity;
@property (weak, nonatomic) IBOutlet UILabel *toCity;
@property (weak, nonatomic) IBOutlet UILabel *time1;
@property (weak, nonatomic) IBOutlet UILabel *time2;
@property (weak, nonatomic) IBOutlet UILabel *date1;
@property (weak, nonatomic) IBOutlet UILabel *date2;

- (void)updateCellData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
