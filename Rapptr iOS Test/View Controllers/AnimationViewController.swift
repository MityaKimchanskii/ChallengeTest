//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: UIViewController {

    // MARK: - Properties
    var location = CGPoint(x: 0, y: 0)
    
    // MARK: - IBOutlets
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var fadeinButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
    }
    
    // MARK: - Actions
    @IBAction func didPressFade(_ sender: Any) {
        let imageHide = logoImageView.alpha == 1
        
        if imageHide {
            UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.logoImageView.alpha = 0.0
            }, completion: nil)
            fadeinButton.setTitle("FADE IN", for: .normal)
           
        } else {
            UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.logoImageView.alpha = 1.0
            }, completion: nil)
            fadeinButton.setTitle("FADE OUT", for: .normal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        location = touch.location(in: self.view)
        logoImageView.center = location
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        location = touch.location(in: self.view)
        logoImageView.center = location
    }
}
