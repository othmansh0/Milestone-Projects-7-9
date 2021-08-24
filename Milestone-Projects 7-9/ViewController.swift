//
//  ViewController.swift
//  Milestone-Projects 7-9
//
//  Created by othman shahrouri on 8/23/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var clueLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var healthLabel: UILabel!
    
    var name:String!
    var solution:String!
    var words = [String]()
    var clues = [String]()
    var unknownStr = [Character]()
    let letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var currentWord:String!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let path = Bundle.main.url(forResource: "level1", withExtension: "txt") {
            if let allWords = try? String(contentsOf: path){
               // print(allWords)
                var lines = allWords.components(separatedBy: "\n")
                //shuffle lines before splitting them into clues and words
                lines.shuffle()
                for line in lines{
                    let parts = line.components(separatedBy: ": ")
                    words.append(parts[0])
                    clues.append(parts[1])
                }
                print(words)
                print(clues)
                startGame()
                
                
            }
            
        }
   
    }
    
    func startGame(){
        
        solution = words[0]
        clueLabel.text = clues[0]
        clueLabel.sizeToFit()
        for _ in solution {
            unknownStr.append("?")
        }
        answerLabel.text = String(unknownStr)
        answerLabel.sizeToFit()
      
//        let button = UIButton(type: .system) // let preferred over var here
//        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
//        button.backgroundColor = .green
//        button.setTitle("Button", for: .normal)
//       // button.addTarget(self, action: nil, for: .touchUpInside)
//       view.addSubview(button)
//
        
    }
    
    
  
    

    @IBAction func letterTapped(_ sender: UIButton) {
       // print(sender.currentTitle)
        print(solution)
     
            if let userAnswer = sender.currentTitle {
                if(solution.contains(userAnswer)){
                   
                    for (index,letter) in solution.enumerated() {
                        if String(letter) == sender.currentTitle{
                            unknownStr[index] = letter
                            answerLabel.text = String(unknownStr)
                            answerLabel.sizeToFit()
                        }
                    }
                    //haunted
                    //???????
                    
                }else{
                    
                    print("no")
                }
                
            }
      
    
        
        
    }
    
}

