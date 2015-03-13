//
//  ViewController.swift
//  HelloWorld
//
//  Created by Mykal Cuin on 3/9/15.
//  Copyright (c) 2015 Mykal Cuin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var appsTableView: UITableView?
    var tableData = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchItunesFor("JQ Software")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        let rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        cell.textLabel?.text = rowData["trackName"] as? String
        let urlString: NSString = rowData["artworkUrl60"] as NSString
        let imageUrl: NSURL? = NSURL(string: urlString)
        let imgData = NSData(contentsOfURL: imageUrl!)
        cell.imageView?.image = UIImage(data: imgData!)
        let formattedPrice: NSString = rowData["formattedPrice"] as NSString
        cell.detailTextLabel?.text = formattedPrice
        
        return cell
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
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableData = result
                    self.appsTableView!.reloadData()
                    })
            })
            
            task.resume()
        }
    }


}

