//
//  ExpenditureViewController.swift
//  PageMenuTest2
//
//  Created by Emyl Khairuddin on 12/07/2018.
//  Copyright © 2018 Emyl Khairuddin. All rights reserved.
//

import UIKit
import PageMenu

class ExpenditureViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var NotificationButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet var PropertyGroup: [UIButton]!
    @IBOutlet weak var SelectPropertyButton: UIButton!
    
    var controllerArray : [UIViewController] = []
    
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//    override func viewDidAppear(_ animated: Bool) {
//
//        super.viewDidAppear(animated)
        SelectPropertyButton.layer.cornerRadius = 10
        SelectPropertyButton.clipsToBounds = true
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "CP-logo")
        imageView.image = image
        self.navigationItem.titleView = imageView
        self.navigationItem.title = "主页"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 237/255, blue: 0/255, alpha: 1.0)
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        
//        //btnRight and BtnLeft
//        let btnNotification = UIButton(frame: CGRect(x: 0,y: 0,width: 30,height: 30))
//        btnNotification.addTarget(self, action: #selector(ExpenditureViewController.btnNotificationTapped(_:)), for: .touchUpInside)
//        btnNotification.setImage(UIImage(named: "Alarm"), for: UIControlState())
////        btnNotification.setBackgroundImage(UIImage(named: "Alarm"), for: UIControlState())
//        let rightButton = UIBarButtonItem(customView: btnNotification)
//        self.navigationItem.setRightBarButton(rightButton, animated: true)
//
//        let btnBack = UIButton(frame: CGRect(x: 0,y: 0,width: 30,height: 30))
//        btnBack.addTarget(self, action: #selector(ExpenditureViewController.btnBackTapped(_:)), for: .touchUpInside)
//        btnBack.setImage(UIImage(named: "Back"), for: UIControlState())
////         btnBack.setBackgroundImage(UIImage(named: "Back"), for: UIControlState())
//        let leftButton = UIBarButtonItem(customView: btnBack)
//        self.navigationItem.setLeftBarButton(leftButton, animated: true)
//
//        self.navigationItem.setLeftBarButton(leftButton, animated: true)
//
//        let ImageNotification = UIImageView(image: #imageLiteral(resourceName: "Alarm"))
        let ImageNotification = UIButton(type: .system)
        ImageNotification.setImage(#imageLiteral(resourceName: "Back").withRenderingMode(.alwaysOriginal), for: .normal)
        ImageNotification.frame = CGRect(x: 0, y: 0, width:30, height: 30)
        ImageNotification.contentMode = .scaleAspectFit
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: ImageNotification)
        ImageNotification.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        ImageNotification.heightAnchor.constraint(equalToConstant: 32.0).isActive = true

//        navigationItem.title = ImageNotification

        let BackButton = UIButton(type: .system)
        BackButton.setImage(#imageLiteral(resourceName: "Back").withRenderingMode(.alwaysOriginal), for: .normal)
        BackButton.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
        BackButton.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: BackButton)
        BackButton.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        BackButton.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
       
        
        
        
