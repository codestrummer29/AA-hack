//
//  SelectVC.m
//  AA_hackUTD
//
//  Created by Saahil on 11/14/21.
//

#import "SelectVC.h"
#import "SelectCell.h"

@interface SelectVC (){
    NSString *f,*t;
}
@property (weak, nonatomic) IBOutlet UITableView *tableSelect;

@end

@implementation SelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableSelect.delegate = self;
    _tableSelect.dataSource = self;
    [self setUpTableView];
    [_tableSelect reloadData];
    NSLog(@"HERE : %d",_origin);
    if(_origin == 1){
        f = @"Dallas";
        t = @"Las Vegas";
    }else if (_origin == 2){
        f = @"New york";
        t = @"Dallas";
    }
}

- (void)setUpTableView{
    [_tableSelect registerNib:[UINib nibWithNibName:@"SelectCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SelectCell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"HERE : %d",_origin);
    if (indexPath.row == 0){
        NSString *CellIden = @"SelectCell";
        SelectCell *cell = (SelectCell *)[tableView dequeueReusableCellWithIdentifier:CellIden];
        cell.from.text = f;
        cell.fromto.text = t;
        cell.fromTime.text = @"14:00";
        cell.toTime.text = @"15:30";
        return cell;
    }else{
        NSString *CellIden = @"SelectCell";
        SelectCell *cell = (SelectCell *)[tableView dequeueReusableCellWithIdentifier:CellIden];
        cell.from.text = f;
        cell.fromto.text = t;
        cell.fromTime.text = @"17:00";
        cell.toTime.text = @"18:30";
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    dispatch_async(dispatch_get_main_queue(), ^(void){
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Booking Confirmed"
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    //We add buttons to the alert controller by creating UIAlertActions:
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Okay"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil]; //You can use a block here to handle a press on this button
    [alertController addAction:actionOk];
    [self presentViewController:alertController animated:YES completion:nil];
    });
}

@end
