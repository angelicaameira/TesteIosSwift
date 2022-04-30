//
//  Postagem.swift
//  TesteIosSwift
//
//  Created by Angélica Andrade de Meira on 27/04/22.
//

import Foundation
import UIKit
import Alamofire

struct Postagem: Decodable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    enum CodificadorDeChaves: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
}

extension Postagem: PostagemApresentavel {
    var idUsuario: Int {
        userId
    }
    var idPostagem: Int {
        id
    }
    var titulo: String {
        title
    }
    var corpo: String {
        body
    }
}
