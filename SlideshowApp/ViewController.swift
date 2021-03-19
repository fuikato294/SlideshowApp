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
    var imageArray:[UIImage] = [
        UIImage(named: "No.1.jpg")!,
        UIImage(named: "No.2.jpg")!,
        UIImage(named: "No.3.jpg")!
      ]
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    var adv = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image1 = UIImage(named:"img1")
        image2 = UIImage(named:"img2")
        image3 = UIImage(named:"img3")
        
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
        adv += 1
    
        switch adv {
        case 1:
            imageView.image = image1
        case 2:
            imageView.image = image2
        case 3:
            imageView.image = image3
        default:
            imageView.image = image1
        }
    }
    
    // 戻るボタン
    @IBAction func reverse(_ sender: Any) {
        adv -= 1
        
        switch adv {
        case 3:
            imageView.image = image3
        case 2:
            imageView.image = image2
        case 1:
            imageView.image = image1
        default:
            imageView.image = image3
        }
    }
    

}

