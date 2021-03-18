//
//  ViewController.swift
//  SlideshowApp
//
//  Created by fumitaka katou on 2021/03/15.
//

import UIKit

class ViewController: UIViewController {
    
    
    
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

