//
//  ViewController.swift
//  SlotMachine
//
//  Created by Aluno on 05/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imagens: [UIImageView]!
    @IBOutlet weak var bigWin: UIImageView!
    @IBOutlet weak var jogar: UIButton!
    @IBOutlet weak var creditos: UILabel!
    
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
    
    var credito = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper.png")!)
        bigWin.alpha = 0
        jogar.tintColor = UIColor.init(red: 235/255, green: 29/255, blue: 54/255, alpha: 1.0)
        bigWin.layer.cornerRadius = 10.0
        creditos.text = "Créditos: \(credito)"
        
        for imagem in imagens {
            imagem.layer.cornerRadius = 10.0
            imagem.image = UIImage(named: "slot1.png")
        }
    }

    @IBAction func sortear(_ sender: Any) {
        var contador = 0
        bigWin.alpha = 0
        var primeiraImagem = ""
        
        if credito >= 10 {
            credito -= 10
            creditos.text = "Créditos: \(credito)"
            
            for imagem in imagens {
                let imagemAleatoria = nomeImagem.randomElement()!
                imagem.image = UIImage(named: imagemAleatoria)
                
                if primeiraImagem == imagemAleatoria {
                    contador += 1
                    
                } else if primeiraImagem == "" {
                    primeiraImagem = imagemAleatoria
                    
                } else {
                    contador = 0
                    primeiraImagem = ""
                }
                
                if contador == 2 {
                    bigWin.alpha = 1
                    credito += icones[imagemAleatoria]!
                    creditos.text = "Créditos: \(credito)"
                }
            }
            
        } else {
            creditos.text = "Sem créditos"
        }
    }
    
    @IBAction func adicionarCredito(_ sender: Any) {
        credito += 10
        creditos.text = "Créditos: \(credito)"
    }
    
}


