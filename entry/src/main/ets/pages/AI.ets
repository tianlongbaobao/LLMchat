import { webview } from "@kit.ArkWeb";
import preferences from '@ohos.data.preferences';

let context = getContext(this)
@Entry
@Component
export struct AI {
  @State web: string = '';
  controller: webview.WebviewController = new webview.WebviewController()
  aboutToAppear(): void {
    let options: preferences.Options = { name: 'information' };
    let dataPreferences: preferences.Preferences = preferences.getPreferencesSync(context, options)
    this.web = dataPreferences.getSync("web", 'default')+""
    if (this.web == "default"){
      this.web = ""
    }
  }
  build() {
    Column() {
      if (this.web == "default" || this.web == "") {
        Column() {
          Text("未查询到配置或者配置无效")
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor("red")
          Text("请先配置")
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .margin({top:"5%"})
            .fontColor("red")
        }
        .margin({top:"10%"})
      } else {
        Web({ src: this.web, controller: this.controller })
          .javaScriptAccess(true)
          .fileAccess(true)
          .imageAccess(true)
          .onlineImageAccess(true)
          .domStorageAccess(true)
          .cacheMode(CacheMode.Default)
          .onControllerAttached(() => {
            let userAgent =
              "Mozilla/ 5.0 (Linux; Android 10; EBG Build/ HUAWEIEBG; wv) AppleWebKit/ 537.36 (KHTML, like Gecko) Version/ 4.0 Chrome/ 88.0.4324.93 Mobile Safari/ 537.36 weishao(3.3.0.74633)";
            this.controller.setCustomUserAgent(userAgent);
          })
      }
    }
  }
}