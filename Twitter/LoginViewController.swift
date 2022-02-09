//
//  LoginViewController.swift
//  Twitter
//
//  Created by Cassey Anene on 2/8/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Check the userDefault key
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myURL = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myURL, success: {
            // This perform segue is used to navigate the app to home after the user successfully logs in
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            // Write a note in memory to say that the user logged in
            UserDefaults.standard.set(true, forKey: "userLoggedIn") // "userLoggedIn" is basically a variable
        }, failure: { (Error) in
            print("Could not log in")
        }) // The empty function call is called a closure
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
