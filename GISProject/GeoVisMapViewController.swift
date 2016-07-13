//
//  WeatherMapViewController.swift
//  GISProject
//
//  Created by iOS on 12/7/16.
//  Copyright © 2016 NYP. All rights reserved.
//

import UIKit

class GeoVisMapViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let localFilePath = NSBundle.mainBundle().URLForResource("weathermap", withExtension: "html")
        let myRequest = NSURLRequest(URL: localFilePath!)
        self.webView.loadRequest(myRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func buttonPressed(button: UIButton) {
//        if button.titleLabel?.text == "Layers" {
//            let localFilePath = NSBundle.mainBundle().URLForResource("layers", withExtension: "html")
//            let myRequest = NSURLRequest(URL: localFilePath!)
//            self.webView.loadRequest(myRequest)
//            
//            button.titleLabel?.text = "Weather"
//        } else if button.titleLabel?.text == "Weather" {
//            let localFilePath = NSBundle.mainBundle().URLForResource("weathermap", withExtension: "html")
//            let myRequest = NSURLRequest(URL: localFilePath!)
//            self.webView.loadRequest(myRequest)
//            
//            button.titleLabel?.text = "Layers"
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
