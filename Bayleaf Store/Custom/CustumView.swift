//
//  UiViewControl.swift
//  AI Project
//
//  Created by Ogabek Mansurov on 6/23/23.
//

import UIKit

class CustumView: UIView {

    init(hasbackgroundColor: UIColor, borderColor: UIColor, borderWidth: CGFloat) {
        super.init(frame: .zero)
        
        self.backgroundColor = hasbackgroundColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



