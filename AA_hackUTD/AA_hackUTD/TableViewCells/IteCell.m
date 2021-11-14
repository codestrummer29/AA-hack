//
//  IteCell.m
//  AA_hackUTD
//
//  Created by Saahil on 11/13/21.
//

#import "IteCell.h"

@implementation IteCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellData:(NSDictionary *)data{
    _fromCity.text = [[data valueForKey:@"origin"] valueForKey:@"city"];
    _toCity.text = [[data valueForKey:@"destination"] valueForKey:@"city"];
    _time1.text = [data valueForKey:@"depT"];
    _time2.text = [data valueForKey:@"addT"];
    _date1.text = [data valueForKey:@"dDate"];
    _date2.text = [data valueForKey:@"arrD"];
}

@end
