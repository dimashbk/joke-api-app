//
//  ViewController.swift
//  Laugh!
//
//  Created by Dinmukhamed on 15.01.2023.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    var jokeLabel = UILabel()
    let nextButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
    }
    @objc func jokeButton() {
        let request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Any?safe-mode")!)
        
        let task = URLSession.shared.dataTask(with: request){  data, response, error in
            if let data = data, let joke = try?  JSONDecoder().decode(Joke.self, from: data){
                DispatchQueue.main.async { [self] in
                    self.jokeLabel.text = joke.setup
                    print(jokeLabel.text!)
                    jokeLabel.sizeToFit()
                }
            }
        }
        task.resume()
        
    }
}


extension ViewController{
    private func initialize(){
        jokeLabel.text = "hui"
        view.addSubview(jokeLabel)
        view.addSubview(nextButton)
        jokeLabel.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(50)
        }
        
        nextButton.backgroundColor = .blue
        nextButton.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(jokeLabel).inset(40)
        }
        nextButton.addTarget(self, action: #selector(jokeButton), for: .touchUpInside)
    }
}
    



