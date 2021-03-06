//
//  Database.swift
//  ChatExample
//
//  Created by Alexey Bukhtin on 05/12/2019.
//  Copyright © 2019 Stream.io Inc. All rights reserved.
//

import Foundation
import StreamChatCore

#if canImport(StreamChatRealm)
import StreamChatRealm
#else
final class RealmDatabase {
    struct Config {
        let encrypted: Bool
        let logOptions: ClientLogger.Options
    }
    
    static func setup(_ config: Config) -> StreamChatCore.Database? {
        return nil
    }
}
#endif

struct Database {
    static let instance: StreamChatCore.Database? = NSClassFromString("StreamChatRealm.RealmDatabase") != nil
        ? RealmDatabase.setup(.init(encrypted: false, logOptions: .info))
        : nil
}
