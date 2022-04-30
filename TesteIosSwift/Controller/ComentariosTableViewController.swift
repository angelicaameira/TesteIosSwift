//
//  ComentariosTableViewController.swift
//  TesteIosSwift
//
//  Created by Angélica Andrade de Meira on 27/04/22.
//

import UIKit
import Alamofire

class ComentariosTableViewController: UITableViewController {
    
    var postagemSelecionada: PostagemApresentavel?
    var listaDeComentarios: [ComentarioApresentavel]? = []
    var listaDeFotos: [Data?] = []
    
    // MARK: - View code
    
    private lazy var labelTitulo: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
        if let postagemSelecionada = self.postagemSelecionada {
            
            let textoAtribuido = NSMutableAttributedString(string: "O que a galera comentou sobre:\n", attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)
            ])
            let textoAtribuidoPostagem = NSMutableAttributedString(string: "\(postagemSelecionada.titulo)", attributes: nil)
            textoAtribuido.append(textoAtribuidoPostagem)
            
            self.labelTitulo.attributedText = textoAtribuido
            self.navigationItem.titleView = labelTitulo
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(CelulaComentarioTableViewCell.self, forCellReuseIdentifier: "celulaComentario")
        
        let barButtonSystemItem: UIBarButtonItem.SystemItem
        if #available(iOS 13.0, *) {
            barButtonSystemItem = .close
        } else {
            barButtonSystemItem = .done
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: barButtonSystemItem, target: self, action: #selector(fechar))
        
        buscarComentarios()
    }
    
    @objc func fechar() {
        self.dismiss(animated: true)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeComentarios?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let dadosComentario = self.listaDeComentarios?[indexPath.row],
            let celula = tableView.dequeueReusableCell(withIdentifier: "celulaComentario", for: indexPath) as? CelulaComentarioTableViewCell
        else {
            return UITableViewCell()
        }
        
        celula.labelNome.text = dadosComentario.nome
        celula.labelEmail.text = dadosComentario.e_mail
        celula.labelCorpo.text = dadosComentario.corpo
        
        if let dadoFoto = listaDeFotos[indexPath.row] {
            celula.fotoContato.image = UIImage(data: dadoFoto)
        } else {
            celula.fotoContato.image = UIImage(named: "padrao")
            self.buscarFoto(idDoUsuario: dadosComentario.idUsuario, indexPath: indexPath)
        }
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ComentariosTableViewController {
    func buscarComentarios() {
        if let idPostagemSelecionada = postagemSelecionada?.idPostagem{
            AF.request("https://jsonplaceholder.typicode.com/posts/\(String(describing: idPostagemSelecionada))/comments")
                .validate()
                .responseDecodable(of: [Comentario].self) { [weak self] (resposta) in
                    guard
                        let comentarios = resposta.value,
                        let self = self
                    else { return }
                    
                    self.listaDeComentarios = comentarios
                    for _ in comentarios {
                        self.listaDeFotos.append(nil)
                    }
                    self.tableView.reloadData()
                }
        }
    }
}

extension ComentariosTableViewController {
    func buscarFoto(idDoUsuario: Int, indexPath: IndexPath) {
        AF.request("https://i.pravatar.cc/300?u=\(idDoUsuario)")
            .validate()
            .response { [weak self] (resposta) in
                guard
                    let foto = resposta.value,
                    let self = self
                else { return }
                self.listaDeFotos[indexPath.row] = foto
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
    }
}




