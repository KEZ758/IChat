//
//  WaitingChatsNavigation.swift
//  iChat
//
//  Created by Ерхан on 20.03.2024.
//

import Foundation

protocol WaitingChatsNavigation: AnyObject {
    func removeWaitingChat(chat: MChat)
    func changeToActive(chat: MChat)
}
