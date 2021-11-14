//
//  ViewController.m
//  AA_hackUTD
//
//  Created by Saahil on 11/13/21.
//

#import "ViewController.h"
#import "IteCell.h"
#import "SelectVC.h"
@import FirebaseCore;
@import FirebaseFirestore;

@interface ViewController (){
    NSMutableArray *mydata;
}
@property (weak, nonatomic) IBOutlet UITableView *tableIte;
@property (nonatomic, readwrite) FIRFirestore *db;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableIte.delegate = self;
    _tableIte.dataSource = self;
    self.db = [FIRFirestore firestore];
    [self setUpTableView];
    [self fetchData];
}

- (void)setUpTableView{
    mydata = [[NSMutableArray alloc] init];
    _tableIte.estimatedRowHeight = 200;
    [_tableIte registerNib:[UINib nibWithNibName:@"IteCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"IteCell"];
}

- (void)fetchData{
    //Get data here
    [[self.db collectionWithPath:@"flightdetails"]
        getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot,
                                     NSError * _Nullable error) {
          if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
          } else {
            for (FIRDocumentSnapshot *document in snapshot.documents) {
                [self->mydata addObject:document.data];
            }
              [self->_tableIte reloadData];
          }
        }];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *CellIden = @"IteCell";
    IteCell *cell = (IteCell *)[tableView dequeueReusableCellWithIdentifier:CellIden];
    [cell updateCellData:mydata[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return mydata.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    dispatch_async(dispatch_get_main_queue(), ^(void){
            //Run UI Updates
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Will you be able to make it to your next flight?" preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"NO!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                //button click event
            NSLog(@"here");
            dispatch_async(dispatch_get_main_queue(), ^(void){
                SelectVC *vc = [[SelectVC alloc] init];
                vc.origin = (int)indexPath.row;
                [self.navigationController pushViewController:vc animated:YES];
            });
        }];
            
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        });
}

@end
