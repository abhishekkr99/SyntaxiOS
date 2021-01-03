//
//  ViewController.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 19/10/19.
//  Copyright © 2019 Abhishek Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let _ = self.getDataFromURL(url: "") { (value) -> String in
            return value;
        }
        
        self.runScenario()
        self.thread()
        self.testCompletionHandler(value: "aaa") { (value) -> String in
            print(value)
            return "hello"
        };
        
        // run DispatchGroup Example
        let _ = DispatchGroupExample()
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn.backgroundColor = UIColor.green
        btn.setTitle("Press", for: .normal)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        btn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        
        let btnQueue = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(btnQueue)
        btnQueue.backgroundColor = UIColor.blue
        btnQueue.translatesAutoresizingMaskIntoConstraints = false
        btnQueue.setTitle("OperationQueue Sample", for: .normal)
        btnQueue.addTarget(self, action: #selector(btnOperationQueue), for: .touchUpInside)
        btnQueue.bottomAnchor.constraint(equalTo: btn.topAnchor, constant: -10).isActive = true
        btn.centerXAnchor.constraint(equalTo: btnQueue.centerXAnchor, constant: 0).isActive = true
    }
    
    @objc func btnOperationQueue() {
        let vc = OperationQueueExamples()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnTapped() {
//        let vc = SearchTest()
//        let vc = RoundWithCircleVC()
//        let vc = HikeLandUserFullProfileViewController()
//        let nav = UINavigationController(rootViewController: vc)
      
        let vc = HikeLandCombinedOnboardingVC()
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func testCompletionHandler(value:String, completion:((String) -> String)) {
        completion("hello")
        completion("world")
        completion("war")
    }
    
    func thread() {
        let queue = DispatchQueue(label: "new.queue", attributes: [.concurrent])
        DispatchQueue.main.async {
            print("aaa")
            queue.sync {
                print("bbb")
                queue.sync {
                    print("ccc")
                }
            }
            print("ddd")
        }
    }
    
    func getDataFromURL(url: String, completion: @escaping ((String) -> String)) {
        let urlString = "www.google.com"
        if let url = URL(string: urlString) {
            let request = NSMutableURLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
                completion("hello")
            }
            session.resume()
        }
    }

    func runScenario() {
        let user = User(name: "John")
        let iPhone = Phone(model: "iPhone Xs")
        user.add(phone: iPhone)
    }
    
    func unOwnedSelfUseCase() {
        let greetingMaker: () -> String
        do {
          let mermaid = WWDCGreeting(who: "caffeinated mermaid")
          greetingMaker = mermaid.greetingMaker
        }
        print(greetingMaker()) // TRAP! Crash
    }
}