//        let moreButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
//        moreButton.setBackgroundImage(UIImage(named: "ic_more_vert_3"), for: .normal)
//        moreButton.addTarget(self, action: #selector(TableViewController.handleMore), for: .touchUpInside)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: moreButton)
        
        
        let ReadtoWinCategoryArray : Array = ["EXPENDITURE", "DETAILS"]
        var controllerArray : [UIViewController] = []
        
        
        for i in 0 ..< ReadtoWinCategoryArray.count{
            if i == 0{
                var watchResult : PrizeListViewController
                watchResult = PrizeListViewController()
                watchResult.title = ReadtoWinCategoryArray[i]
                controllerArray.append(watchResult)
            }
            else if i == 1{
                var watchResult : PrizeListViewController
                watchResult = PrizeListViewController()
                watchResult.title = ReadtoWinCategoryArray[i]
                controllerArray.append(watchResult)
            }
      
            //            else {
            //                var watchChina : WatchChinaTableViewController
            //
            //                watchChina = WatchChinaTableViewController(tbString: tableString, chnString: channelString, chnTitle: ReadtoWinCategoryArray[i])
            //
            //                watchChina.title = ReadtoWinCategoryArray[i]
            //                controllerArray.append(watchChina)
            //            }
        }
        
        var menuFontSize : CGFloat = 0
        var menuHeight : CGFloat = 0
        var menuWidth : CGFloat = 0
        let screenWidth = UIScreen.main.bounds.size.width
        
        if UIDevice.current.model == "iPhone" {
            menuFontSize = 16
            menuHeight = 40
            menuWidth = screenWidth / CGFloat(ReadtoWinCategoryArray.count)
        } else {
            menuFontSize = 20
            menuHeight = 60
            menuWidth = screenWidth / CGFloat(ReadtoWinCategoryArray.count)
        }
        //        UIColor(red: 254/255, green: 247/255, blue: 223/255, alpha: 1)
        //        UIColor(red: 242/255, green: 236/255, blue: 166/255, alpha: 1)
        
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor(red: 254.0/255.0, green: 247.0/255.0, blue: 223.0/255.0, alpha: 1.0)),
            .viewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.0)),
            .selectionIndicatorColor(UIColor.black),
            .selectedMenuItemLabelColor(UIColor.black),
            .unselectedMenuItemLabelColor(UIColor.black),
            .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 0.2)),
            .selectionIndicatorHeight(3.5),
            .menuItemFont(UIFont.boldSystemFont(ofSize: menuFontSize)),
            .menuHeight(menuHeight),
            .menuItemWidth(menuWidth)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)

        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(red: 133.0/255.0, green: 43.0/255.0, blue: 144.0/255.0, alpha: 1.0).cgColor, UIColor(red: 0.0/255.0, green: 176.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor]
        gradient.startPoint = CGPoint(x:0.00, y: 0.00)
        gradient.endPoint = CGPoint(x: 1.00, y: 1.00)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: screenWidth, height: menuHeight)
        
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        print("HomeView - ViewDidLoad 10")
        
        self.addChildViewController(pageMenu!)
        pageMenu!.view.layer.insertSublayer(gradient, at: 1)
        self.view.addSubview(pageMenu!.view)
        pageMenu!.didMove(toParentViewController: self)
    }

    func didTapGoToLeft() {
        let currentIndex = pageMenu!.currentPageIndex
        
        if currentIndex > 0 {
            pageMenu!.moveToPage(currentIndex - 1)
        }
    }
    
    func didTapGoToRight() {
        let currentIndex = pageMenu!.currentPageIndex
        
        if currentIndex < controllerArray.count {
            pageMenu!.moveToPage(currentIndex + 1)
        }
    }
    
    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleSelection(_ sender: UIButton) {
        PropertyGroup.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
            
        }
        
    }
    
    enum properties: String {
        case A = "Property A"
        case B = "Property B"
        case C = "Property C"
        case D = "Property D"
        case E = "Property E"
    }
    
    @IBAction func propertyTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let property = properties(rawValue: title)
            else {
                return
        }
        
        switch property {
        case .A:
            print ("Mutiara")
        case .B:
            print ("Phileo")
        case .C:
            print ("Utama")
        case .D:
            print ("Curve")
        case .E:
            print ("Giza")
        default:
            print ("Mutiara")
        }
    }
    
    
    func btnNotificationTapped(_ sender: AnyObject) {
        let shareText = "Notification Button"
        let shareLink = "http://www.myes.my"
        
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [shareText,shareLink], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 15, y: 40, width: 0, height: 0)
        activityViewController.excludedActivityTypes = [
            UIActivityType.print,
            UIActivityType.assignToContact,
            UIActivityType.saveToCameraRoll,
            UIActivityType.addToReadingList,
        ]
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    func btnBackTapped(_ sender: AnyObject) {
        let shareText = "Back Button"
        let shareLink = "http://www.myes.my"
        
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [shareText,shareLink], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 15, y: 40, width: 0, height: 0)
        activityViewController.excludedActivityTypes = [
            UIActivityType.print,
            UIActivityType.assignToContact,
            UIActivityType.saveToCameraRoll,
            UIActivityType.addToReadingList,
        ]
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
