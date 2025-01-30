import List  from "@ohos.util.List" ;
import {Setting} from "./Setting"
import {AI} from "./AI"

@Entry
@Component
struct Index {
  @State pathStack: NavPathStack = new NavPathStack();
  @State selectIndex:number = 0

  @Builder
  tabBuilder() {
    Row() {
      ForEach([['AI',$rawfile("AI.svg")],['设置',$rawfile("setting.svg")]], (item: List<string>, index) => {
        Column() {
          if(this.selectIndex == index ){
            Image(item[1])
              .width("15%")
              .height("70%")
            Text(item[0])
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .margin({top:"3%"})
          } else {
            Image(item[1])
              .fillColor("#C0C0C0")
              .width("15%")
              .height("70%")
            Text(item[0])
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor("#C0C0C0")
              .margin({top:"3%"})
          }
        }
        .height("100%")
        .layoutWeight(1)
        .justifyContent(FlexAlign.End)
        .padding({ top: 5, bottom: 5 })
        .onClick(() => {
          this.selectIndex = index;
        })
      })
    }
    .height("100%")
    .width('100%')
  }

  build() {
    Navigation(this.pathStack) {
      Row(){
        Text("LLMchat")
          .margin({right:"5%"})
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Image($r("app.media.icon"))
          .height("6%")
      }
      .margin({top:"5%"})
      if (this.selectIndex === 0) {
        AI()
      } else if (this.selectIndex === 1) {
        Setting()
      } else {}
    }
    .height('100%')
    .hideTitleBar(true)
    .navBarWidth('50%')
    .mode(NavigationMode.Stack)
    .hideNavBar(false)
    .toolbarConfiguration(this.tabBuilder)
  }
}