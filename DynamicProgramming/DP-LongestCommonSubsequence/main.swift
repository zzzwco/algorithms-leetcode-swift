//
//  main.swift
//  DP-LongestCommonSubsequence
//
//  Created by Bruce on 2022/6/29.
//

import Foundation

class Solution {
  
  // O(mn), O(mn)
  func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let m = text1.count
    let n = text2.count
    let s1 = Array(text1)
    let s2 = Array(text2)
    var dp: [[Int]] = Array(
      repeating: Array(repeating: 0, count: n + 1),
      count: m + 1)
    for i in 1...m {
      for j in 1...n {
        if s1[i-1] == s2[j-1] {
          dp[i][j] = dp[i - 1][j - 1] + 1
        } else {
          dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
        }
      }
    }
    return dp[m][n]
  }
}
