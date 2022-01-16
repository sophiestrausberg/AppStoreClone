//
//  ContentView.swift
//  AppStoreClone
//
//  Created by Sophie Strausberg on 1/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TodayPageModel()
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
