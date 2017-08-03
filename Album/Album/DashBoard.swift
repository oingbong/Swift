import UIKit

class DashBoard: UIViewController, UIPageViewControllerDataSource {
    
    
// MARK: - Variable
    @IBOutlet weak var PageView: UIView!
    
    var ContentImageData = NSArray()
    var ContentTextData = NSArray()
// Variable_End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Data //
        ContentImageData = ["1-1.jpg", "1-2.jpg", "1-3.jpg"]
        ContentTextData = ["1 Page", "2 Page", "3 Page"]
        

        /*
            0-1. 처음 화면 정의(initialView 를 Content에 있는 것으로 사용합니다, 형태는 VC)
            0-2. Array 형식으로 viewVC 정의
            1. storyBaord 에 있는 PageViewVC 라는 id 가진 것을 가져옵니다.
            2. PageViewVC 를 PageView 에 크기를 맞추겠다는 의미
            3. PageViewVC 를 PageView 에 추가시키겠다는 의미
            4. 하위에 있는 ViewController를 등록하기
            5. View : 그냥 보여주기 / ViewController : 여러 기능 동작
                하위(PageViewController)에 있는 VC의 명령어 및 기능까지 상위(PageView)로 다 가져오겠다는 의미
            6. dataSource 외부가 아닌 밑에 만들어놓은 것에서 가져옵니다.
            7. 가지고 있는 VC 를 등록합니다. 0-2 정의한 것 등록합니다.
         */
        
        // Layout //
        let InitialView = ContentVCIndex(index: 0) as Content // 0-1
        let ViewController = NSArray(object: InitialView) //0-2
        
        let PageVC = self.storyboard?.instantiateViewController(withIdentifier: "PageVC") as! UIPageViewController // 1
        PageVC.view.frame = PageView.bounds // 2
        PageView.addSubview(PageVC.view) // 3
        addChildViewController(PageVC) // 4
        PageVC.didMove(toParentViewController: self) // 5
        PageVC.dataSource = self // 6
        PageVC.setViewControllers(ViewController as? [UIViewController], direction: .forward, animated: true, completion: nil) // 7
    }

// MARK : - Page View
    func ContentVCIndex(index: Int) -> Content {
        
        if ContentTextData.count == 0 || index >= ContentTextData.count{
            return Content()
        }
        
        let ContentVC = self.storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! Content
        
        ContentVC.PageIndex = index
        ContentVC.ContentImage = ContentImageData[index] as! String
        ContentVC.ContentText = ContentTextData[index] as! String
        
        return ContentVC
    }
    
    // 현재 페이지에서 이전화면 처리
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let ContentVC = viewController as! Content
        var PageIndex = ContentVC.PageIndex as Int
        
        // 오류방지
        if PageIndex == 0 || PageIndex == NSNotFound {
            return nil // 아무것도 하지 않습니다.
        }
        
        PageIndex -= 1 // 이전화면이므로 인덱스값을 1 줄입니다
        
        return ContentVCIndex(index: PageIndex)
    }
    
    // 현재 페이지에서 이후화면 처리
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let ContentVC = viewController as! Content
        var PageIndex = ContentVC.PageIndex as Int
        
        // 오류방지
        if PageIndex == NSNotFound {
            return nil
        }
        
        PageIndex += 1
        
        // 마지막 화면인 경우
        if PageIndex == ContentTextData.count {
            return nil
        }
        
        return ContentVCIndex(index: PageIndex)
    }
// Page View_End
    
}
