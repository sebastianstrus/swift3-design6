//
//  DesignableView.swift
//  Design4
//
//  Created by Sebastian Strus on 2017-03-27.
//  Copyright © 2017 Sebastian Strus. All rights reserved.
//

import UIKit

@IBDesignable class DesignableImage: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
}
