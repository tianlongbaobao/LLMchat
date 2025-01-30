import dataPreferences from '@ohos.data.preferences';
import preferences from '@ohos.data.preferences';

let context = getContext(this)
@Entry
@Component
export struct Setting {
  @State web: string = '';
  @State index:number = -1
  aboutToAppear(): void {
    let options: preferences.Options = { name: 'information' };
    let dataPreferences: preferences.Preferences = preferences.getPreferencesSync(context, options)
    this.web = dataPreferences.getSync("web", 'default')+""
  }
  build() {
    Column(){
      Flex() {
        Text("配置")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
      }
      .margin({top:"5%"})
      Flex(){
        Text("  WEB")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
      }
      .margin({top:"5%"})
      TextInput({ placeholder: 'URL',text:this.web }).type(InputType.Normal).margin({ top: "5%" })
        .onChange((value: string) => {
          this.web = value
        })
      Flex() {
        Text("  智能配置")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
      }
      .margin({top:"5%"})
      Flex(){
        Select([{ value: 'Deepseek', icon: $rawfile("deepseek.png") },{ value: 'ChatGPT', icon: $rawfile("chatgpt.png") },
          { value: '通义千问', icon: $rawfile("qwen.png") }, { value: '豆包', icon: $rawfile("doubao.png") },{ value: 'Kimi', icon: $rawfile("kimi.png") }])
          .selected(this.index)
          .value("模型选择")
          .controlSize(ControlSize.SMALL)
          .onSelect((index: number, text?: string | undefined) => {
            this.index = index;
            if (this.index == 0) {
              this.web = "https://chat.deepseek.com/"
            } else if (this.index == 2) {
              this.web =
                "https://tongyi.aliyun.com/qianwen/?spm=5176.29597918.J_SEsSjsNv72yRuRFS2VknO.3.16af7ca0PPAqxo&code=3cabi9oinc"
            } else if (this.index == 3) {
              this.web =
                "https://www.doubao.com/chat/?channel=bing_sem&source=dbweb_bing_sem_xhs_pc_01_tcpa&keywordid=1630&msclkid=d1f43630882712cc7a2551a7f6a99f07"
            } else if (this.index == 1) {
              this.web = "https://chatgpt.com/"
            } else if (this.index == 4) {
              this.web = "https://kimi.moonshot.cn/"
            }
          })
      }
      .margin({top:"5%"})
      Button('确认').width(150).margin({ top: "10%" })
        .onClick(() => {
          dataPreferences.getPreferences(context, "information").then(preferences=>{
            preferences.put("web",this.web)
            preferences.flush()
            AlertDialog.show(
              {
                message: '配置成功',
                autoCancel: false,
                alignment: DialogAlignment.Bottom,
                gridCount: 5,
                offset: { dx: 0, dy: -20 },
                primaryButton: {
                  value: '确认',
                  action: () => {

                  }
                },
              }
            )
          }).catch((err:Error)=>{

          })
        })
      Hyperlink("https://github.com/tianlongbaobao/LLMchat/blob/main/README.md","帮助")
        .margin({top:"5%"})
    }
    .margin({ left: "8%", right: "8%" })
  }
}