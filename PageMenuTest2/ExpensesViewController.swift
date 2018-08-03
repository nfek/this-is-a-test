//
//  ExpensesViewController.swift
//  ChinaPress
//
//  Created by AppAsia Tech on 13/11/2017.
//  Copyright © 2017 EmylKhairuddin. All rights reserved.
//
//  added for RTW2017


import UIKit


//details page
class ExpensesViewController: UIViewController, UIWebViewDelegate{
    
    
    //    var urlString : String = "http://www.chinapress.com.my/prizes/"
    var urlString : String = "https://www.youtube.com/watch?v=WDAd0S92Uko"
    
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
     
        // refresh web view
        self.webView.reload()
        self.refresher.endRefreshing()
    }
    
}


