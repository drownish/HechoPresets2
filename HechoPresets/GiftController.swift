//
//  GiftController.swift
//  HechoPresets
//
//  Created by Максим Белугин on 03.06.2018.
//  Copyright © 2018 Максим Белугин. All rights reserved.
//

import UIKit
import MailgunSwift

class GiftController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func sendButton(_ sender: Any) {
        if emailField != nil {
            if isValidEmail(testStr: emailField.text!) {
                sendEmail()
            
            }
            else {
                let popup = UIAlertController(title: "Error", message: "Email is incorrect", preferredStyle: UIAlertControllerStyle.alert)
                popup.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(popup, animated: true)
            }
        }
        else {
            let popup = UIAlertController(title: "Error", message: "Field is empty", preferredStyle: UIAlertControllerStyle.alert)
            popup.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(popup, animated: true)
        }
    }
    
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func endWriting(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    func sendEmail() {
        
        let message = MailgunMessage(from:"Excited User <postmaster@sandboxe8611cc1d16c420b9f6db818d366006a.mailgun.org>",
                                     to:"Jay Baird <hechoprodukcija@gmail.com>",
                                     message:"\(emailField.text!)",
                                     body:"New user")
        
        let mailgun = Mailgun(apiKey: "key-379ac25e02ec37bcf743dd98536c4880", domain: "sandboxe8611cc1d16c420b9f6db818d366006a.mailgun.org")
        mailgun.send(message: message) { result in
            switch result {
            case .success(let messageId):
                print(messageId)
                DispatchQueue.main.async(execute: {
                    self.sendButton.setTitle("Succes", for: .normal)
                    DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                        self.sendButton.setTitle("Send", for: .normal)
                    })
                })
            case .failure(let error):
                print(error)
                DispatchQueue.main.async(execute: {
                    self.sendButton.setTitle("Error", for: .normal)
                    DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                        self.sendButton.setTitle("Send", for: .normal)
                    })
                })
            }
        }
    }
    
    func test() {
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "https://api.mailgun.net/v3/sandboxe8611cc1d16c420b9f6db818d366006a.mailgun.org")!)
        request.httpMethod = "POST"
        let data = "from: Excited User <postmaster@sandboxe8611cc1d16c420b9f6db818d366006a.mailgun.org>&to:<hechoprodukcija@gmail.com>&subject:Hello&text:\(emailField.text!)"
        request.httpBody = data.data(using: .ascii)
        request.setValue("key-379ac25e02ec37bcf743dd98536c4880", forHTTPHeaderField: "api")
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            
            if let error = error {
                print(error)
                DispatchQueue.main.async(execute: {
                    self.sendButton.setTitle("Error", for: .normal)
                    DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                        self.sendButton.setTitle("Send", for: .normal)
                    })
                })
            }
            if let response = response {
                print("url = \(response.url!)")
                print("response = \(response)")
                let httpResponse = response as! HTTPURLResponse
                if httpResponse.statusCode == 400 {
                    DispatchQueue.main.async(execute: {
                        self.sendButton.setTitle("Error", for: .normal)
                        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                            self.sendButton.setTitle("Send", for: .normal)
                        })
                    })
                }
                else {
                    DispatchQueue.main.async(execute: {
                        self.sendButton.setTitle("Succes", for: .normal)
                        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                            self.sendButton.setTitle("Send", for: .normal)
                        })
                    })
                }
                print("response code = \(httpResponse.statusCode)")
            }
            
            
        })
        task.resume()
        DispatchQueue.main.async(execute: {
            self.sendButton.setTitle("Sending", for: .normal)
        })
    }
    
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

}
