//
//  ViewController.swift
//  Bayleaf Store
//
//  Created by Martina on 01/01/22.
//

//
//  ViewController.swift
//  Bayleaf Store
//
//  Created by Martina on 01/01/22.
//

import UIKit
import StoreKit

class ViewController: UIViewController {
        
    enum MenuState {
        case opened
        case closed
    }
    
    var animate: Bool = false
    
    private var menuState: MenuState = .closed
    
    private let chatGPTNameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(hexString: "#b5651d").cgColor
        view.layer.borderWidth = 1.5
        return view
    }()

    let unlimitedButton: UIButton = {
       let button = UIButton()
        button.setTitle(" ♛ Unlimited Access", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(hexString: "#b5651d")
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(ciColor: .white).cgColor
        button.layer.shadowColor = UIColor(hexString: "#b5651d").cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 15
        button.layer.shadowOpacity = 0.4
        button.layer.shadowPath = nil
        return button
    }()
    
    lazy var segmented: UISegmentedControl = {
       let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        segment.selectedSegmentTintColor = UIColor(hexString: "#b5651d")
        segment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segment.setTitleTextAttributes([.foregroundColor: UIColor(hexString: "#b5651d")], for: .normal)
        segment.tintColor = .green
        segment.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        return segment
    }()
    
    
    let haptic = UISelectionFeedbackGenerator()
    let items = ["ENG", "RUS", "UZB"]
    
    
    private let imgView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "openAI")
        return image
    }()
    
    private let backgrountNameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(hexString: "#b5651d").cgColor
        view.layer.borderWidth = 1.5
        return view
    }()
    
    private let textView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(hexString: "#b5651d").cgColor
        view.layer.borderWidth = 1.5
        return view
    }()
    
    private let backgrountCurcleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(hexString: "#b5651d").cgColor
        view.layer.borderWidth = 1.5
        return view
    }()
    
    private let titleLabel = CustomLabel(title: "Ai Technology", fontsize: 28, fontType: .bold, textColor: UIColor(hexString: "#b5651d"))
    private let gptLabel = CustomLabel(title: "Chat GPT", fontsize: 28, fontType: .bold, textColor: UIColor(hexString: "#b5651d"))
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var viewBG: UIImageView!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var menuTableView: UITableView!
    
    let screen = UIScreen.main.bounds
    var menu = false
    var home = CGAffineTransform()
    var options: [option] = [
        
         option(title: "  New Chat", segue: "HomeSegue"),
         option(title: "  See all history", segue: "HomeSegue"),
         option(title: "",segue: ""),
         option(title: "  Clear Conversation", segue: "SettingsSegue"),
         option(title: "  Rate us", segue: "ProfileSegue"),
         option(title: "  Share App", segue: "TermsSegue"),
         option(title: "",segue: ""),
         option(title: "  Privacy Policy", segue: "PrivacySegue"),
         option(title: "  Terms of Service", segue: "PrivacySegue"),
         option(title: "",segue: ""),
        
    ]
    
    struct option {
        var title = String()
        var segue = String()
    }
    
    
    private var heightConstraint = NSLayoutConstraint()
    private var widthConstraint = NSLayoutConstraint()
    private var backgrountCurcleViewTrailingConstraint = NSLayoutConstraint()
    private var backgrountCurcleViewTopConstraint = NSLayoutConstraint()
    private var backgrountNameViewTopConstraint = NSLayoutConstraint()
    private var chatGPTNameViewTrailingConstraint = NSLayoutConstraint()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: true)
        extractedFunc()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            if animate == false {
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        if  animate == false {            
            UIView.animate(withDuration: 1.5) {
                self.titleLabel.alpha = 1
                self.backgrountNameView.alpha = 1
                self.backgrountNameViewTopConstraint.constant -= 60
                self.backgrountCurcleViewTopConstraint.constant += self.viewBG.frame.size.width/2
                self.backgrountCurcleViewTrailingConstraint.constant -= self.viewBG.frame.size.width/3
                self.chatGPTNameViewTrailingConstraint.constant += self.viewBG.frame.size.width
                self.textView.alpha = 1
                self.heightConstraint.constant = self.viewBG.frame.size.height/3 - 20
                self.widthConstraint.constant = self.viewBG.frame.size.width * 0.8
                self.view.layoutIfNeeded()
            }
            UIView.transition(with: self.unlimitedButton, duration: 2.5, options: [.repeat, .curveEaseOut]) {
            } completion: { (_) in
                self.animate = true
            }
        }
    }
        
    
    func showMenu() {
        self.containerView.layer.cornerRadius = 40
        self.viewBG.layer.cornerRadius = self.containerView.layer.cornerRadius
        let x = screen.width * 0.8
        let originalTransform = self.containerView.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
            let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
            UIView.animate(withDuration: 0.7, animations: {
                self.containerView.transform = scaledAndTranslatedTransform
            })
    }
    
    func hideMenu() {
        menu = false
            UIView.animate(withDuration: 0.7, animations: {
                self.containerView.transform = self.home
                self.containerView.layer.cornerRadius = 0
                self.viewBG.layer.cornerRadius = 0
            })
        
    }
    
    
    @IBAction func showMenu(_ sender: UISwipeGestureRecognizer) {
        
        print("menu interaction")
        if menu == false && swipeGesture.direction == .right {
            
            print("user is showing menu")
            
            showMenu()
            menuTableView.reloadData()
            
            menu = true
                        
        }
        
    }
    @objc func colorChanged() {
        haptic.selectionChanged()
        switch segmented.selectedSegmentIndex{
        case 0 : print("1")
        case 1 : print("2")
        case 3 : print("3")
            
        default : print("defauld")
        }
    }
    
    
    @IBAction func hideMenu(_ sender: Any) {
        
        if menu == true {
            
            print("user is hiding menu")
            
            hideMenu()
            
        }
    }
    
    fileprivate func extractedFunc() {
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = .clear
        menuTableView.separatorStyle = .none
        home = self.containerView.transform
        
        backgrountNameView.roundCorners([.topRight, .bottomRight], radius: 20)
        backgrountCurcleView.roundCorners([.topRight, .bottomRight, .topLeft, .bottomLeft], radius: 30)
        chatGPTNameView.roundCorners([.topRight, .bottomRight, .topLeft, .bottomLeft], radius: 10)
        textView.roundCorners([.topRight, .bottomRight, .topLeft, .bottomLeft], radius: 22)
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width/4))
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width/4))
        footerView.backgroundColor = .clear
        headerView.backgroundColor = .clear
         
        menuTableView.tableHeaderView = headerView
        menuTableView.tableFooterView = footerView
        menuTableView.addSubview(segmented)
        viewBG.addSubview(backgrountNameView)
        backgrountNameView.addSubview(titleLabel)
        viewBG.addSubview(backgrountCurcleView)
        viewBG.addSubview(chatGPTNameView)
        chatGPTNameView.addSubview(gptLabel)
        viewBG.addSubview(textView)
        
        
        backgrountCurcleView.addSubview(imgView)
        headerView.addSubview(unlimitedButton)
        
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        segmented.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        unlimitedButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        chatGPTNameView.translatesAutoresizingMaskIntoConstraints = false
        gptLabel.translatesAutoresizingMaskIntoConstraints = false
        
        heightConstraint = textView.heightAnchor.constraint(equalToConstant: 0)
        widthConstraint = textView.widthAnchor.constraint(equalToConstant: 0)
        
        backgrountCurcleViewTrailingConstraint = backgrountCurcleView.rightAnchor.constraint(equalTo: viewBG.rightAnchor, constant: viewBG.frame.size.width/4)
        backgrountCurcleViewTopConstraint = backgrountCurcleView.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: -viewBG.frame.size.width/4)
        
        backgrountCurcleViewTopConstraint = backgrountCurcleView.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: -viewBG.frame.size.width/4)
        
        backgrountNameViewTopConstraint = backgrountNameView.topAnchor.constraint(equalTo: viewBG.safeAreaLayoutGuide.topAnchor, constant: 50)
        
        chatGPTNameViewTrailingConstraint = chatGPTNameView.rightAnchor.constraint(equalTo: backgrountNameView.leftAnchor, constant: -viewBG.frame.size.width/2)
        
        NSLayoutConstraint.activate([
            
            backgrountNameViewTopConstraint,
            backgrountNameView.leadingAnchor.constraint(equalTo: viewBG.safeAreaLayoutGuide.leadingAnchor),
            backgrountNameView.heightAnchor.constraint(equalToConstant: 60),
            
            backgrountCurcleViewTrailingConstraint,
            backgrountCurcleView.heightAnchor.constraint(equalToConstant: viewBG.frame.size.width/4),
            backgrountCurcleView.widthAnchor.constraint(equalToConstant: viewBG.frame.size.width/4),
            backgrountCurcleViewTopConstraint,
            
            imgView.topAnchor.constraint(equalTo: backgrountCurcleView.topAnchor, constant: 9),
            imgView.leftAnchor.constraint(equalTo: backgrountCurcleView.leftAnchor, constant: 9),
            imgView.rightAnchor.constraint(equalTo: backgrountCurcleView.rightAnchor, constant: -9),
            imgView.bottomAnchor.constraint(equalTo: backgrountCurcleView.bottomAnchor, constant: -9),
            
            titleLabel.topAnchor.constraint(equalTo: backgrountNameView.topAnchor, constant: 3),
            titleLabel.leftAnchor.constraint(equalTo: backgrountNameView.leftAnchor, constant: 13),
            titleLabel.rightAnchor.constraint(equalTo: backgrountNameView.rightAnchor, constant: -13),
            titleLabel.bottomAnchor.constraint(equalTo: backgrountNameView.bottomAnchor, constant: -3),
            
            unlimitedButton.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 15),
            unlimitedButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            unlimitedButton.widthAnchor.constraint(equalToConstant: headerView.frame.size.width * 2/3),
            unlimitedButton.heightAnchor.constraint(equalToConstant: 55),
            
            segmented.leftAnchor.constraint(equalTo: footerView.leftAnchor, constant: 15),
            segmented.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            segmented.widthAnchor.constraint(equalToConstant: footerView.frame.size.width * 2/3),
            
            chatGPTNameView.topAnchor.constraint(equalTo: backgrountNameView.bottomAnchor, constant: 20),
            chatGPTNameViewTrailingConstraint,
            chatGPTNameView.heightAnchor.constraint(equalToConstant: 45),
            
            gptLabel.centerYAnchor.constraint(equalTo: chatGPTNameView.centerYAnchor),
            gptLabel.leftAnchor.constraint(equalTo: chatGPTNameView.leftAnchor, constant: 45),
            gptLabel.rightAnchor.constraint(equalTo: chatGPTNameView.rightAnchor, constant: -45),
            
            
            heightConstraint,
            widthConstraint,
            textView.centerXAnchor.constraint(equalTo: viewBG.centerXAnchor),
            textView.bottomAnchor.constraint(equalTo: viewBG.bottomAnchor, constant: -viewBG.frame.size.height/3*0.5),
        ])
    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return options.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
        cell.descriptionLabel.text = options[indexPath.row].title
        cell.descriptionLabel.textColor = UIColor(hexString: "#b5651d")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let currentCell = (tableView.cellForRow(at: indexPath) ?? UITableViewCell()) as UITableViewCell
            currentCell.alpha = 0.5
            UIView.animate(withDuration: 1, animations: {
                currentCell.alpha = 1
            })
            
            switch indexPath.row {
                
            case 0 :
                let vc = ChatController()
                self.navigationController?.pushViewController(vc, animated: true)
            case 4 :
                SKStoreReviewController.requestReview()
                hideMenu()
            case 5 :
                if let name = URL(string: "https://itunes.apple.com/us/app/myapp/idxxxxxxxx?ls=1&mt=8"), !name.absoluteString.isEmpty {
                    let objectsToShare = [name]
                    let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                    self.present(activityVC, animated: true, completion: nil)
                } else {
                    // show alert for not available
                }
                hideMenu()
                
            case 6 :
                let vc = WebViewerController(with: "https://policies.google.com/terms?hl=en")
                self.present(vc, animated: true)
                hideMenu()
            default:
                let vc = NewChatController()
                self.navigationController?.pushViewController(vc, animated: true)
                hideMenu()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: 0, y: cell.contentView.frame.height)
        
        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                    cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
                    UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1,
                                   options: .curveEaseIn, animations: {
                                    cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
                    })
        })
        
    }
    
}


class tableViewCell: UITableViewCell {
    
    @IBOutlet var descriptionLabel: UILabel!
    
}

extension UIView {
    func roundCorners (_ corners: UIRectCorner, radius: CGFloat) {
        if #available (iOS 11, *) {
            
            var cornerMask = CACornerMask ()
            
            if(corners.contains ( .topLeft)){
                cornerMask.insert( .layerMinXMinYCorner)
            }
            if (corners.contains (.topRight)){
                cornerMask.insert (.layerMaxXMinYCorner)
            }
            if (corners.contains (.bottomLeft)){
                cornerMask.insert ( .layerMinXMaxYCorner)
            }
            if(corners.contains ( .bottomRight)){
                cornerMask.insert ( .layerMaxXMaxYCorner)
            }
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask
        } else {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
        
}

