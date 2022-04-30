//
//  Comentarios.swift
//  TesteIosSwift
//
//  Created by Angélica Andrade de Meira on 27/04/22.
//

import Foundation
import UIKit
import Alamofire

struct Comentario: Decodable {
    
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
    enum CodificadorDeChaves: String, CodingKey {
        case postId
        case id
        case name
        case email
        case body
    }
}

extension Comentario: ComentarioApresentavel {
    var idPostagem: Int {
        postId
    }
    
    var idUsuario: Int {
        id
    }
    
    var nome: String {
        name
    }
    
    var e_mail: String {
        email
    }
    
    var corpo: String {
        body
    }
}
