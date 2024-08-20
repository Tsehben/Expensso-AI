//
//  LogItemView.swift
//  Expensso AI
//
//  Created by Ebenezer Tseh on 7/26/24.
//

import SwiftUI

struct LogItemView: View {
    let log: ExpenseLog
    @Environment(\.horizontalSizeClass) var
    horizontalSizeClass
    
    var body: some View {
        switch horizontalSizeClass {
        case .compact: compactView
        default: regularView
        }
    }
    var compactView: some View {
        HStack(spacing: 16) {
            CategoryImageView(category: log.categoryEnum)
            VStack(alignment: .leading, spacing: 8) {
                Text(log.name).font(.headline)
                Text(log.dateText).font(.subheadline)
            }
            Spacer()
            Text(log.amountText).font(.headline)
        }
        
    }
    var regularView: some View {
        VStack {
            HStack (spacing: 16){
                CategoryImageView(category: log.categoryEnum)
                Spacer()
                Text(log.name)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity,
            alignment: .leading)
                Spacer()
                Text(log.amountText)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity,
                           alignment: .leading)
                Spacer()
                Text(log.dateText)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity,
                           alignment: .leading)
                Spacer()
                Text(log.categoryEnum.rawValue)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity,
                           alignment: .leading)
                Spacer()
            }
        }
    }
}

#Preview {
    VStack {
        ForEach([ExpenseLog(id:"1", name: "Banku", category: "Food", amount: 10, date: .now),
                 ExpenseLog(id:"2", name: "Electricity", category: "Utilities", amount: 100, date: .now),])
        {log in LogItemView(log: log)}
    }
    .padding()
}
