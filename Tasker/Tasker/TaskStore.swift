//
//  TaskStore.swift
//  Tasker
//
//  Created by Mykal Cuin on 6/15/15.
//  Copyright (c) 2015 Mykal Cuin. All rights reserved.
//

import Foundation

class TaskStore {
    class var sharedInstance: TaskStore {
        struct Static {
            static let instance = TaskStore()
        }
        return Static.instance
    }
    
    var tasks: [Task] = []
    
    func add(task: Task) {
        tasks.append(task)
    }
    
    func replace(task: Task, atIndex index: Int) {
        tasks[index] = task
    }
    
    func get(index: Int) -> Task {
        return tasks[index]
    }
}