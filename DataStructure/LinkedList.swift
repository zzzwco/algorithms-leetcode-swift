//
//  LinkedList.swift
//  DataStructure
//
//  Created by Bruce on 2022/6/17.
//

import Foundation

public class ListNode<T> {
  
  var val: T
  var next: ListNode?
  weak var prev: ListNode?
  
  init(val: T) {
    self.val = val
  }
}
