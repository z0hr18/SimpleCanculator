//
//  KennyViewController.swift
//  SimpleCalculator
//
//  Created by Zohra Guliyeva  on 29.05.24.
//
import UIKit

import UIKit

class KennyViewController: UIViewController {

    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "30"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: 0"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let highScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Highscore: 0"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kenny")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kenny")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kenny")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kenny")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView5: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kenny")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView6: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kenny")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView7: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kenny")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView8: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kenny")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView9: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kenny")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUİ()
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        imageView1.addGestureRecognizer(recognizer1)
        imageView2.addGestureRecognizer(recognizer2)
        imageView3.addGestureRecognizer(recognizer3)
        imageView4.addGestureRecognizer(recognizer4)
        imageView5.addGestureRecognizer(recognizer5)
        imageView6.addGestureRecognizer(recognizer6)
        imageView7.addGestureRecognizer(recognizer7)
        imageView8.addGestureRecognizer(recognizer8)
        imageView9.addGestureRecognizer(recognizer9)
        
        kennyArray = [imageView1, imageView2, imageView3, imageView4, imageView5, imageView6, imageView7, imageView8, imageView9]
        
        counter = 10
        timerLabel.text = "\(counter)"
        scoreLabel.text = "Score: \(score)"

        timer = Timer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @objc func increaseScore() {
       score = score + 1
        scoreLabel.text = "Score: \(score)"
    
    }
    
    @objc func countDown() {
       counter = counter - 1
       timerLabel.text = "\(counter)"
        if counter == 0  {
            timer.invalidate() //timeri dayandirir yeni 0-a gelende dayansin
            
            //ALERT
            let alert = UIAlertController(title: "Zaman doldu -_-", message: "Yeniden oynamaq isteyirsen?", preferredStyle: UIAlertController.Style.alert)
            
            let okButton =  UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton =  UIAlertAction(title: "rePLAY", style: UIAlertAction.Style.default) { UIAlertAction in
                //replay function
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func configureUİ() {
        
        // Add labels to the view
        view.addSubview(timerLabel)
        view.addSubview(scoreLabel)
        view.addSubview(highScoreLabel)
        view.backgroundColor = .white
        
        // Set constraints for the labels
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            highScoreLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            highScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Add image views to the view
        view.addSubview(imageView1)
        view.addSubview(imageView2)
        view.addSubview(imageView3)
        view.addSubview(imageView4)
        view.addSubview(imageView5)
        view.addSubview(imageView6)
        view.addSubview(imageView7)
        view.addSubview(imageView8)
        view.addSubview(imageView9)
        
        // Set constraints for the images in a 3x3 grid
        let padding: CGFloat = 10
        let imageSize: CGFloat = (view.frame.width - padding * 4) / 3
        
        NSLayoutConstraint.activate([
            imageView1.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            imageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            imageView1.widthAnchor.constraint(equalToConstant: imageSize),
            imageView1.heightAnchor.constraint(equalToConstant: imageSize),
            
            imageView2.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: padding),
            imageView2.widthAnchor.constraint(equalToConstant: imageSize),
            imageView2.heightAnchor.constraint(equalToConstant: imageSize),
            
            imageView3.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor, constant: padding),
            imageView3.widthAnchor.constraint(equalToConstant: imageSize),
            imageView3.heightAnchor.constraint(equalToConstant: imageSize),
            
            imageView4.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: padding),
            imageView4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            imageView4.widthAnchor.constraint(equalToConstant: imageSize),
            imageView4.heightAnchor.constraint(equalToConstant: imageSize),
            
            imageView5.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: padding),
            imageView5.leadingAnchor.constraint(equalTo: imageView4.trailingAnchor, constant: padding),
            imageView5.widthAnchor.constraint(equalToConstant: imageSize),
            imageView5.heightAnchor.constraint(equalToConstant: imageSize),
            
            imageView6.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: padding),
            imageView6.leadingAnchor.constraint(equalTo: imageView5.trailingAnchor, constant: padding),
            imageView6.widthAnchor.constraint(equalToConstant: imageSize),
            imageView6.heightAnchor.constraint(equalToConstant: imageSize),
            
            imageView7.topAnchor.constraint(equalTo: imageView4.bottomAnchor, constant: padding),
            imageView7.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            imageView7.widthAnchor.constraint(equalToConstant: imageSize),
            imageView7.heightAnchor.constraint(equalToConstant: imageSize),
            
            imageView8.topAnchor.constraint(equalTo: imageView4.bottomAnchor, constant: padding),
            imageView8.leadingAnchor.constraint(equalTo: imageView7.trailingAnchor, constant: padding),
            imageView8.widthAnchor.constraint(equalToConstant: imageSize),
            imageView8.heightAnchor.constraint(equalToConstant: imageSize),
            
            imageView9.topAnchor.constraint(equalTo: imageView4.bottomAnchor, constant: padding),
            imageView9.leadingAnchor.constraint(equalTo: imageView8.trailingAnchor, constant: padding),
            imageView9.widthAnchor.constraint(equalToConstant: imageSize),
            imageView9.heightAnchor.constraint(equalToConstant: imageSize)
        ])
    }
}
