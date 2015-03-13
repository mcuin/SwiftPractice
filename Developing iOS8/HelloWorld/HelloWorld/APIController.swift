//
//  APIController.swift
//  HelloWorld
//
//  Created by Mykal Cuin on 3/13/15.
//  Copyright (c) 2015 Mykal Cuin. All rights reserved.
//

import Foundation

protocol APIControllerProtocol {
    func didRecieveAPIResults(results: NSDictionary)
}

class APIController{
    
    var delegate: APIControllerProtocol?
    
    init() {
        
    }
    
    func searchItunesFor(searchTerm: String) {
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        if let escapedSearchTerm = itunesSearchTerm.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
            let url = NSURL(string: urlPath)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in println("Task Completed")
                
                if (error != nil) {
                    println(error.localizedDescription)
                }
                
                var err: NSError?
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
                
                if (err != nil) {
                    println("JSON Error: \(err!.localizedDescription)")
                }
                
                let result: NSArray = jsonResult["results"] as NSArray
                self.delegate?.didRecieveAPIResults(jsonResult)
                
            })
            
            task.resume()
        }
    }
}
