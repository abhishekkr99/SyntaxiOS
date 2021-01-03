//
//  GCDLearn.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 08/07/20.
//  Copyright © 2020 Abhishek Kumar. All rights reserved.
//

import Foundation

/*
 1. Grand Central Dispatch (GCD) is a low-level API for managing operations either asynchronously or synchronously. GCD can be used to manage heavy tasks to the background so that we can improve our app’s responsiveness
 2.
 
 */


class GCDLearn {
    
    func targetQueue() {
        var value: Int = 2

        let serialQueue = DispatchQueue(label: "serialQueue")
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: [.initiallyInactive, .concurrent])
        concurrentQueue.setTarget(queue: serialQueue)
        concurrentQueue.activate()

        serialQueue.async {
        for j in 5...7 {
                value = j
                print("\(value) ✴️")
            }
        }

        concurrentQueue.async {
        for j in 0...4 {
                value = j
                print("\(value) ✡️")
            }
        }
    }
}
