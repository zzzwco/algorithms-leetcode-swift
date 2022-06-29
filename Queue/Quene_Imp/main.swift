//
//  main.swift
//  Quene_Imp
//
//  Created by Bruce on 2022/6/29.
//

import Foundation

/**
 https://leetcode.cn/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/
 */

// O(1), O(n)
class CQueue {
  
  var inStack = [Int]()
  var outStack = [Int]()
  
  init() {
    
  }
  
  func appendTail(_ value: Int) {
    inStack.insert(value, at: 0)
  }
  
  func deleteHead() -> Int {
    if !outStack.isEmpty {
      return outStack.removeLast()
    }
    if !inStack.isEmpty {
      inStack.forEach {
        outStack.append($0)
        inStack.removeLast()
      }
      return outStack.removeLast()
    }
    return -1
  }
}
