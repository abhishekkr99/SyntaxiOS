//
//  MemoryManagementTutorial.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 19/10/19.
//  Copyright © 2019 Abhishek Kumar. All rights reserved.
//

import UIKit

class User {
    let name: String
    lazy var temp = 10
    
    lazy var btn: UIButton = {
        let btn = UIButton()
        btn.setTitle("eee", for: .normal)
        return btn
    }()
    
    init(name: String) {
        self.name = name
        print("User \(name) was initialized")
    }
    
    deinit {
        print("Deallocating user named: \(name)")
    }
    
    private(set) var phones: [Phone] = []
    
    func add(phone: Phone) {
        phones.append(phone)
        phone.owner = self
    }
}

class Phone {
    let model: String
    var owner: User?
    
    init(model: String) {
        self.model = model
        print("Phone \(model) was initialized")
    }
    
    deinit {
        print("Deallocating phone named: \(model)")
    }
} 

class WWDCGreeting {
  let who: String
  
  init(who: String) {
    self.who = who
  }

  lazy var greetingMaker: () -> String = { [unowned self] in
    return "Hello \(self.who)."
  }
}
