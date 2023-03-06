//
//  ViewController.swift
//  Lesson2
//
//  Created by Modest Surmach on 04.03.2023.
//

import UIKit

class ViewController: UIViewController {

    
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButtons()
        
    }


    @IBAction func firsButtonPushed() {

    }
    
    @IBAction func secondButtonPushed() {
    }
    
    @IBAction func thirdButtonPushed() {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
        self.present(controller, animated: true)
        
    }
    
    
    func createButtons() {
        createFirstButton()
        createSecondButton()
        createThirdButton()
    }
    
    
    func createFirstButton() {
        
        let button = firstButton
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([        button.heightAnchor.constraint(equalToConstant: 50),
                                             button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                                             button.centerXAnchor.constraint(equalTo: view.centerXAnchor)])

        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(firsButtonPushed), for: .touchUpInside)
        
        var config = UIButton.Configuration.filled()
        config.buttonSize = .small
        config.title = "First Button"
        config.image = UIImage(systemName: "arrowshape.forward")
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.baseBackgroundColor = .blue
        button.configuration = config
       
    }
    
    func createSecondButton() {
        
        let button = secondButton
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([        button.heightAnchor.constraint(equalToConstant: 50),
                                             button.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 25),
                                             button.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(secondButtonPushed), for: .touchUpInside)
        
        var config = UIButton.Configuration.filled()
        config.buttonSize = .small
        config.title = "Second Medium Button"
        config.image = UIImage(systemName: "arrowshape.forward")
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.baseBackgroundColor = .blue

        button.configuration = config

    }
    
    func createThirdButton() {
        
        let button = thirdButton
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([        button.heightAnchor.constraint(equalToConstant: 50),
                                             button.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 25),
                                             button.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(thirdButtonPushed), for: .touchUpInside)
        
        var config = UIButton.Configuration.filled()
        config.buttonSize = .small
        
        config.title = "Third"
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.image = UIImage(systemName: "arrowshape.forward")
        config.baseBackgroundColor = .blue
        button.configuration = config
    }
    


}

extension UIButton {
    func touchIn() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, .curveEaseOut]) {
            self.transform = .init(scaleX: 0.5, y: 0.5)
        }
    }
    
    func touchEnd() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, .curveEaseOut]) {
            self.transform = .identity
        }
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchIn()
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchEnd()
    }
}
