//
//  PrizeListViewController.swift
//  ChinaPress
//
//  Created by AppAsia Tech on 13/11/2017.
//  Copyright © 2017 EmylKhairuddin. All rights reserved.
//
//  added for RTW2017


import UIKit

class PrizeListViewController: UIViewController, UIWebViewDelegate{

    
    //    var urlString : String = "http://www.chinapress.com.my/prizes/"
    var urlString : String = "http:/google.com/"
    
    var webView: UIWebView!
    var refresher: UIRefreshControl = UIRefreshControl()
    var firstLoad : Bool = false
//    var pageMenu : CAPSPageMenu!
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = UIWebView()
        webView.frame = self.view.bounds
        webView.scalesPageToFit = true
        
//        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
//        customView.backgroundColor = UIColor.red
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
//        button.setTitle("Terms and Conditions & FAQ", for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        customView.center = CGPoint(x: webView.frame.size.width/2, y: webView.frame.size.height - 250)
//        customView.addSubview(button)
        
//        webView.addSubview(customView)
        self.view.addSubview(webView)
    
        
        let resultURL = URL(string: urlString)
        let resultURLRequest = URLRequest(url: resultURL!)
        webView.loadRequest(resultURLRequest)
        
//        webView.register(UINib(nibName: "ReadToWinController", bundle: nil), forHeaderFooterViewReuseIdentifier: "CustomHeader")
        
        

     
        
        self.refresher.endRefreshing()
//        ProgressHUD.sharedInstance.hide()
        
        //pull to refresh
        //        refresher = UIRefreshControl()
        //        refresher.attributedTitle = NSAttributedString(string: "下拉立即刷新")
        //        refresher.addTarget(self, action: #selector(PrizeListViewController.loadData), for: UIControlEvents.valueChanged)
        //        webView.scrollView.addSubview(refresher)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadData() {
//        if(!NetworkService.getConnection()) {   // connection issue, alert user
//            let alertController = UIAlertController(title: NetworkService.msgTitle, message: NetworkService.msgContent, preferredStyle: .alert)
//            
//            // Create the actions
//            let okAction = UIAlertAction(title: NetworkService.btnTitle, style: UIAlertActionStyle.default) {
//                UIAlertAction in
//                self.refresher.endRefreshing()
//                ProgressHUD.sharedInstance.hide()
//                
//            }
//            
//            // Add the actions
//            alertController.addAction(okAction)
//            
//            // Present the controller
//            DispatchQueue.main.async(execute: {
//                self.present(alertController, animated: true, completion: nil)
//            })
//        }
        
        // refresh web view
        self.webView.reload()
        self.refresher.endRefreshing()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "FAQViewController" {
//            let viewController = segue.destination as! FAQViewController
////            viewController.strTitle = sendTitle
////            viewController.strDate = sendDate
//        }
//    }
//    func buttonAction(_ sender: UIButton!) {
//        print("Button tapped")
//        
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "FAQViewController") as! FAQViewController
//        self.navigationController?.pushViewController(vc, animated: true)
//        
//
//        
////        let ReadtoWinCategoryArray : Array = ["Terms & Conditions"]
////        var controllerArray : [UIViewController] = []
////        
////        //4th tab - leaderboard
////        //        private static final String URL_GET_LATEST_WINNER = "http://139.162.40.214/api/v2/cpwinning/_table/total_point_tbl?";
////        
////        //2nd tab - last month record / monthly record
////        //        private static final String URL_GET_MONTHLY_WINNER = "http://139.162.40.214/api/v2/cpwinning/_table/monthly_point_tbl?";
////        
////        for i in 0 ..< ReadtoWinCategoryArray.count{
////            if i == 0{
////                var watchResult : FAQViewController
////                watchResult = FAQViewController()
////                watchResult.title = ReadtoWinCategoryArray[i]
////                controllerArray.append(watchResult)
////            }
////            //            else {
////            //                var watchChina : WatchChinaTableViewController
////            //
////            //                watchChina = WatchChinaTableViewController(tbString: tableString, chnString: channelString, chnTitle: ReadtoWinCategoryArray[i])
////            //
////            //                watchChina.title = ReadtoWinCategoryArray[i]
////            //                controllerArray.append(watchChina)
////            //            }
////        }
////        
////        var menuFontSize : CGFloat = 0
////        var menuHeight : CGFloat = 0
////        var menuWidth : CGFloat = 0
////        let screenWidth = UIScreen.main.bounds.size.width
////        
////        if UIDevice.current.model == "iPhone" {
////            menuFontSize = 16
////            menuHeight = 40
////            menuWidth = screenWidth / CGFloat(ReadtoWinCategoryArray.count)
////        } else {
////            menuFontSize = 20
////            menuHeight = 60
////            menuWidth = screenWidth / CGFloat(ReadtoWinCategoryArray.count)
////        }
////        //        UIColor(red: 254/255, green: 247/255, blue: 223/255, alpha: 1)
////        //        UIColor(red: 242/255, green: 236/255, blue: 166/255, alpha: 1)
////        
////        let parameters: [CAPSPageMenuOption] = [
////            .scrollMenuBackgroundColor(UIColor(red: 254.0/255.0, green: 247.0/255.0, blue: 223.0/255.0, alpha: 1.0)),
////            .viewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.0)),
////            .selectionIndicatorColor(UIColor.black),
////            .selectedMenuItemLabelColor(UIColor.black),
////            .unselectedMenuItemLabelColor(UIColor.black),
////            .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 0.2)),
////            .selectionIndicatorHeight(3.5),
////            .menuItemFont(UIFont.boldSystemFont(ofSize: menuFontSize)),
////            .menuHeight(menuHeight),
////            .menuItemWidth(menuWidth)
////        ]
////        
////        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
////        
////        let gradient = CAGradientLayer()
////        gradient.colors = [UIColor(red: 133.0/255.0, green: 43.0/255.0, blue: 144.0/255.0, alpha: 1.0).cgColor, UIColor(red: 0.0/255.0, green: 176.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor]
////        gradient.startPoint = CGPoint(x:0.00, y: 0.00)
////        gradient.endPoint = CGPoint(x: 1.00, y: 1.00)
////        gradient.frame = CGRect(x: 0.0, y: 0.0, width: screenWidth, height: menuHeight)
////        
////        self.addChildViewController(pageMenu!)
////        pageMenu!.view.layer.insertSublayer(gradient, at: 1)
////        self.view.addSubview(pageMenu!.view)
////        pageMenu!.didMove(toParentViewController: self)
//
//    }
    
    
}

//extension UILabel
//{
//    // A simple UILabel factory function
//    // returns instance of itself configured with the given parameters
//    
//    // use example (in a UIView or any other class that inherits from UIView):
//    
//    //   addSubview(   UILabel().make(     x: 0, y: 0, w: 100, h: 30,
//    //                                   txt: "Hello World!",
//    //                                 align: .center,
//    //                                   fnt: aUIFont,
//    //                              fntColor: UIColor.red)                 )
//    //
//    
//    func make(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat,
//              txt: String,
//              align: NSTextAlignment,
//              fnt: UIFont,
//              fntColor: UIColor)-> UILabel
//    {
//        frame = CGRect(x: x, y: y, width: w, height: h)
//        adjustsFontSizeToFitWidth = true
//        textAlignment = align
//        text = txt
//        textColor = fntColor
//        font = fnt
//        return self
//    }
//    // Of course, you can make more advanced factory functions etc.
//    // Also one could subclass UILabel, but this seems to be a     convenient case for an extension.
//}


