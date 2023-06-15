//
//  UIApplication+Extension.swift
//  MyTodo3
//
//  Created by user on 2023/06/15.
//

import SwiftUI

// 開いているキーボードがあれば閉じる拡張
extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}
