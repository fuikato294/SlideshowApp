//
//  ViewController.swift
//  SlideshowApp
//
//  Created by fumitaka katou on 2021/03/15.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var UIButton: UIButton!
    @IBOutlet weak var AdvButton: UIButton!
    @IBOutlet weak var RevButton: UIButton!
    
    // 配列に指定するindex番号を宣言
    
    var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    // スライドショーさせる画像の配列を宣言
    // UIImageという型の指定に、[]をつけることで「入れるのがUIImageなら、この箱にいくつ入れてもいいよ」という意味になる
    var imageArray:[UIImage] = [
        UIImage(named: "No.1.jpg")!,
        UIImage(named: "No.2.jpg")!,
        UIImage(named: "No.3.jpg")!
    ]
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named:"No.1.jpg")
    }
    
    // 再生ボタンを押した時の処理
    @IBAction func slideShowButton(_ sender: Any) {
        
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装
            
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            UIButton.setTitle("停止", for: .normal)
            
            AdvButton.isEnabled = false
            RevButton.isEnabled = false
            
            AdvButton.backgroundColor = UIColor.gray
            RevButton.backgroundColor = UIColor.gray
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            // ボタンの名前を停止に変える
            UIButton.setTitle("再生", for: .normal)
            
            AdvButton.isEnabled = true
            RevButton.isEnabled = true
            
            AdvButton.backgroundColor = UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1.0)
            RevButton.backgroundColor = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)
            
        }
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    // 進むボタン
    @IBAction func advance(_ sender: Any) {
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    // 戻るボタン
    @IBAction func reverse(_ sender: Any) {
        nowIndex -= 1
        
        if (nowIndex < 0) {
            nowIndex = 2
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // テキストの画面遷移のところからコードをコピペ。そのコードをベースに書き換えていく
        // =より右側　segue.destination「これから遷移するから、（先に）遷移先のこと教えて」
        // as! ExpantionViewController「遷移先っていうのは、ExpantionViewControllerですよ」
        // =より左側　let resultViewController「入れ物作ります。入れ物の名前はresultViewControllerです」
        // :ExpansionViewController ':'の後ろに書くのは型など　「ExpansionViewControllerだったら入れ物に入れていいよ」
        let resultViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        // imageArrayはVC内上部で画像の配列を宣言しているところから引っ張っている。
        // [nowIndex]は、19行目で宣言しているnowIndexという入れ物。アプリ上で現在表示されている画像チェックしているnowIndexのデータを遷移先に渡す
        resultViewController.image = imageArray[nowIndex]
 
        // timerがnilでない場合(再生中)
        if (timer != nil) {

            // 停止処理を実装
            // タイマーを無効にする
            timer.invalidate()
            
            // タイマーをnilにしておく
            timer = nil
            
            // ボタンの名前を再生に変える
            UIButton.setTitle("再生", for: .normal)
            
            AdvButton.isEnabled = true
            RevButton.isEnabled = true
            
            AdvButton.backgroundColor = UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1.0)
            RevButton.backgroundColor = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)
            
        // timerがnilの場合(停止中)
        } else {
            
            // ボタンの名前を再生に変える
            UIButton.setTitle("再生", for: .normal)
            
            AdvButton.isEnabled = true
            RevButton.isEnabled = true
            
            AdvButton.backgroundColor = UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1.0)
            RevButton.backgroundColor = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)
        }
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {

    }
    
}
