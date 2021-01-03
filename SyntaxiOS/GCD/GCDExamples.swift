//
//  GCDExamples.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 22/10/19.
//  Copyright © 2019 Abhishek Kumar. All rights reserved.
//

import Foundation

class GCDExamples {
    init() {
        self.createBgThread()
    }
    
    func createBgThread() {
        // 1
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
          guard let self = self else {
            return
          }
            self.printHello(num: 2)

          // 2
          DispatchQueue.main.async { [weak self] in
            // 3
            self?.printHello(num: 1)
          }
        }
    }
    
    func printHello(num: Int) {
        print("hello" + String(num))
    }
}
