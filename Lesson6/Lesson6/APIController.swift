//
//  APIController.swift
//  Lesson6
//
//  Created by Do Hung on 7/16/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

protocol APIControllerDelegate {
    func receivedData(results : [Result])
}

class APIController: NSObject {
    
    var delegate : APIControllerDelegate?
    
    func callAPI() {
        let urlPath = "https://api.github.com/users/google/repos"
        let url = URL(string: urlPath)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: {data, response, error -> Void in
            if(error != nil) {
                print(error?.localizedDescription as Any)
            }
            do {
                let arr = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                var results = [Result]()
                for json in arr {
                    if let item = json as? [String: AnyObject] {
                        let result = Result(JSON: item)
                        results.append(result!)
                    }
                }
                self.delegate?.receivedData(results: results)
            } catch {
                
            }
        })
        
        task.resume()
    }
}
