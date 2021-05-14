//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by fumitaka katou on 2021/03/28.
//

import UIKit

class ExpansionViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    // EVCがVCからデータを受け取るために手を差し出しているイメージ。
    // imageという名の入れ物にデータを渡してもらう予定だが、まだ入れ物は空っぽ
    // だから、UIImageはオプション型にする。UIImageに該当するデータが入るかもしれないし、そうでなければ入らないかもしれないよという状態。
    var image: UIImage?
    // Apple社が用意したviewDidLoadというプログラムをoverride(書き換え)しますよ
    // viewDidLoadは、画面遷移直前のライフサイクル。
    override func viewDidLoad() {
            // 書き換えるといっても、viewDidLoadはそのまま使わせてもらって、下の処理を追加します
            super.viewDidLoad()
        // imageViewはOutletのもの。=右のimageは15行目の入れ物。=左のimageはUIKit内から引用。
        imageView.image = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
