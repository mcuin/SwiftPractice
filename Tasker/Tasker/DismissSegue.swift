//
//  DismissSegue.swift
//  Tasker
//
//  Created by Mykal Cuin on 6/11/15.
//  Copyright (c) 2015 Mykal Cuin. All rights reserved.
//

import UIKit

@objc(DismissSegue) class DismissSegue: UIStoryboardSegue {
    
    override func perform() {
        if let controller = sourceViewController.presentingViewController {
            controller!.dismissViewControllerAnimated(true, completion: nil)
        }
    }
   
}
