//
//  JokeModel.swift
//  Not-Boring-Tables
//
//  Created by Jaimin Raval on 22/09/25.
//

import Foundation

//{
//"type":"general",
//"setup":"Why are fish easy to weigh?",
//"punchline":"Because they have their own scales.",
//"id":298
//}


struct JokeModel: Codable {
    var id: Int
    var type: String
    var setup: String
    var punchline: String
}
