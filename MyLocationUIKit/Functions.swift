//
//  Functions.swift
//  MyLocationUIKit
//
//  Created by Krzysztof Jankowski on 01/09/2021.
//

import Foundation

let applicationDocumentsDirectory: URL = {
  let paths = FileManager.default.urls(
    for: .documentDirectory,
    in: .userDomainMask)
  return paths[0]
}()
