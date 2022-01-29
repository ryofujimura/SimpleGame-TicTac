//
//  ViewController.swift
//  SimpleGame-TicTac
//
//  Created by ryo fuj on 1/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //1 is cross.fill
    var gameState = [0,0,0,0,0,0,0,0,0]
//    let config = UIImage.SymbolConfiguration(font: System 80.0 )
    let winningCombinaitons = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    var playaerOneScore = 0
    var playaerTwoScore = 0
    
    @IBOutlet weak var playerOne: UILabel!
    @IBOutlet weak var playerTwo: UILabel!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func actionTic(_ sender: UIButton) {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true){
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1){
                sender.setImage(UIImage(systemName: "cross.fill"), for: UIControl.State())
                activePlayer = 2
            }
            else{
                sender.setImage(UIImage(systemName: "circle.fill"), for: UIControl.State())
                activePlayer = 1
            }
        }
        for combination in winningCombinaitons{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                if gameState[combination[0]] == 1{
                    label.text = "Cross has Won"
                    playaerOneScore = playaerOneScore + 1
                    playerOne.text = "\(playaerOneScore)"
                }
                else{
                    label.text = "Circle has Won"
                    playaerTwoScore = playaerTwoScore + 1
                    playerTwo.text = "\(playaerTwoScore)"
                }
                playAgainButton.isHidden = false
                label.isHidden = false
                reset.isHidden = false
            }
        }
        gameIsActive = false
        for i in gameState{
            if  i == 0{
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false{
            label.text = "Draw"
            label.isHidden = false
            playAgainButton.isHidden = false
            reset.isHidden = false
        }
    }
    
    @IBOutlet weak var reset: UIButton!
    @IBAction func resetAll(_ sender: Any) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        reset.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(UIImage(systemName: "square"), for: UIControl.State())
        }
        playaerOneScore = 0
        playaerTwoScore = 0
    }
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        reset.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(UIImage(systemName: "square"), for: UIControl.State())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

