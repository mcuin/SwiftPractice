//
//  ViewController.swift
//  HelloWorld
//
//  Created by Mykal Cuin on 3/9/15.
//  Copyright (c) 2015 Mykal Cuin. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var appsTableView: UITableView?
    var tableData = []
    var api = APIController()

    override func viewDidLoad() {
        super.viewDidLoad()
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

}

