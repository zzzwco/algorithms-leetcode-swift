//
//  main.swift
//  LinkedList-LRU
//
//  Created by Bruce on 2022/6/20.
//

import Foundation

/**
 https://leetcode.cn/problems/lru-cache/
 https://leetcode.cn/problems/lru-cache-lcci/
 https://leetcode.cn/problems/OrIXps/
 */

class LRUCache {
  
  class Node: Equatable {
    
    var key: Int
    var val: Int
    var next: Node?
    var prev: Node?
    
    init(key: Int, val: Int, next: Node? = nil, prev: Node? = nil) {
      self.key = key
      self.val = val
      self.next = next
      self.prev = prev
    }
    
    static func == (lhs: LRUCache.Node, rhs: LRUCache.Node) -> Bool {
      lhs.key == rhs.key && lhs.val == rhs.val
    }
  }
  
  private var capacity: Int
  private var size: Int = 0
  private var dHead: Node = .init(key: 0, val: 0)
  private var dTail: Node = .init(key: 0, val: 0)
  private var map: [Int : Node] = [:]
  
  init(_ capacity: Int) {
    self.capacity = capacity
    dHead.next = dTail
    dTail.prev = dHead
  }
  
  func get(_ key: Int) -> Int {
    if let node = map[key] {
      moveToTail(node)
      return node.val
    }
    return -1
  }
  
  func put(_ key: Int, _ value: Int) {
    if capacity == 0 { return }
    if let node = map[key] {
      deleteNode(node)
    }
    if size == capacity {
      deleteNode(dHead.next!)
    }
    addToTail(.init(key: key, val: value))
  }
  
  func moveToTail(_ node: Node) {
    if node == dTail.prev { return }
    deleteNode(node)
    addToTail(node)
  }
  
  func deleteNode(_ node: Node) {
    node.prev?.next = node.next
    node.next?.prev = node.prev
    map[node.key] = nil
    size -= 1
  }
  
  func addToTail(_ node: Node) {
    node.prev = dTail.prev
    node.next = dTail
    node.prev?.next = node
    dTail.prev = node
    map[node.key] = node
    size += 1
  }
}

