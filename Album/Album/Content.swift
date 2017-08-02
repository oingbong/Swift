import UIKit

class Content: UIViewController {

    // MARK : - Variable
    @IBOutlet weak var ContentImageView: UIImageView!
    @IBOutlet weak var ContentLabel: UILabel!
    
    var PageIndex = Int()
    var ContentImage = String()
    var ContentText = String()
    // Variable_End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContentImageView.image = UIImage(named: ContentImage)
        ContentLabel.text = ContentText
    }
}
