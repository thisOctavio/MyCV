//
//  CommonFunctions.swift
//  MyCV
//
//  Created by User on 5/24/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

typealias AsyncBlock = () -> Void

// MARK: - Public methods
/**
 Submits a item into the main dispatch queue for asynchronous execution after a specified time.

 - Parameter delay: a period of time to wait.
 - Parameter queue: manages the execution of work items, by default is main.
 - Parameter closure: completion work for the item.
 */
@inline(__always) func performAfter(_ delay: Double,
                                    on queue: DispatchQueue = DispatchQueue.main,
                                    closure: @escaping AsyncBlock) {
  queue.asyncAfter(
    deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
  )
}

/**
 Submits a item into the main dispatch queue and optionally associates it with a dispatch group.

 - Parameter queue: manages the execution of work items, by default is main.
 - Parameter closure: completion work for the item.
 */
@inline(__always) func performAsync(on queue: DispatchQueue = DispatchQueue.main,
                                    closure: @escaping AsyncBlock) {
  queue.async(execute: closure)
}
