//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Soft Dev on 5/23/19.
//  Copyright © 2019 Lily Guo. All rights reserved.
//

import Foundation

class Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
   
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
    static var DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    
    static func loadSampleEmojis() -> [Emoji] {
        return [
        Emoji(symbol: "😃", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "🤨", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes", usage: "lvoe of something; attractive"),
        Emoji(symbol: "👮‍♀️", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority")
        ]
    }
    
    static func saveToFile(emojis: [Emoji]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedEmojis = try? propertyListEncoder.encode(emojis)
        
        try? codedEmojis?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Emoji]? {
        guard let codedEmojis = try? Data(contentsOf: ArchiveURL) else {return nil}
        
        let propertyListDecoder = PropertyListDecoder()
        
        return try? propertyListDecoder.decode(Array<Emoji>.self, from: codedEmojis)
    }
    
}





