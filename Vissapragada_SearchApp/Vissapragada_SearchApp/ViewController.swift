//
//  ViewController.swift
//  Vissapragada_SearchApp
//
//  Created by Vissapragada,Sai Tejaswee on 3/3/22.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButtonAction: UIButton!
    
    @IBOutlet weak var ShowPrevImagesBtn: UIButton!
    
    @IBOutlet weak var showNextImagesBtn: UIButton!
    
    @IBOutlet weak var topicInfoText: UITextView!
    @IBOutlet weak var resetBtn: UIButton!
    var arr = [["george","irfan","joey","sushant","denzel"],["dog","elephant","tiger","zebra","giraffe"],["pes","battlefield","cod","farcry","mortalcombat"]]
        
        var actors_keywords = ["actor","hero","film","movie"]
        
        var animals_keywords = ["animal","pet","wild","jungle"]
        
        var games_keywords = ["game","player","multi","ps"]
        
        var topics_array = [["George Timothy Clooney is an American actor and filmmaker. He is the recipient of numerous accolades, including a British Academy Film Award, four Golden Globe Awards","Irrfan Khan, also known simply as Irrfan, was an Indian actor who worked in Hindi cinema as well as British and American films","Joey does not share food","Sushant Singh Rajput was an Indian actor known for his work in Hindi cinema.","actor who reconfigured the concept of classic movie stardom"],["I will always woof you.","No one in the world needs an elephant tusk but an elephant","The most magnificent creature in the entire world","are you black with white stripes? ","Evolution is so creative. That's how we got giraffes"],["football multiplayer game","If you want to be a victor in the battlefield, go on your knees. Call upon the God of all victories","No Man Fights Alone. In the war that changed the world, no one fought alone.","Vaas : The world is a diagonal... I am the balancing point","Fatality!! We knew this one was coming!"]]
    var imageNumber: Int = 0
       var k = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchButtonAction.isEnabled = true
               ShowPrevImagesBtn.isHidden = true
               showNextImagesBtn.isHidden = true
               resetBtn.isHidden = true
               resultImage.image = UIImage(named: "info")
               topicInfoText.isHidden = false
               topicInfoText.text! = ""
    }

    @IBAction func searchButtonActionClicked(_ sender: UIButton) {
        imageNumber = 0
           let key = searchTextField.text!
               resetBtn.isHidden = false
               ShowPrevImagesBtn.isEnabled = false
               showNextImagesBtn.isEnabled = true
               
             if actors_keywords.contains(key)
               {
                 k = 0
                  updateUI(k,imageNumber)
                 
               }
               else if animals_keywords.contains(key)
               {
                   k = 1
                   updateUI(k,imageNumber)
                   
               }
               else if games_keywords.contains(key)
               {
                   k = 2
                   updateUI(k,imageNumber)
                   
               }
               else
               {
                   resultImage.image = UIImage(named: "notfound")
                   ShowPrevImagesBtn.isHidden = true
                   showNextImagesBtn.isHidden = true
                   topicInfoText.text! = ""
                   searchTextField.text!=""
               }
    }
    
    @IBAction func ShowPrevImagesBtnClicked(_ sender: UIButton) {
        imageNumber -= 1
               updateUI(k,imageNumber)
               ShowPrevImagesBtn.isEnabled = true
                              
               if(imageNumber == arr[0].count-1)
               {
               showNextImagesBtn.isEnabled = false
               }
    }

    @IBAction func showNextImagesBtnClicked(_ sender: UIButton) {
        imageNumber += 1
               updateUI(k,imageNumber)
               ShowPrevImagesBtn.isEnabled = true
                              
               if(imageNumber == arr[0].count-1)
               {
               showNextImagesBtn.isEnabled = false
               }
    }
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        imageNumber = 0
                searchButtonAction.isHidden = true
                ShowPrevImagesBtn.isHidden = true
                showNextImagesBtn.isHidden = true
                resetBtn.isHidden = true
                resultImage.image = UIImage(named: "info")
                topicInfoText.text!=""
                searchTextField.text!=""
    }
    
    
    @IBAction func searchTextFieldChange(_ sender: Any) {
        
              if !searchTextField.text!.isEmpty
              {
                  searchButtonAction.isHidden = false
              }
              
              else
              {
                  searchButtonAction.isHidden = true
              }
    }
    
       func updateUI(_ imageNum : Int, _ imageNumber : Int){
           ShowPrevImagesBtn.isHidden = false
           showNextImagesBtn.isHidden = false
              resultImage.image = UIImage(named: arr[imageNum][imageNumber] )
           topicInfoText.text! = topics_array[imageNum][imageNumber]
              
   }
}

