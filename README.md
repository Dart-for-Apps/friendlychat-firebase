# friendlychat

[구글 코드랩스의 Building Beautiful UIs with Flutter](https://codelabs.developers.google.com/codelabs/flutter/index.html#0) 의
대한 코드에 [파이어베이스 연동](https://github.com/flutter/friendlychat-steps/files/2296209/OriginalFirebaseforFlutterCodelab.pdf)
코드를 추가 하였습니다.
각 step 별로 커밋을 합니다.

구글이 작성한 코드랩 샘플 코드는 [여기](https://github.com/flutter/friendlychat-steps/files/2296209/OriginalFirebaseforFlutterCodelab.pdf) 서
확인하실 수 있습니다.

## 파이어어베이스 연동하기 

### iOS

코드랩스의 문서에서는 파이어베이스 연동하는 법에 대해 모호하게 나와있습니다.
일단 파이어베이스 콘솔에서 iOS에 대한 GoogleService-Info.plist 를 다운 받은 뒤
`open ios/Runner.xcworkspace` 명령을 통해 xcode로 프로젝트를 엽니다. 
이후 좌측의 project 뷰에서 Runner 폴더를 우클릭 한 뒤 `Add new files to "Runner"...`를
선택합니다. 아래의 옵션에서 `Copy items if needed`를 선택하고,
다운받은 GoogleService-Info.plist를 선택하여, 프로젝트에 추가합니다.

파일을 추가한 이후에는 초기화 코드를 추가해야 합니다. ios/Runner/AppDelegate.m 파일을 열고
`@implementation` 문구 위에 `@import Firebase;` 를 추가합니다. 이 때, 반드시 `;`를 추가해야합니다.
이후 같은 파일에 선언되어 있는 함수 내부의 최상단에 `[FIRApp configure];`를 추가합니다.

`ios/Runner/Info.plist` 파일의 최초 `<dict>` 태그 안에 아래의 코드를 추가합니다.
```plist
<key>CFBundleURLTypes</key>
  <array>
      <dict>
         <key>CFBundleTypeRole</key>
         <string>Editor</string>
         <key>CFBundleURLSchemes</key>
         <array>
         <!­­ reverse url of your client id, for example: ­­>
<string>com.googleusercontent.apps.462578386393­kisbgopib3t6plf4dgv3s0n4ur3sv
jmo</string>
         <!­­ bundle id, for example: ­­>
            <string>com.yourcompany.friendlychat</string>
         </array>
      </dict>
  </array>
```


### 안드로이드

iOS 과정과 동일하게 파이어베이스 콘솔에서 안드로이드 용 google-services.json 을 받습니다.
받는 과정은 코드랩 문서를 참조합니다. 다운 받은 json 파일은 `android/app` 폴더로 이동합니다.
이후, json 파일을 다운로드하는 페이지의 스텝 3에서 Firebase SDK의
버전을 확인합니다. 이후 아래의 코드들을 각 파일들에 기록합니다.

**android/build.gradle**
```gradle
buildscript {
   // 기존 스크립트
    dependencies {
        // 기존 디펜던시 스크립트에 아래 한 줄 추가, 버전은 자신의 버전에 맞도록
        classpath 'com.google.gms:google-services:3.2.1'
    }
}
```

**android/app/build.gradle**
```gradle
// 파일 최하단에 추가
apply plugin: 'com.google.gms.google-services'
```

#### com.android.support 관련 에러가 발생할 경우
`android/build.gradle` 파일에 아래의 코드를 추가합니다.
```gradle
// 기존 스크립트
subprojects {
    // 기존 스크립트에 아래의 코드 추가
    project.configurations.all {
     resolutionStrategy.eachDependency { details ->
        if (details.requested.group == 'com.android.support'
              && !details.requested.name.contains('multidex') ) {
           details.useVersion "27.1.1"
        }
     }
  }
}
```

#### Goolge Signin 사용을 위한 디지털 지문 등록

[이 문서](https://developer.android.com/studio/publish/app-signing?hl=ko) 와
[이 문서](https://developers.google.com/android/guides/client-auth?hl=ko) 참조