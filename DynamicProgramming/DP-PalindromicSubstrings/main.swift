//
//  main.swift
//  DP-PalindromicSubstrings
//
//  Created by Bruce on 2022/6/23.
//

import Foundation

/**
 https://leetcode.cn/problems/palindromic-substrings/
 https://leetcode.cn/problems/a7VOhD/
 */

class Solution {
  func countSubstrings(_ s: String) -> Int {
    fn2(s)
  }
  
  // MARK: - Central Diffusion
  
  /**
   T: O(n^2)
   S: O(1)
   */
  func fn1(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    let cnt = s.count
    var ans = 0
    for i in 0..<2 * cnt - 1 {
      var l = i / 2
      var r = l + i % 2
      while l >= 0 && r <= cnt - 1 && s[String.Index(utf16Offset: l, in: s)] == s[String.Index(utf16Offset: r, in: s)] {
        l -= 1
        r += 1
        ans += 1
      }
    }
    return ans
  }
  
  func fn12(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    let cnt = s.count
    var ans = 0
    let arr = Array(s)
    for i in 0..<2 * cnt - 1 {
      var l = i / 2
      var r = l + i % 2
      while l >= 0 && r <= cnt - 1 && arr[l] == arr[r] {
        l -= 1
        r += 1
        ans += 1
      }
    }
    return ans
  }
  
  func fn13(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    let cnt = s.count
    var ans = 0
    let arr = Array(s)
    let closure: (Int, Int) -> Void = {
      var l = $0
      var r = $1
      while l >= 0 && r <= cnt - 1 && arr[l] == arr[r] {
        l -= 1
        r += 1
        ans += 1
      }
    }
    for i in 0..<cnt {
      closure(i, i)
      closure(i, i + 1)
    }
    return ans
  }
  
  // MARK: - DP
  
  
  // O(n^2), O(n)
  func fn2(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    var ans: Int = 0
    let cnt = s.count
    var dp: [Bool] = Array(repeating: false, count: cnt)
    for j in 0..<cnt {
      for i in 0...j {
        if s[String.Index(utf16Offset: i, in: s)] == s[String.Index(utf16Offset: j, in: s)] &&
            (j - i <= 2 || dp[i + 1]) {
          dp[i] = true
          ans += 1
        } else {
          dp[i] = false
        }
      }
    }
    return ans
  }
  
  func fn22(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    var ans: Int = 0
    let cnt = s.count
    let arr = Array(s)
    var dp: [Bool] = Array(repeating: false, count: cnt)
    for j in 0..<cnt {
      for i in 0...j {
        if arr[i] == arr[j] && (j - i <= 2 || dp[i + 1]) {
          dp[i] = true
          ans += 1
        } else {
          dp[i] = false
        }
      }
    }
    return ans
  }
}


let s1 = "abc" // 3
let s2 = "aaa" // 6
let s3 = "abcba" // 7
let s4 = "abbcbb" // 10

let s = Solution()
print(s.countSubstrings(s1))
print(s.countSubstrings(s2))
print(s.countSubstrings(s3))
print(s.countSubstrings(s4))
