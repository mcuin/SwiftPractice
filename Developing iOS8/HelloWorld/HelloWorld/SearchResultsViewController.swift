//
//  ViewController.swift
//  HelloWorld
//
//  Created by Mykal Cuin on 3/9/15.
//  Copyright (c) 2015 Mykal Cuin. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol{
    
    @IBOutlet var appsTableView: UITableView?
    var tableData = []
    var api: APIController = APIController()
    let kCellIdentifer: String = "SearchResultCell"
    var imageCache = [String : UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.api.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        api.searchItunesFor("Angry Birds")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifer) as UITableViewCell
        
        var rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        cell.textLabel?.text = rowData["trackName"] as? String
        cell.imageView?.image = UIImage(named: "Blank52")
        let urlString: NSString = rowData["artworkUrl60"] as NSString
        let formattedPrice: NSString = rowData["formattedPrice"] as NSString
        var image = self.imageCache[urlString]
        
        if (image == nil) {
            var imageUrl: NSURL? = NSURL(string: urlString)
            let request: NSURLRequest = NSURLRequest(URL: imageUrl!)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if error == nil {
                    image = UIImage(data: data)
                    
                    self.imageCache[urlString] = image
                    dispatch_async(dispatch_get_main_queue(), {
                        if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                            cellToUpdate.imageView?.image = image
                        }
                    })
                } else {
                    println("Error \(error.localizedDescription)")
                }
            })
                
        } else {
            dispatch_async(dispatch_get_main_queue(), {
                if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                    cellToUpdate.imageView?.image = image
                }
            })
        }
        
        cell.detailTextLabel?.text = formattedPrice
        
        return cell
    }
    
    func didRecieveAPIResults(results: NSDictionary) {
        var resultsArr: NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = resultsArr
            self.appsTableView!.reloadData()
        })
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        var name: String = rowData["trackName"] as String
        var formattedPrice: String = rowData["formattedPrice"] as String
        var alert: UIAlertView = UIAlertView()
        
        alert.title = name
        alert.message = formattedPrice
        alert.addButtonWithTitle("Ok")
        alert.show()
    }

}

