//
//  WeatherMapViewController.swift
//  GISProject
//
//  Created by Jun Hui Foong on 19/7/16.
//  Copyright © 2016 NYP. All rights reserved.
//

import UIKit

class WeatherMapViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let localfilePath = NSBundle.mainBundle().URLForResource("weathermap", withExtension: "html");
        let myRequest = NSURLRequest(URL: localfilePath!);
        webView.loadRequest(myRequest);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
