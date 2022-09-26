import UIKit
import SnapKit
class ViewController: UIViewController {
    
    // MARK: - Override properties
    // MARK: - Public properties
    // MARK: - Private properties
    
    private  let mainSquare = UIView()
    // MARK: - IBOutlets
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainSquare)
        
        mainSquare.backgroundColor = .white
        
        mainSquare.snp.makeConstraints { make in
            
            make.top
                .equalTo(self.view)
                .offset(50)
            make.leading.equalTo(self.view).offset(5)
            make.trailing.equalTo(self.view).offset(-5)
            make.bottom
                .equalTo(self.view)
                .offset(-50)
        }
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        mainSquare.addGestureRecognizer(gesture)
        
    }
    
    // MARK: - Public methods
    // MARK: - Private methods
    
    @objc private func handleTap(sender:UITapGestureRecognizer) {
        
        guard   let currentView = sender.view else {
            return
        }
        for _ in 0...2 {
            let square = UIView()
            currentView.addSubview(square)
            
            square.snp.makeConstraints{make in
                let randomSize = Int.random(in: 1...Int(currentView.frame.width/2))
                let topStep = Int.random(in:1...Int(currentView.frame.height) - randomSize)
                let leftStep = Int.random(in: 1...Int(currentView.frame.width) - randomSize)
                
                make.leading.equalToSuperview().offset(leftStep)
                make.top.equalToSuperview().offset(topStep)
                
                make.height.width.equalTo(randomSize)
                
            }
            
            randomColor(colorView: square)
            
            let myGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            square.addGestureRecognizer(myGesture)
        }
        
    }
    
    private  func randomColor(colorView :UIView) {
        let randomRed = Int.random(in :1...255)
        let randomGreen = Int.random(in :1...255)
        let randomBlue = Int.random(in :1...255)
        colorView.backgroundColor = UIColor(red: CGFloat(randomRed)/255, green: CGFloat(randomGreen)/255, blue:CGFloat(randomBlue)/255, alpha: 1)
        colorView.layer.borderWidth = 1
        colorView.layer.borderColor = UIColor.black.cgColor
    }
    // MARK: - IBActions
    
    
    
    
    
    
    
}
