//
//  HotTextDetailViewController.swift
//  PTT2.0
//
//  Created by 洋蔥胖 on 2018/7/2.
//  Copyright © 2018年 ChrisYoung. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class HotTextDetailViewController: UIViewController {
    
    //var urlString : String = ""
    var bi: String = ""
    var ti: String = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        showDetail()
    }
    
    func showDetail(){
        //http://disp.cc/b/163-aHVt
        let webAddress = "https://disp.cc/m/\(bi)-\(ti)?fr=DispApp"
        print(webAddress)
        if let url = URL(string: webAddress){
            let request = URLRequest(url: url)
            self.webView.load(request)
            view.addSubview(self.webView)
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        //NetworkActivityIndicatorManager.shared.incrementActivityCount()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}
