//
//  main.swift
//  Stack-ValidBrackets
//
//  Created by Bruce on 2022/6/20.
//

import Foundation

/**
 https://leetcode.cn/problems/valid-parentheses/
 */

class Solution {
  
  // O(n), O(n + |Σ|)
  func isValid(_ s: String) -> Bool {
    let dict: [Character : Character] = [
      ")" : "(",
      "]" : "[",
      "}" : "{"
    ]
    var stack: [Character] = []
    for char in s {
      if dict[char] == nil {
        stack.append(char)
      } else {
        if stack.isEmpty { return false}
        if stack.popLast() != dict[char] {
          return false
        }
      }
    }
    return stack.isEmpty
  }
}

let s = Solution()

let s1 = "()"
let s2 = "()[]{}"
let s3 = "(]"
let s4 = "([)]"

print(s.isValid(s1))
print(s.isValid(s2))
print(s.isValid(s3))
print(s.isValid(s4))
