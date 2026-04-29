
import UIKit

class ViewController: UIViewController {
    
    var isPlaying: Bool = true {
        didSet {
//            playButton.isSelected = isPlaying
            let image = isPlaying ? UIImage(systemName: "pause.fill") : UIImage(systemName: "play.fill")
            playButton.setImage(image, for: .normal)
        }
    }
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var reverseBackgroundView: UIView!
    @IBOutlet weak var playBackgroundView: UIView!
    @IBOutlet weak var forwardBackgroundView: UIView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        [reverseBackgroundView, playBackgroundView, forwardBackgroundView].forEach { view in
            view.layer.cornerRadius = view.frame.height / 2
            view.clipsToBounds = true
            view.alpha = 0
        }
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        isPlaying.toggle()
        
        if isPlaying {
            UIView
                .animate(
                    withDuration: 0.8,
                    delay: 0,
                    usingSpringWithDamping: 0.6,
                    initialSpringVelocity: 0.1) {
                        self.albumImageView.transform = .identity
                    }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
        print("touch down")
    }
    
    @IBAction func touchedUpInside(_ sender: UIButton) {
       print("touch up inside")
    }
    
}

