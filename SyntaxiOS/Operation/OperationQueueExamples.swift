//
//  OperationQueueExamples.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 28/06/20.
//  Copyright © 2020 Abhishek Kumar. All rights reserved.
//

import Foundation

class OperationQueueExamples: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // Method 1
        let blockOperation = BlockOperation {
            print("Executing!")
        }

        let queue = OperationQueue()
        queue.addOperation(blockOperation)
        
        //Method 2
        queue.addOperation {
          print("Executing!")
        }
        
        let contentImportOperation = ContentImportOperation()

        contentImportOperation.completionBlock = {
            print("Importing completed!")
        }

        queue.addOperation(contentImportOperation)
        queue.waitUntilAllOperationsAreFinished()
        
        let contentUploadOperation = UploadContentOperation()
        contentUploadOperation.addDependency(contentImportOperation)
        contentUploadOperation.completionBlock = {
            print("Uploading completed!")
        }
        queue.addOperation(contentUploadOperation)
//        queue.addOperations([contentImportOperation, contentUploadOperation], waitUntilFinished: true)
        
        let newContentImportOperation = ContentImportOperation()

        newContentImportOperation.completionBlock = {
            print("newContentImportOperation Importing completed!")
        }
        queue.addOperation(newContentImportOperation)
        
        /*
         Ready: It’s prepared to start
         Executing: The task is currently running
         Finished: Once the process is completed
         Canceled: The task canceled
         
         It’s important to know that an operation can only execute once. Whenever it’s in the finished or canceled state, you can no longer restart the same instance.
         */
    }
}

final class UploadContentOperation: Operation {
    override func main() {
        for i in 1 ... 5 {
            print("Uploading content..", String(i))
        }
    }
}

final class ContentImportOperation: Operation {

    override func main() { // The main() function is the only method you need to overwrite for synchronous operations
        guard !isCancelled else { return }
        for i in 1 ... 5 {
            print("Importing content..", String(i))
        }
    }
}

//class CustomOperation: Operation {
//    var valueInt = 0
//    
//    override func main() {
//        for i in 1 ... 1000 {
//            valueInt = valueInt + i
//        }
//    }
//}
