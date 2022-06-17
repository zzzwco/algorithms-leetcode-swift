//
//  main.swift
//  Stack_Imp
//
//  Created by Bruce on 2022/6/17.
//

import Foundation

protocol Stackable {
  
  associatedtype Element
  
  var count: Int { get }
  
  func push(_ element: Element)
  func pop() -> Element?
}

final class ArrayStack<T>: Stackable {
  
  private var arr: [T] = []
  private var _count: Int = 0
  
  var count: Int { _count}
  
  func push(_ element: T) {
    arr.append(element)
    _count += 1
  }
  
  func pop() -> T? {
    let last = arr.popLast()
    if last != nil {
      _count -= 1
    }
    return last
  }
}

print("ArrayStack:\n")

let stack1 = ArrayStack<Int>()
stack1.push(1)
stack1.push(2)
stack1.push(3)
print("count: \(stack1.count)")
_ = stack1.pop()
print("count: \(stack1.count)")
stack1.push(3)
print("count: \(stack1.count)")
_ = stack1.pop()
print("count: \(stack1.count)")
_ = stack1.pop()
print("count: \(stack1.count)")
_ = stack1.pop()
print("count: \(stack1.count)")
_ = stack1.pop()
print("count: \(stack1.count)")
stack1.push(1)
print("count: \(stack1.count)")

print("\n======\n")

print("LinkedListStack:\n")

class LinkedListStack<T>: Stackable {

  private var head: ListNode<T>?
  private var _count: Int = 0
  
  var count: Int { _count }
  
  func push(_ element: T) {
    defer { _count += 1 }
    let node: ListNode = .init(val: element)
    node.next = head
    head = node
  }
  
  func pop() -> T? {
    if head == nil {
      return nil
    }
    let v = head?.val
    head = head?.next
    _count -= 1
    return v
  }
}

let stack2 = LinkedListStack<Int>()
stack2.push(1)
stack2.push(2)
stack2.push(3)
print("count: \(stack2.count)")
_ = stack2.pop()
print("count: \(stack2.count)")
stack2.push(3)
print("count: \(stack2.count)")
_ = stack2.pop()
print("count: \(stack2.count)")
_ = stack2.pop()
print("count: \(stack2.count)")
_ = stack2.pop()
print("count: \(stack2.count)")
_ = stack2.pop()
print("count: \(stack2.count)")
stack2.push(1)
print("count: \(stack2.count)")

print("\n======\n")

