//
//  ThreadSafeSIngletonClass.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 22/10/19.
//  Copyright © 2019 Abhishek Kumar. All rights reserved.
//

import Foundation

class PhotoManager {
    
    private var unsafePhotos: [String] = []
    private let concurrentPhotoQueue = DispatchQueue(label: "com.raywenderlich.GooglyPuff.photoQueue", attributes: .concurrent)
    
    var photos: [String] {
      var photosCopy: [String]!

      // 1
      concurrentPhotoQueue.sync {

        // 2
        photosCopy = self.unsafePhotos
      }
      return photosCopy
    }
    
    private init() {}
    static let shared = PhotoManager()
    
    // write operation using dispatch barriers
    func addPhoto(_ photo: String) {
      concurrentPhotoQueue.async(flags: .barrier) { [weak self] in
        // 1
        guard let self = self else {
          return
        }

        // 2
        self.unsafePhotos.append(photo)

        // 3
        DispatchQueue.main.async { [weak self] in
          
        }
      }
    }
    
}
