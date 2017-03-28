//
//  SignInVC.swift
//  Design6
//
//  Created by Sebastian Strus on 2017-03-28.
//  Copyright © 2017 Sebastian Strus. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var signUpView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImage.alpha = 0
        titleLabel.alpha = 0
        secondTitleLabel.alpha = 0
        signUpView.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.bgImage.alpha = 0.6
        }) { (true) in
            self.showTitle()
        }
    }
    
    func showTitle(){
        UIView.animate(withDuration: 1, animations: {
            self.titleLabel.alpha = 1
            self.secondTitleLabel.alpha = 1
        }, completion: { (true) in
            self.showLogo()
        })
        
    }
    
    func showLogo() {
        UIView.animate(withDuration: 1, animations: {
            self.signUpView.alpha = 1
        }) { (true) in
            //self.showStartButton()
        }
    }
    





}
