//
//  OnBoardingViewController.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 12.05.2023.
//
import UIKit
import SnapKit

class OnBoardingViewController: UIViewController {
    lazy var pageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    lazy var onBoardingView = OnBoardingPageView()


    lazy var pageScrollView = UIScrollView()
    lazy var pageIndicator = InteractivePageIndicator(pages: OnBoardingPage.all.count)

    lazy var pageChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = UIColor(named: "purple")
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        modalPresentationStyle = .fullScreen
        modalTransitionStyle = .flipHorizontal
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setupConatraints()
        configurePages(OnBoardingPage.all)
        configureScrollView()
//        navigationItem.hidesBackButton = true
    }

    @objc
    private func continueButtonTapped() {
        let page = currentPage()
        if page < OnBoardingPage.all.count - 1 {
            setPage(page + 1)
        } else {
//            let authVC = AuthViewController()
//            UserDefaults.standard.hasOnboarded = true
//            print(UserDefaults.standard.hasOnboarded)
//            navigationController?.pushViewController(authVC, animated: true)
        }
    }
}


extension OnBoardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = calculateScrollProgress()
        pageIndicator.setPage(page)
    }

    func currentPage() -> Int {
        Int(calculateScrollProgress())
    }


    func setPage(_ page: Int) {
        let pageWidth = pageScrollView.frame.width
        pageScrollView.setContentOffset(.init(x: pageWidth * CGFloat(page), y: 0), animated: true)
    }


    private func calculateScrollProgress() -> Float {
        let offset = pageScrollView.contentOffset.x
        let pageWidth = pageScrollView.frame.width
        let currentPage = floor(offset / pageWidth)
        let pageDelta = offset - currentPage * pageWidth
        let page =  currentPage + pageDelta / pageWidth
        return Float(page)
    }
}


// MARK: - configure UI and constraints
extension OnBoardingViewController {
    private func addViews() {
        view.addSubview(pageContainerView)
        view.addSubview(pageChangeButton)
        pageContainerView.addSubview(pageScrollView)
        pageContainerView.addSubview(pageIndicator)
    }


    private func setupConatraints() {
        pageContainerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(120)
        }
        pageScrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(108)
        }
        pageChangeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pageContainerView.snp.bottom)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(56)
            make.bottom.equalToSuperview().inset(50)
        }

        pageIndicator.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(376)
            make.centerX.equalToSuperview()
        }
    }

    private func configureScrollView() {
        pageScrollView.delegate = self
        pageScrollView.isPagingEnabled = true
        pageScrollView.showsHorizontalScrollIndicator = false
    }

    private func configurePages(_ pages: [OnBoardingPage]) {
        pageScrollView.subviews.forEach { $0.removeFromSuperview() }
        let pageViews = pages.map { page in
            let pageView = OnBoardingPageView()
            pageView.configure(onboarding: page)
            return pageView
        }
        for (index, pageView) in pageViews.enumerated() {
            pageScrollView.addSubview(pageView)
            pageView.snp.makeConstraints { make in
                if index == 0 {
                    make.leading.equalTo(pageScrollView.contentLayoutGuide)
                } else {
                    make.leading.equalTo(pageViews[index - 1].snp.trailing)
                }
                make.top.bottom.equalTo(pageScrollView.contentLayoutGuide)
                make.width.height.equalToSuperview()
                if index == pageViews.count - 1 {
                    make.trailing.equalTo(pageScrollView.contentLayoutGuide)
                }
            }
        }
    }
}


