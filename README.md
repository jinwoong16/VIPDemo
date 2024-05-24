# View - Interactor - Presenter Demo

## Motivation
앱스쿨을 진행하면서 멘토님에게 새로운 아키텍처 패턴을 하나 소개 받았습니다. Clean Swift라고도 불리는 VIP패턴인데요.
해당 패턴을 SwiftData와 함께 사용하여 간단한 TODO 앱을 하나 작성해보았습니다. 처음 써보는 패턴이라... 잘못되거나 어색한 부분을 알려주시면 감사하겠습니다.

## VIP, a circular architecture pattern

![alt text](/Assets/vip-pattern.png)

VIP패턴은 기존의 다른 패턴들과는 다르게 의존성이 원을 그리는 형태입니다. `ViewController`는 `Interactor`를, `Interactor`는 `Presenter`를, `Presenter`는 `ViewcController`에 의존하는데, 이러한 형태여서 강한 참조 사이클을 형성할 수 있는 형태입니다. 그걸 방지하기 위해 `Presenter`는 `ViewController`를 weak하게 쥐는 것으로 해결했습니다.
또 이러한 형태이기에 모든 의존성이 생성자를 통한 주입이 불가능 합니다. 그래서 어느 한 의존성은 속이 비어있는 껍데기로 만든 다음, 그것을 필요로하는 의존성을 만들고, 다시 이것을 필요로하는 의존성을 만든 후, 껍데기를 채우는 형태로 진행해야 합니다.

그 최초의 껍데기는 `ViewController`가 됩니다. 그래서 ViewController의 의존성은 최소 internal 레벨 이상으로 유지되어야 합니다. 외부에서 직접적으로 접근이 가능하다는거에요.
```swift
final class MySceneViewController: UIViewController {
    ...
    var interactor: Interactor?

    ...
}

let viewController = MySceneViewController()

 // dependency inject by initializer
let presenter = MyScenePresenter(viewController: viewController)
let interactor = MySceneInteractor(presenter: presenter)

viewController.interactor = interactor // dependency inject by property
```

`ViewController`가 캡슐화되지 못했다는 부분이 부분이 VIP를 사용하면서 느낀 가장 아쉬운 부분입니다. 아직까진 큰 위험을 마주하진 못했으나 프로젝트의 복잡성이 증가하면 어떻게 될지 모르겠습니다. 😥

