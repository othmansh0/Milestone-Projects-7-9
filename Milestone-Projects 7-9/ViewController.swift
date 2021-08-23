//
//  ViewController.swift
//  Milestone-Projects 7-9
//
//  Created by othman shahrouri on 8/23/21.
//

import UIKit

class ViewController: UIViewController {
    var level=0
    var words = [String]()
    var clues = [String]()
    
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
                
                
            }
        }
        
    
    
    }
    


}

