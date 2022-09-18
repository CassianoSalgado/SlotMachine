//
//  RegrasViewController.swift
//  SlotMachine
//
//  Created by Cassiano Carradore Salgado on 09/09/22.
//

import UIKit

class RegrasViewController: UIViewController {
    @IBOutlet var imagemRegras: [UIImageView]!
    @IBOutlet var textosRegras: [UILabel]!
    
    var contador = 0
    let nomeImagem = ["slot1.png", "slot2.png", "slot3.png","slot4.png", "slot5.png", "slot6.png", "slot7.png", "slot8.png", "slot9.png"]
    let icones: [String: Int] = [
        "slot1.png": 500,
        "slot2.png": 100,
        "slot3.png": 100,
        "slot4.png": 100,
        "slot5.png": 100,
        "slot6.png": 1000,
        "slot7.png": 100,
        "slot8.png": 300,
        "slot9.png": 100
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper.png")!)

        for imagem in imagemRegras {
            if let imagemAtual = icones[nomeImagem[contador]] {
                textosRegras[contador].text = ": \(imagemAtual) créditos"
            }
            imagem.layer.cornerRadius = 10.0
            imagem.image = UIImage(named: nomeImagem[contador])
            contador += 1
        }
    }

}
