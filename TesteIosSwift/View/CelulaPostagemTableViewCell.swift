//
//  CelulaPostagemTableViewCell.swift
//  TesteIosSwift
//
//  Created by Angélica Andrade de Meira on 29/04/22.
//

import UIKit
import Alamofire

class CelulaPostagemTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "celulaPostagem")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
