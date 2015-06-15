//
//  Task.swift
//  Tasker
//
//  Created by Mykal Cuin on 6/15/15.
//  Copyright (c) 2015 Mykal Cuin. All rights reserved.
//

import Foundation

struct Task {
    let title: String
    let notes: String
    
    init(title: String, notes: String) {
        self.title = title
        self.notes = notes
    }
}