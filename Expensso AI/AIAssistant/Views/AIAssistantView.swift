//
//  AIAssistantView.swift
//  Expensso AI
//
//  Created by Ebenezer Tseh on 8/15/24.
//
import ChatGPTUI
import SwiftUI

let apiKey = Secrets.chatGPTAPIKey
let _senderImage = "https://imagizer.imageshack.com/img924/8137/Ozph6u.jpg"

let _botImage = "https://image.winudf.com/v2/image1/Y29tLmNvZGVjYW5keS5jaGFyYWN0ZXJhaWNoYXQuYW5kcm9pZGFwcF9pY29uXzE2NzQ2NjY5MjlfMDEx/icon.webp?w=140&fakeurl=1&type=.webp"
enum ChatType: String, Identifiable, CaseIterable {
    case text = "Text"
    case voice = "Voice"
    var id: Self{self}
}

struct AIAssistantView: View {
    @State var textChatVM = AIAssistantTextChatViewModel(apiKey: apiKey)
    @State var voiceChatVM = AIAssistantVoiceChatViewModel(apiKey: apiKey)
    @State var chatType = ChatType.text
    
    var body: some View {
        VStack(spacing: 0) {
            Picker(selection: $chatType, label: Text("Chat Type").font(.system(size:12,
                                                                               weight: .bold))) {
                
                ForEach(ChatType.allCases){ type in
                    Text(type.rawValue).tag(type)
                }
            }
           .pickerStyle(SegmentedPickerStyle())
           .padding(.horizontal)
            
            #if !os(iOS)
           .padding(.vertical)
            #endif
            
            Divider()
            
            ZStack {
                switch chatType {
                case .text:
                    TextChatView(customContentVM: textChatVM)
                    
                case .voice:
                    VoiceChatView(customContentVM: voiceChatVM)
                }
            }.frame(maxWidth: 1024, alignment: .center)
             
        }
        #if !os(macOS)
        .navigationBarTitle("Expensso AI", displayMode: .inline)
        #endif
    }
}
#Preview {
    AIAssistantView()
}
