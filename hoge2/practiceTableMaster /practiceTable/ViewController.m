//
//  ViewController.m
//  testTable
//
//  Created by S5-04 on 1/20/15.
//  Copyright (c) 2015 msd. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"



//UITableView使うときは絶対に追加する！！　<UITableViewDelegate>
@interface ViewController ()<UITableViewDelegate>{
    
    //UITableViewの追加
    IBOutlet UITableView *myTableView;
    NSArray *tmpArray;
    int num; //配列の順番を書き出す
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //トップにタイトルを表示させる
    //self.navigationItem.title = @"hoge";
    
    //必須記載項目
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    //配列数決まっている場合
    tmpArray = [[NSArray alloc] init];
    tmpArray = @[@"もも",@"メロン",@"バナナ",@"イチゴ",@"サクラ",@"ゆず",@"レモン",@"ぶどう",@"なし",@"りんご",@"ざくろ",@"ベリー",@"アサイー",@"マンゴー"];
    [myTableView reloadData];//必須！おまじない　再度データを読み込んでもらう
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*Nextボタンメソッド
 -(IBAction)doNext:(id)sender{
 
 // プッシュ遷移処理
 [self performSegueWithIdentifier:@"toSecond" sender:self];
 
 }*/

//1つのセクションに含まれるrow行の数を返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [tmpArray count]; //配列の中身を数えれる
}

//セルの中身設定
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // "cell"というkeyでcellデータを取得
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    // cellデータが無い場合、UITableViewCellを生成して、"cell"というkeyでキャッシュする
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //cell.textLabel.text = @"hoge";
    
    //ナンバーのみががでる 1 2 3....
    //cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    
    //ももばかりが出る
    //cell.textLabel.text = tmpArray[0];
    
    //順番に果物がでる
    cell.textLabel.text = tmpArray[indexPath.row];
    
    return cell; //必ず一番下に書く
}



// cellがタップされた際の処理　ボタンとして処理はできない
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // cellがタップされた際の処理
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除

    NSLog(@"「%@」",tmpArray[indexPath.row]);
    NSLog(@"「%d」",indexPath.row);
    
    num = indexPath.row;//次のページに行く前に書く
    
    //次のページにいく
    [self performSegueWithIdentifier:@"toSecond" sender:self];
    
    
    
}

//次画面へのSegueの発動 内容を送りたい時 一番上に #import "SecondViewController.h" 書きインポート
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"コード追加したよ");
    if ([[segue identifier] isEqualToString:@"toSecond"]) {
        SecondViewController *svc = (SecondViewController*)[segue destinationViewController]; //svc　はインスタンス名
        svc.getString = tmpArray[num]; //secondview.hで作成　getString.  numで数字指定
        
    }
    
}



/*メソッド呼び出す方法*/
#pragma mark - hoge
// !!!:{hogeメソッドを呼び出す}
/**hogeをよびだす*/
-(void)hoge{
    
}


@end
