//
//  ViewController.swift
//  Design6
//
//  Created by Sebastian Strus on 2017-03-28.
//  Copyright © 2017 Sebastian Strus. All rights reserved.
//

import UIKit

class SwipeVC: UIViewController {

    @IBOutlet weak var card: DesignableView!
    
    @IBOutlet weak var arrowLeft: UIImageView!
    @IBOutlet weak var arrowRight: UIImageView!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    var divisor: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        divisor = (view.frame.width / 2) / 0.61
        
        arrowLeft.tintColor = UIColor.orange
        arrowRight.tintColor = UIColor.orange
    }

    

    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
    
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        let scale = min(100/abs(xFromCenter), 1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
        
        
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "thumbUp")
            thumbImageView.tintColor = UIColor.green
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "thumbDown")
            thumbImageView.tintColor = UIColor.red
        }
        thumbImageView.alpha = abs(xFromCenter / view.center.x)

        
        if sender.state == UIGestureRecognizerState.ended {
            
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                })
                return
            }
            else if card.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                })
                return
                
            }
            
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.view.center
                self.thumbImageView.alpha = 0
                card.transform = .identity
                
            })
        }
    }

}

