//
//  ReadWriteJsonFiles.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 07/07/20.
//  Copyright © 2020 Abhishek Kumar. All rights reserved.
//

import Foundation

class ReadWriteJsonFiles {
    init() {
        if let path = Bundle.main.path(forResource: "With out Bird", ofType: "json") {
            
            do {
                // get data from path
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                // convert data from file to codable
                guard let contactListModel = try? JSONDecoder().decode(Welcome.self, from: data) else {
                    return
                }
                print(contactListModel)
                
                // get json from that data
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                // get dictionary from json
                if let jsonResultDict = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResultDict["assets"] as? [Dictionary<String, Any>] {
                    print(person)
                }
                
                // Convert json object to json Data
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                print(jsonData)
                
                // write json data to file
                let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
                dispatchQueue.async {
                    let pathAsURL = URL(fileURLWithPath: path)
                    do {
                        try jsonData.write(to: pathAsURL)
                    } catch {
                        print(error)
                    }
                }
                
                // write codable data to file
                dispatchQueue.async {
                    if let encodedData = try? JSONEncoder().encode(contactListModel) {
                        let pathAsURL = URL(fileURLWithPath: path)
                        do {
                            try encodedData.write(to: pathAsURL)
                        } catch {
                            print(error)
                        }
                    }
                }
                
            } catch {
                print(error)
            }
        }
    }
}

class Welcome: Codable {
    
}
