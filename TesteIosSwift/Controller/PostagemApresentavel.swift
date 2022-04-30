//
//  PostagemApresentavel.swift
//  TesteIosSwift
//
//  Created by Angélica Andrade de Meira on 28/04/22.
//

protocol PostagemApresentavel {
    var idUsuario: Int { get }
    var idPostagem: Int { get }
    var titulo: String { get }
    var corpo: String { get }
}
