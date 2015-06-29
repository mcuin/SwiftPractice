//
//  DetailViewController.swift
//  Tasker
//
//  Created by Mykal Cuin on 6/11/15.
//  Copyright (c) 2015 Mykal Cuin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var notesView: UITextView!

    var detailItem: Task? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Task = detailItem {
            if let label = detailDescriptionLabel {
                label.text = notesView
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

