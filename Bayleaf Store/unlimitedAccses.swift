//
//  unlimitedAccses.swift
//
//  Created by Ogabek Mansurov on 6/21/23.
//

import UIKit

class unlimitedAccses: UIViewController {
    
    let switchOnandof = UISwitch()
    var switchButtun: Bool = true
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Free Trial Enabled"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let enabledUi: UIView = {
       let ui = UIView()
        ui.backgroundColor = UIColor(hexString: "#b5651d")
        ui.layer.borderColor = UIColor.white.cgColor
        ui.layer.cornerRadius = 10
        ui.layer.borderWidth = 1
        return ui
    }()

    
    private let headerName = CustomLabel(title: "AI Project", fontsize: 35, fontType: .bold, textColor: UIColor.white)
    private let unlimitedLabel1 = CustomLabel(title: "UNLIMITED", hasbackground: true, fontsize: 33,  fontType: .regular,  textColor: UIColor.white)
    private let unlimitedLabel2 = CustomLabel(title: "ACCESS", hasbackground: false, fontsize: 26,  fontType: .regular,  textColor: UIColor.white)
    private let texlab1 = CustomLabel(title: "Powered by ChatGPT & GPT-4", fontsize: 15, fontType: .bold, textColor: .white, cornerRadius: false)
    private let texlab2 = CustomLabel(title: "More accurate and detailed answers.", fontsize: 12, fontType: .regular, textColor: .white, cornerRadius: false)
    private let texlab3 = CustomLabel(title: "Higher word limit", fontsize: 15, fontType: .bold, textColor: .white, cornerRadius: false)
    private let texlab4 = CustomLabel(title: "Type longer messages", fontsize: 12, fontType: .regular, textColor: .white, cornerRadius: false)
    private let texlab5 = CustomLabel(title: "No Limits", fontsize: 15, fontType: .bold, textColor: .white, cornerRadius: false)
    private let texlab6 = CustomLabel(title: "Have unlimited dialogues", fontsize: 12, fontType: .regular, textColor: .white, cornerRadius: false)
    private let texlab7 = CustomLabel(title: "No Ads", fontsize: 15, fontType: .bold, textColor: .white, cornerRadius: false)
    private let texlab8 = CustomLabel(title: "Enjoy AlChat without any ads", fontsize: 12, fontType: .regular, textColor: .white, cornerRadius: false)
    
    private let privacyButton = CustomButton(title: "Privacy / Terms", FontSize: 17 )
    private let restoreButton = CustomButton(title: "Restore", hasBackground: true, FontSize: 15 )
    private let nextButton = CustomButton(title: "Try For Free", hasBackground: true,  FontSize: 22)
    private let freeButton = CustomButton(title: "3 days free trial", hasBackground: true,  FontSize: 22, borderColor: false)
    private let billedButton = CustomButton(title: "Billed once", hasBackground: false,  FontSize: 22, tintColor: false, borderColor: false)
        
    private let uiviewImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "backImage")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        freeButton.addTarget(self, action: #selector(freeButtonDid), for: .touchUpInside)
        billedButton.addTarget(self, action: #selector(billedButtonDid), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonDid), for: .touchUpInside)
        restoreButton.addTarget(self, action: #selector(restoreButtonDid), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(privacyButtonDid), for: .touchUpInside)

        switchOnandof.setOn(false, animated: true)
        switchOnandof.addTarget(self, action: #selector(updateSwitch), for:.valueChanged)
        
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        UIView.animate(withDuration: 0.8, delay: 0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {

            self.nextButton.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)

        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.nextButton.layer.removeAllAnimations()
    }
   
    
    @objc func freeButtonDid() {
        freeButton.backgroundColor = .white
        freeButton.setTitleColor(UIColor(hexString: "#b5651d"), for: .normal)
        
        
        billedButton.backgroundColor = UIColor(hexString: "#b5651d")
        billedButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    @objc func billedButtonDid() {
        
        billedButton.backgroundColor = .white
        billedButton.setTitleColor(UIColor(hexString: "#b5651d"), for: .normal)
        
        
        freeButton.backgroundColor = UIColor(hexString: "#b5651d")
        freeButton.setTitleColor(UIColor.white, for: .normal)
    }
    @objc func updateSwitch() {
        
        if switchOnandof.isOn == false {
            self.billedButtonDid()
        }
        
    }
    @objc func nextButtonDid() {
        print("Next viewController")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "myId")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func restoreButtonDid() {
        print("restoreButtonDid")
    }
    @objc func privacyButtonDid() {
        print("privacyButtonDid")
    }
    func setupUI(){
        
        billedButton.layer.backgroundColor = UIColor.white.cgColor
        
        
        view.addSubview(uiviewImage)
        view.addSubview(headerName)
        view.addSubview(unlimitedLabel1)
        view.addSubview(unlimitedLabel2)
        view.addSubview(privacyButton)
        view.addSubview(restoreButton)
        view.addSubview(nextButton)
        view.addSubview(billedButton)
        view.addSubview(freeButton)
        view.addSubview(enabledUi)
        view.addSubview(textLabel)
        view.addSubview(switchOnandof)
        view.addSubview(texlab1)
        view.addSubview(texlab2)
        view.addSubview(texlab3)
        view.addSubview(texlab4)
        view.addSubview(texlab5)
        view.addSubview(texlab6)
        view.addSubview(texlab7)
        view.addSubview(texlab8)
        

        enabledUi.translatesAutoresizingMaskIntoConstraints = false
        uiviewImage.translatesAutoresizingMaskIntoConstraints = false
        headerName.translatesAutoresizingMaskIntoConstraints = false
        unlimitedLabel1.translatesAutoresizingMaskIntoConstraints = false
        unlimitedLabel2.translatesAutoresizingMaskIntoConstraints = false
        privacyButton.translatesAutoresizingMaskIntoConstraints  = false
        restoreButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        billedButton.translatesAutoresizingMaskIntoConstraints = false
        freeButton.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        switchOnandof.translatesAutoresizingMaskIntoConstraints = false
        
        texlab1.translatesAutoresizingMaskIntoConstraints = false
        texlab2.translatesAutoresizingMaskIntoConstraints = false
        texlab3.translatesAutoresizingMaskIntoConstraints = false
        texlab4.translatesAutoresizingMaskIntoConstraints = false
        texlab5.translatesAutoresizingMaskIntoConstraints = false
        texlab6.translatesAutoresizingMaskIntoConstraints = false
        texlab7.translatesAutoresizingMaskIntoConstraints = false
        texlab8.translatesAutoresizingMaskIntoConstraints = false
            
        uiviewImage.frame = view.bounds
        
        NSLayoutConstraint.activate([
            
            
            headerName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            headerName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            unlimitedLabel1.topAnchor.constraint(equalTo: headerName.bottomAnchor, constant: 15),
            unlimitedLabel1.centerXAnchor.constraint(equalTo: headerName.leftAnchor, constant: 15),
            unlimitedLabel1.heightAnchor.constraint(equalToConstant: 35),
            unlimitedLabel1.widthAnchor.constraint(equalToConstant: 185),
            
            unlimitedLabel2.topAnchor.constraint(equalTo: unlimitedLabel1.bottomAnchor, constant: 5),
            unlimitedLabel2.centerXAnchor.constraint(equalTo: unlimitedLabel1.rightAnchor, constant: 15),

            privacyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            privacyButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            restoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            restoreButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            restoreButton.widthAnchor.constraint(equalToConstant: 90),
            
            nextButton.bottomAnchor.constraint(equalTo: privacyButton.topAnchor, constant: -20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            nextButton.heightAnchor.constraint(equalToConstant: 55 ),
            
            billedButton.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30),
            billedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            billedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            billedButton.heightAnchor.constraint(equalToConstant: 65 ),
            
            freeButton.bottomAnchor.constraint(equalTo: billedButton.topAnchor, constant: -10),
            freeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            freeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            freeButton.heightAnchor.constraint(equalToConstant: 65 ),
            
            enabledUi.bottomAnchor.constraint(equalTo: freeButton.topAnchor, constant: -10),
            enabledUi.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enabledUi.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            enabledUi.heightAnchor.constraint(equalToConstant: 50 ),
            
            textLabel.centerYAnchor.constraint(equalTo: enabledUi.centerYAnchor),
            textLabel.leftAnchor.constraint(equalTo: enabledUi.leftAnchor, constant: 15),
            
            switchOnandof.centerYAnchor.constraint(equalTo: enabledUi.centerYAnchor),
            switchOnandof.rightAnchor.constraint(equalTo: enabledUi.rightAnchor, constant: -15),
            
            texlab1.topAnchor.constraint(equalTo: unlimitedLabel2.bottomAnchor, constant: 10),
            texlab1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            texlab2.topAnchor.constraint(equalTo: texlab1.bottomAnchor, constant: 7),
            texlab2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            texlab3.topAnchor.constraint(equalTo: texlab2.bottomAnchor, constant: 7),
            texlab3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            texlab4.topAnchor.constraint(equalTo: texlab3.bottomAnchor, constant: 7),
            texlab4.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            texlab5.topAnchor.constraint(equalTo: texlab4.bottomAnchor, constant: 7),
            texlab5.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            texlab6.topAnchor.constraint(equalTo: texlab5.bottomAnchor, constant: 7),
            texlab6.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            texlab7.topAnchor.constraint(equalTo: texlab6.bottomAnchor, constant: 7),
            texlab7.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            texlab8.topAnchor.constraint(equalTo: texlab7.bottomAnchor, constant: 7),
            texlab8.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        ])
    }
    
}
