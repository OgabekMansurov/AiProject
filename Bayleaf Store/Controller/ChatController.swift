//
//  ChatController.swift
//  AI Project
//
//  Created by Ogabek Mansurov on 6/22/23.
//

import UIKit

class ChatController: UIViewController {
    
    
    private let sendIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "send")
        return img
    }()
    
    
    private let textField: UITextField = {
        let text = UITextField()
        text.backgroundColor = UIColor(hexString: "a0a0a0")
        text.layer.cornerRadius = 10
        text.textColor = .white
        text.layer.borderWidth = 0
        text.returnKeyType = .done
        text.autocorrectionType = .no
        text.autocapitalizationType = .none
        text.leftViewMode = .always
        text.placeholder = "Write a new message"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: text.frame.size.height))
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        
        UINavigationBar.appearance().tintColor = UIColor.white //your desired color here
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.left.2.fill"), style: .done, target: .none, action: .none), UIBarButtonItem(title: "Categories", style: .done, target: .none, action: .none)]
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(textField)
        view.addSubview(sendIcon)
        
        sendIcon.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            textField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -6),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            textField.heightAnchor.constraint(equalToConstant: 55),
            textField.widthAnchor.constraint(equalToConstant: view.frame.size.width - view.frame.size.width/4 ),
            
            sendIcon.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -6),
            sendIcon.heightAnchor.constraint(equalToConstant: 55),
            sendIcon.widthAnchor.constraint(equalToConstant: 55),
            sendIcon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
    
        
        ])
    }
    
    
}
