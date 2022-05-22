//
//  input.swift
//  GroupICoursework
//
//  Created by (s) Emily Roberts on 22/05/2022.
//

import Foundation

func input(message: String) -> Double {
    print(message)
    return Double(readLine() ?? "0") ?? 0
}
