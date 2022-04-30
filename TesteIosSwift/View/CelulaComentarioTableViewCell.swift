//
//  CelulaComentarioTableViewCell.swift
//  TesteIosSwift
//
//  Created by Angélica Andrade de Meira on 27/04/22.
//

import UIKit
import Alamofire

class CelulaComentarioTableViewCell: UITableViewCell {
    
    // MARK: - View code
    
    lazy var labelNome: UILabel = {
        let view = UILabel()
        view.contentMode = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        return view
    }()
    
    lazy var labelEmail: UILabel = {
        let view = UILabel()
        view.contentMode = .left
        view.textColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var fotoContato: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var labelCorpo: UILabel = {
        let view = UILabel()
        view.contentMode = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "celulaComentario")
        
        self.contentView.addSubview(fotoContato)
        self.contentView.addSubview(labelNome)
        self.contentView.addSubview(labelEmail)
        self.contentView.addSubview(labelCorpo)
        
        fotoContato.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        fotoContato.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        fotoContato.trailingAnchor.constraint(equalTo: self.labelNome.leadingAnchor, constant: -15).isActive = true
        fotoContato.widthAnchor.constraint(equalToConstant: 50).isActive = true
        fotoContato.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelNome.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        labelNome.leadingAnchor.constraint(equalTo: self.fotoContato.trailingAnchor, constant: 10).isActive = true
        labelNome.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
        labelEmail.topAnchor.constraint(equalTo: self.labelNome.bottomAnchor, constant: 10).isActive = true
        labelEmail.leadingAnchor.constraint(equalTo: self.fotoContato.trailingAnchor, constant: 15).isActive = true
        labelEmail.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
        labelCorpo.topAnchor.constraint(equalTo: self.labelEmail.bottomAnchor, constant: 10).isActive = true
        labelCorpo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        labelCorpo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
        labelCorpo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
