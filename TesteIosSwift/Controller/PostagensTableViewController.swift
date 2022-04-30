//
//  PostagensTableViewController.swift
//  TesteIosSwift
//
//  Created by Angélica Andrade de Meira on 27/04/22.
//

import UIKit
import Alamofire
import Foundation

class PostagensTableViewController: UITableViewController {
    
    var listaDePostagens: [PostagemApresentavel]? = []
    var postagemSelecionada: PostagemApresentavel?
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.title = "Postagens Recentes"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(CelulaPostagemTableViewCell.self, forCellReuseIdentifier: "celulaPostagem")
        buscarPostagens()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDePostagens?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "celulaPostagem", for: indexPath) as? CelulaPostagemTableViewCell
        else { return UITableViewCell() }
        
        let dadosPostagem = listaDePostagens?[indexPath.row]
        
        celula.textLabel?.text = dadosPostagem?.titulo
        celula.detailTextLabel?.text = dadosPostagem?.corpo
        celula.textLabel?.numberOfLines = 0
        celula.detailTextLabel?.numberOfLines = 0
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.postagemSelecionada = self.listaDePostagens?[indexPath.row]
        let viewDestino = ComentariosTableViewController()
        viewDestino.postagemSelecionada = self.postagemSelecionada
        self.present(UINavigationController(rootViewController: viewDestino), animated: true)
    }
}

extension PostagensTableViewController {
    func buscarPostagens() {
        AF.request("https://jsonplaceholder.typicode.com/posts")
            .validate()
            .responseDecodable(of: [Postagem].self) { (resposta) in
                guard let postagens = resposta.value else { return }
                self.listaDePostagens = postagens
                self.tableView.reloadData()
            }
    }
}
