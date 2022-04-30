//
//  ComentarioApresentavel.swift
//  TesteIosSwift
//
//  Created by Angélica Andrade de Meira on 29/04/22.
//

protocol ComentarioApresentavel {
    var idPostagem: Int { get }
    var idUsuario: Int { get }
    var nome: String { get }
    var e_mail: String { get }
    var corpo: String { get }
}
