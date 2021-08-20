//
//  SwiftUIResizingTextViewApp.swift
//  SwiftUIResizingTextView
//
//  Created by 김정민 on 2021/08/20.
//

import SwiftUI

@main
struct SwiftUIResizingTextViewApp: App {
    
    let obj = Observed()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(obj)
        }
    }
}
