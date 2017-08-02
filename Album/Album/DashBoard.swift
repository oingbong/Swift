import UIKit

class DashBoard: UIViewController {
    
    
// MARK: - Variable
    @IBOutlet weak var PageView: UIView!
// Variable_End
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
            1. storyBaord 에 있는 PageViewVC 라는 id 가진 것을 가져옵니다.
            2. PageViewVC 를 PageView 에 크기를 맞추겠다는 의미
            3. PageViewVC 를 PageView 에 추가시키겠다는 의미
            4. 하위에 있는 ViewController를 등록하기
            5. View : 그냥 보여주기 / ViewController : 여러 기능 동작
                하위(PageViewController)에 있는 VC의 명령어 및 기능까지 상위(PageView)로 다 가져오겠다는 의미
         */
        
        let PageVC = self.storyboard?.instantiateViewController(withIdentifier: "PageVC") as! UIPageViewController // 1
        PageVC.view.frame = PageView.bounds // 2
        PageView.addSubview(PageVC.view) // 3
        addChildViewController(PageVC) // 4
        PageVC.didMove(toParentViewController: self) // 5
    }

}
