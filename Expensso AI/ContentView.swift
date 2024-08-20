//
//  ContentView.swift
//  Expensso AI
//
//  Created by Ebenezer Tseh on 7/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var vm = LogListViewModel()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
             
            #if os(macOS)
            splitView
            #elseif os(visionOS)
            TabView
            #else
        switch horizontalSizeClass {
        case.compact: tabView
        default: splitView
        }
        #endif
    }
    var tabView: some View {
        TabView {
            NavigationStack {
                LogListContainerView(vm : $vm)
            }.tabItem {
                Label("Expenses", systemImage: "tray")
              
            }.tag(0)
            NavigationStack {
                AIAssistantView()
            }.tabItem {
                Label("AI Assistant", systemImage: "waveform")
              
            }.tag(1)
        }
    }
    var splitView: some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: LogListContainerView(vm: $vm)) {
                    Label("Expenses", systemImage:"tray")
                }
                NavigationLink(destination: AIAssistantView()) {
                    Label("AI Assistant", systemImage:"waveform")
                }
            }
        }detail: {
            LogListContainerView(vm : $vm)
        }
        .navigationTitle("Expensso AI")
    }
}

#Preview {
    ContentView()
}
