//
//  String+AddText.swift
//  MyLocationUIKit
//
//  Created by Krzysztof Jankowski on 08/09/2021.
//

import Foundation
extension String {
  mutating func add(
    text: String?,
    separatedBy separator: String
  ) {
    if let text = text {
      if !isEmpty {
        self += separator
      }
      self += text
    }
  }
}
