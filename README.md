# friendlychat

[구글 코드랩스의 Building Beautiful UIs with Flutter](https://codelabs.developers.google.com/codelabs/flutter/index.html#0)에
대한 코드에 [파이어베이스 연동](https://github.com/flutter/friendlychat-steps) 코드를 저장합니다.

각 step 별로 커밋을 합니다.

## 파이어어베이스 연동하기 (iOS)

코드랩스의 문서에서는 파이어베이스 연동하는 법에 대해 모호하게 나와있습니다.
일단 파이어베이스 콘솔에서 iOS에 대한 GoogleService-Info.plist 를 다운 받은 뒤
`open ios/Runner.xcworkspace` 명령을 통해 xcode로 프로젝트를 엽니다. 
이후 좌측의 project 뷰에서 Runner 폴더를 우클릭 한 뒤 `Add new files to "Runner"...`를
선택합니다. 아래의 옵션에서 `Copy items if needed`를 선택하고,
다운받은 GoogleService-Info.plist를 선택하여, 프로젝트에 추가합니다.

파일을 추가한 이후에는 초기화 코드를 추가해야 합니다. ios/Runner/AppDelegate.m 파일을 열고
`@implementation` 문구 위에 `@import Firebase;` 를 추가합니다. 이 때, 반드시 `;`를 추가해야합니다.
이후 같은 파일에 선언되어 있는 함수 내부의 최상단에 `[FIRApp configure];`를 추가합니다.