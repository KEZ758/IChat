//
//  UILabel + Extension.swift
//  iChat
//
//  Created by Ерхан on 11.03.2024.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, textColor: UIColor = .black,font: UIFont? = .avenir20()) {
        self.init()
        
        self.textColor = textColor
        self.text = text
        self.font = font
    }
    
}
