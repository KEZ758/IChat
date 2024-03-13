//
//  UIImage + Extension.swift
//  RChat
//
//  Created by Ерхан on 11.03.2024.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
    
}
