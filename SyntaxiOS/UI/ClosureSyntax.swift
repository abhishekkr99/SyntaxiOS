//
//  ClosureSyntax.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 19/10/19.
//  Copyright © 2019 Abhishek Kumar. All rights reserved.
//

import Foundation

typealias tempClosure = (String) -> String

class ClosureSyntax: NSObject {
    
    @objc var closureName: ((String) -> String)?
    
    override init() {
        
        self.closureName = {(value) -> (String) in
            return ""
        }
        print(closureName ?? "")
        
        super.init()
        
        self.testClosure(anotherParam: "", parameter: { (para) -> (String) in
            return ""
        }, thirdParam: "")
        
        self.testWithEndClosure(anotherParam: "") { (para) -> (String) in
            return para
        }
        
        let array = [1, 2, 3, 4]
        array.sorted(by: { [unowned self] (item1: Int, item2: Int) -> Bool in
            return item1 < item2
        })
        
        let calulateClosure:((Int, Int) -> (Int)) = {(a: Int, b: Int) -> Int in
            return a + b
        }
        
        print(calulateClosure(1, 2))
    }
    
    func testClosure(anotherParam: String, parameter: (String) -> (String), thirdParam: String) {
        // Note: if the passed-in closure is going to outlive the scope of the method, e.g. if you are saving it to a property, it needs to be annotated with @escaping.
    }
    
    func testWithEndClosure(anotherParam: String, parameter: (String) -> (String)) {
        // Note: if the passed-in closure is going to outlive the scope of the method, e.g. if you are saving it to a property, it needs to be annotated with @escaping.
    }
}
