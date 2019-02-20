//
//  ViewController.swift
//  Conversor
//
//  Created by Henrique Menezes da Paixão on 04/02/2019.
//  Copyright © 2019 Henrique Menezes da Paixão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UITextField!
    @IBOutlet weak var lbTextResult: UILabel!
    @IBOutlet weak var lbTittleConversion:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func showNext(_ sender: UIButton) {
        
        switch lbTittleConversion.text! {
        case "Temperatura":
            lbTittleConversion.text = "Peso"
            btUnit1.setTitle("Quilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            lbTittleConversion.text = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dólar", for: .normal)
        case "Moeda":
            lbTittleConversion.text = "Distância"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Quilômetro", for: .normal)
        default:
            lbTittleConversion.text = "Temperatura"
            btUnit1.setTitle("Celsius", for: .normal)
            btUnit2.setTitle("Farenheit", for: .normal)
        }
        convert(nil)
    }
   
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit1.alpha = 1.0
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
                btUnit2.alpha = 1.0
            }
            
        }
            conversion()
    }
    
    private func conversion(){
        switch lbTittleConversion.text!{
        case "Temperatura":
            calcularTemperatura()
            
        case "Peso":
            calcularPeso()
            
        case "Moeda":
            calcularMoeda()
            
        default:
            calcularDistancia()
            
        }
        
        view.endEditing(true)
        let result = Double(lbResult.text!)
        lbResult.text = String.init(format: "%.2f", result!)
    }
    
    
    func calcularTemperatura(){
        guard let temperatura = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            lbTextResult.text = "Farenheit"
            lbResult.text = String(temperatura * 1.8 + 32.0)
        }else{
            lbTextResult.text = "Celsius"
            lbResult.text = String((temperatura - 32.0) / 1.8)
        }
    }
    
    func calcularPeso(){
        guard let peso = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            lbTextResult.text = "Libra"
            lbResult.text = String(peso / 2.2046)
        }else{
            lbTextResult.text = "Quilograma"
            lbResult.text = String(peso * 2.2046)
        }
    }
    
    func calcularMoeda(){
        guard let moeda = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            lbTextResult.text = "Dólar"
            lbResult.text = String(moeda / 3.8)
        }else{
            lbTextResult.text = "Real"
            lbResult.text = String(moeda * 3.8)
        }
    }
    
    func calcularDistancia(){
        guard let distancia = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            lbTextResult.text = "Quilômetro"
            lbResult.text = String(distancia / 1000)
        }else{
            lbTextResult.text = "Metros"
            lbResult.text = String(distancia * 1000)
        }
        
    }
}
