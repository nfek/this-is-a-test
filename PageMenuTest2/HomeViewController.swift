//
//  HomeViewController.swift
//  PageMenuTest2
//
//  Created by Emyl Khairuddin on 19/07/2018.
//  Copyright © 2018 Emyl Khairuddin. All rights reserved.
//


// added for second commit
// added for version control testing
// testing upload on development branch


import UIKit
import Foundation
import PageMenu

class HomeViewController: UIViewController, UIWebViewDelegate{
  
    var pageMenu : CAPSPageMenu!
    var controllerArray : [UIViewController] = []

//    override func viewDidLoad() {
//        super.viewDidLoad()
    
    override func viewDidAppear(_ animated: Bool) {
    
        super.viewDidAppear(animated)

        //middle logo - not working due to overstrecthed right and left buttons
        print("HomeView - ViewDidLoad 4")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "Down")
        imageView.image = image
        self.navigationItem.titleView = imageView
//        self.navigationItem.title = "Select Property"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        //NavBar
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.navBarTapped(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(recognizer)
        //End NavBar
        
        
        //btnRight and BtnLeft
        let btnNotification = UIButton(frame: CGRect(x:0, y: 0,width: 30,height: 30))
        btnNotification.addTarget(self, action: #selector(HomeViewController.btnNotificationTapped(_:)), for: .touchUpInside)
        btnNotification.setImage(UIImage(named: "Alarm"), for: UIControlState())
        
        //to fix the barbuttonitem size issue
        btnNotification.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        btnNotification.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        
        
        let rightButton = UIBarButtonItem(customView: btnNotification)
        self.navigationItem.setRightBarButton(rightButton, animated: true)
        
        

        let btnBack = UIButton(frame: CGRect(x: 0,y: 0,width: 30,height: 30))
        btnBack.addTarget(self, action: #selector(HomeViewController.btnBackTapped(_:)), for: .touchUpInside)
        btnBack.setImage(UIImage(named: "Back"), for: UIControlState())
        
        //to fix the barbuttonitem size issue
        btnBack.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        btnBack.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        
        
        let leftButton = UIBarButtonItem(customView: btnBack)
        self.navigationItem.setLeftBarButton(leftButton, animated: true)

        //PageMenu settings
        var controllerArray : [UIViewController] = []
        let ReadtoWinCategoryArray : Array = ["EXPENDITURE", "DETAILS"]
   
        for i in 0 ..< ReadtoWinCategoryArray.count{
            if i == 0{
                var watchResult : MovieTableViewController
                watchResult = MovieTableViewController()
                watchResult.title = ReadtoWinCategoryArray[i]
                controllerArray.append(watchResult)
            }
            else if i == 1{
                var watchResult : ExpensesViewController
                watchResult = ExpensesViewController()
                watchResult.title = ReadtoWinCategoryArray[i]
                controllerArray.append(watchResult)
            }
        }
        //PageMenu options
  
        var menuFontSize : CGFloat = 0
        var menuHeight : CGFloat = 0
        var menuWidth : CGFloat = 0
        let screenWidth = UIScreen.main.bounds.size.width
        
        if UIDevice.current.model == "iPhone" {
            menuFontSize = 16
            menuHeight = 50
            menuWidth = screenWidth / CGFloat(ReadtoWinCategoryArray.count)
            menuWidth = menuWidth - 20
        } else {
            menuFontSize = 20
            menuHeight = 60
            menuWidth = screenWidth / CGFloat(ReadtoWinCategoryArray.count)
            menuWidth = menuWidth - 20
        }
        print("HomeView - ViewDidLoad 8")

        print("HomeView - ViewDidLoad 9")
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)),
            .viewBackgroundColor(UIColor.black),
            .selectionIndicatorColor(UIColor(red: 0.0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)),
            .selectedMenuItemLabelColor(UIColor.black),
            .unselectedMenuItemLabelColor(UIColor.gray),
            .bottomMenuHairlineColor(UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)),
            .selectionIndicatorHeight(3.5),
            .menuItemFont(UIFont.boldSystemFont(ofSize: menuFontSize)),
            .menuHeight(menuHeight),
            .menuItemWidth(menuWidth),
            .centerMenuItems(true)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        print("HomeView - ViewDidLoad 10")
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        pageMenu!.didMove(toParentViewController: self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
//    @IBOutlet var tableViewHeight: NSLayoutConstraint!
//    @IBOutlet var tableViewYAlignment: NSLayoutConstraint!
//    var allWatchlists:NSMutableArray = []
//    var animating: Bool = false
//    var dropDownViewIsDisplayed: Bool = false
    
    
    //Navbar
    func navBarTapped(_ theObject: AnyObject){
        
        print("Hey there")
//        performSegue(withIdentifier: "unwindtoHomeVC", sender: self)
//        if (self.dropDownViewIsDisplayed) {
//            self.hideDropDownView()
//        } else {
//            GetNewListAPI.sharedInstance().getPortfolioList{
//                response, error in
//
//                if error == nil && response != nil{
//                    var responses = response as! NSArray
//                    var name = "name"
//                    self.allWatchlists = []
//                    for item in responses{
//                        var listName = item[name] as! String
//                        self.allWatchlists.addObject(listName)
//                    }
//
//                    //DROPDOWN - you can just use this portion
//                    let height:CGFloat = CGFloat(self.allWatchlists.count) *  self.rowHeight  //count tableView frame height dynamically
//                    self.tableViewHeight.constant = height
//                    self.tableViewYAlignment.constant = 0 //hide under navBarView
//                    self.dropDownView.frame.size.height = height
//                    self.dropDownView.reloadData()
//                    self.showDropDownView()
//                }
//            }
//        }
        
    }
    //End Navbar
    
   
   
    
//    func hideDropDownView() {
//        let yAlign: CGFloat = 0.0 //hide the dropdownview bottom view exactly same as navbarview
//        self.animateDropDownToFrame(yCoordinate: yAlign) {
//            self.dropDownViewIsDisplayed = false
//        }
//    }
//
//    func showDropDownView() {
//        //+ 10 means push the dropdownview above navbarview
//        //- 10 means push the dropdownview below navbarview - in this case we want neg value of dropdownview height
//        let yAlign: CGFloat = self.tableViewYAlignment.constant - self.tableViewHeight.constant
//        self.animateDropDownToFrame(yCoordinate: yAlign) {
//            self.dropDownViewIsDisplayed = true
//        }
//    }
//
//    func animateDropDownToFrame(yCoordinate: CGFloat, completion:@escaping () -> Void) {
//        if (!self.animating) {
//            self.animating = true
//
//            //Here is the magic happenned! Core Animation - it will animate from the item original state to the state you wished to become
//            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//                self.tableViewYAlignment.constant = yCoordinate //we change the position of the dropdownview
//                self.view.layoutIfNeeded() //essential for animation carry out if not view changes abruptly
//            }, completion: { (completed: Bool) -> Void in
//                self.animating = false
//                if (completed) {
//                    completion()
//                }
//            })
//        }
//    }
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return allWatchlists.count
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableView", for: indexPath as IndexPath)
//        cell.backgroundColor = UIColor.clear
//        cell.textLabel!.text = allWatchlists[indexPath.row] as? String
//        return cell
//    }

}
