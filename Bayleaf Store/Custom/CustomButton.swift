//
//  CustomButton.swift
//  CALCULATE
//
//  Created by Ogabek Mansurov on 12/06/23.
//

import UIKit

class CustomButton: UIButton {

    init(title: String, hasBackground: Bool = false, FontSize: CGFloat, tintColor: Bool = true ,borderColor: Bool = true) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.6
        
        self.backgroundColor = hasBackground ? UIColor(hexString: "#b5651d") : .clear
        self.titleLabel?.font = .systemFont(ofSize: FontSize, weight: .medium)
        
        
        let tintColor: UIColor = tintColor ? .white : UIColor(hexString: "#b5651d")
        self.setTitleColor(tintColor, for: .normal)
        
        let borderColor: UIColor = borderColor ? .clear : UIColor(hexString: "#b5651d")
        self.layer.borderColor = borderColor.cgColor
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



