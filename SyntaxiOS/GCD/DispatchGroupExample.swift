//
//  DispatchGroupExample.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 23/11/19.
//  Copyright © 2019 Abhishek Kumar. All rights reserved.
//

import Foundation

class DispatchGroupExample {
    init() {
        self.blockCustomQueue()
        self.blockMainQueue()
        self.dispatchGroupUsingNotify()
    }
    
    func blockMainQueue() {
        let queue = DispatchQueue(label: "com.company.app.queue", qos: .default, attributes: [.concurrent])
        let group = DispatchGroup()
        group.enter()
        queue.async {
            for item in 0 ... 10 {
                print("blockMainQueue", item)
            }
            group.leave()
        }
        
        group.enter()
        queue.async {
            for item in 11 ... 20 {
                print("blockMainQueue", item)
            }
            group.leave()
        }
        
        group.wait() // blocks main queue
        print("blockMainQueue done")
    }
    
    func blockCustomQueue() {
        let queue = DispatchQueue(label: "com.company.app.queue", qos: .default, attributes: [.concurrent])
        let group = DispatchGroup()
        group.enter()
        queue.async {
            for item in 0 ... 10 {
                print("blockCustomQueue", item)
            }
            group.leave()
        }
        
        group.enter()
        queue.async {
            for item in 11 ... 20 {
                print("blockCustomQueue", item)
            }
            group.leave()
        }
        queue.async {
            group.wait() // Doesn't block main queue
            print("blockCustomQueue done")
        }
    }
    
    func dispatchGroupUsingNotify() {
        let queue = DispatchQueue(label: "com.company.app.queue", qos: .default, attributes: [.concurrent])
        let group = DispatchGroup()
        group.enter()
        queue.async {
            for item in 0 ... 10 {
                print("dispatchGroupUsingNotify", item)
            }
            group.leave()
        }
        
        group.enter()
        queue.async {
            for item in 11 ... 20 {
                print("dispatchGroupUsingNotify", item)
            }
            group.leave()
        }
        group.notify(queue: queue) {
            print("dispatchGroupUsingNotify done")
        }
    }
}
