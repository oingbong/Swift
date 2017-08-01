import UIKit

class Main: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
// MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // for Label and Connect Supporting File
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCell
        Cell.TitleLabel.text = Data[indexPath.row]["TitleLabel"]
        
        // for Image and Connect Supporting File
        let TitleImageName = Data[indexPath.row]["TitleImage"]
        let TitleImage = UIImage(named: TitleImageName!)
        Cell.TitleImageView.image = TitleImage
        

        
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        self.performSegue(withIdentifier: "ToDashBoard", sender: self)
    }
// CollectionView_End
}

