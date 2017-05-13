//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var img_view: UIImageView!
  var timer: NSTimer!
  var n:UInt32!
  
  @IBOutlet weak var lbl_cap: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func btn_pushJanken(sender: AnyObject) {
    // タイマーを設定
    timer = NSTimer.scheduledTimerWithTimeInterval(
      0.1,
      target: self,
      selector: Selector("updateJanken"),
      userInfo: nil,
      repeats: true
    )
  }
  
  // ぐー
  @IBAction func btn_pushGu(sender: AnyObject) {
    // しょうぶ
    janken_check(1)
    
  }
  
  // ちょき
  @IBAction func btn_pushChoki(sender: AnyObject) {
    // しょうぶ
    janken_check(2)
    
  }
  
  // ぱー
  @IBAction func btn_pushPar(sender: AnyObject) {
    // しょうぶ
    janken_check(3)
    
  }
  
  // 勝負
  func janken_check(data: UInt32){
    
    // 画像を再表示
    updateJanken()
    
    var res = 0
    
    if(n == data){
      // あいこ
      res = 0
    }else{
      switch(data){
      case 1:
        if(n == 2){
          res = 1
        }else{
          res = -1
        }
        break
        
      case 2:
        if(n == 3){
          res = 1
        }else{
          res = -1
        }
        break
        
      default:
        if(n == 1){
          res = 1
        }else{
          res = -1
        }
        break
      }
    }
    
    // しょうぶけっか
    var str = ""
    switch(res){
    case 1:
      str = "あなたの勝ちです！"
      break
    case -1:
      str = "あなたの負けです！"
      break
    default:
      str = "あいこです"
      break
    }
    
    lbl_cap.text = str
    println(str)
    
    // タイマー停止
    timer.invalidate()
    
  }
  
  func image_update()->String{
    
    var file:String = ""
    n = arc4random() % 3 + 1;
    switch(n){
    case 1:
      file = "janken_gu.png"
      break;
    case 2:
      file = "janken_choki.png"
      break;
    default:
      file = "janken_par.png"
      break;
    }
    
    return file
  }
  
  // ランダムに画像を表示
  func updateJanken(){
    
    var file: String = image_update()
    
    // 画像の設定
    let myImage = UIImage(named: file)
    
    // 画像をUIImageViewに設定
    img_view.image = myImage
  }
  
}
