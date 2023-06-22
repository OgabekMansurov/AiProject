//
//  CustomLabel.swift
//
//  Created by Ogabek Mansurov on 6/22/23.
//

import UIKit

class CustomLabel: UILabel {
    
    
    init(title: String, hasbackground: Bool = false, fontsize: CGFloat, fontType: UIFont.Weight, textColor: UIColor, textAligmentTrue: Bool = true, cornerRadius: Bool = true) {
        super.init(frame: .zero)
        self.text = title
        self.textAlignment = textAligmentTrue ? .center : .left
        self.layer.cornerRadius = cornerRadius ? 10 : 0
        self.backgroundColor = hasbackground ? UIColor(hexString: "b5651d") : .clear
        self.textColor = textColor
        self.font = .systemFont(ofSize: fontsize, weight: fontType)
        self.clipsToBounds = true

         
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
