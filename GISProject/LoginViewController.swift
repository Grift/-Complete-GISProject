//
//  LoginViewController.swift
//  Loba
//
//  Created by Jun Hui Foong on 26/5/16.
//  Copyright © 2016 NANYANG POLYTECHNIC. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var myid : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //easter egg :D
        let tapFunc1 = UITapGestureRecognizer.init(target: self, action: "changeView")
        tapFunc1.numberOfTapsRequired = 10
        tapFunc1.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tapFunc1)
        
        //hide keyboard
        let tapFunc2 = UITapGestureRecognizer.init(target: self, action: "hideKeyboard")
        self.view.addGestureRecognizer(tapFunc2)
    }

    func changeView() {
        self.image.image = UIImage.init(named: "loba")
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }
    

    @IBAction func Login(sender: AnyObject) {
        hideKeyboard()
        FIRAuth.auth()?.signInWithEmail(Email.text!, password: Password.text!, completion: {
            user, error in
            
            if error != nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let errorAlert = UIAlertController(title: "Login Failed", message: "Please ensure information given is correct!", preferredStyle: .Alert)
                    errorAlert.addAction(UIAlertAction(title: "Fix it now!!!", style: .Default, handler: nil))
                    self.presentViewController(errorAlert, animated: true, completion: nil)
                })
                self.Email.text! = ""
                self.Password.text! = ""
            } else {
                if let user = FIRAuth.auth()?.currentUser {
                    self.myid = user.uid
                    setMyUID.AccountUID = self.myid
                    print(self.myid)
                }
                let tabBarController = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("tabBarControllerMain") as? UITabBarController
                    self.presentViewController(tabBarController!, animated: true, completion: nil)
                self.Email.text! = ""
                self.Password.text! = ""
            }
        })
    }
    
    struct setMyUID {
        static var AccountUID = ""
    }


}

