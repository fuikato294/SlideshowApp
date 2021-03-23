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
        UIImage(named: "No.3.jpg")!,
        UIImage(named: "No.1.jpg")!,
        UIImage(named: "No.2.jpg")!
      ]
    
    @IBOutlet weak var imageView: UIImageView!
    
    
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
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 2
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }

}

