# LLMchat
## HarmonyOS-Next/Openharmony
## Step on PC 
### 1.Download ollama
[ollama](https://ollama.com/)
### 2.Choose your model and run it

```
ollama run model_name
```
**For example**

```
ollama run llama3:8b
```
### 3.Build Open-WebUI
**There are three ways to build it,docker(recommand),python-original,original.We use docker for example**
#### 1.Download docker
[docker](https://docs.docker.com/desktop/setup/install/windows-install/)
#### 2.Turn on Hyper-V and WSL
#### 3.run open-webui
```
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```
After that,you can access Open WebUI at (http://localhost:3000),Enjoy!

