//
//  FunctionResponse.swift
//  Expensso AI
//
//  Created by Ebenezer Tseh on 8/17/24.
//

import Foundation

typealias AddExpenseLogConfirmationCallback = ((Bool, AddExpenseLogViewProperties) -> Void)

enum UserConfirmation {
    case pending, confirmed, cancelled
}

struct AddExpenseLogViewProperties {
    let log: ExpenseLog
    let messageID: UUID?
    let userConfirmation: UserConfirmation
    let confirmationCallback: AddExpenseLogConfirmationCallback?
}



struct AIAssistantResponse {
    let text: String
    let type: AIAssistantResponseFunctionType
    
    
}

enum AIAssistantResponseFunctionType {
        case addExpenseLog(AddExpenseLogViewProperties)
        case listExpenses([ExpenseLog])
        case visualizeExpenses(ChartType, [Option])
        case contentText
    
}
