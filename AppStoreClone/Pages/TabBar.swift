//
//  TabBar.swift
//  AppStoreClone
//
//  Created by Sophie Strausberg on 1/15/22.
//

import Foundation
import SwiftUI

struct TabBar: View {
    @State var selected : Int = 0
    var body: some View {
        
        TabView(selection: $selected) {
            //call an instance of the todayPageModel
            TodayPageModel().tabItem {
                Text("Today")
            }
            SearchPageModel().tabItem {
                Text("Search")
            }
            
            
        }
    }
}

struct TabBarModel_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
