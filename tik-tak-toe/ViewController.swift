//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Sebastian Hette on 10.10.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 == cross / 2 == nought
    var currentPlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winnerIf = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    var gameOn = true
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: AnyObject) {
        if (gameState[sender.tag-1] == 0 && gameOn == true)
        {
            gameState[sender.tag-1] = currentPlayer
            
            if (currentPlayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                currentPlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                currentPlayer = 1
            }
        }
        
        for combination in winnerIf {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameOn = false
                
                if gameState[combination[0]] == 1
                {
                    label.text = "Cross has won!"
                }
                else
                {
                    label.text = "Nought has won!"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
        
        gameOn = false
        
        for i in gameState
        {
            if i == 0
            {
                gameOn = true
                break
            }
        }
        
        if gameOn == false
        {
            label.text = "It's a draw!"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameOn = true
        currentPlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

