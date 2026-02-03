# shirakasu's dotfiles


## Mac OS

## Windows

WSL上でNeovimを動作させる際，クリップボード共有に`win32yank.exe`が必要．
以下コマンドでインストールする．

```bash
curl -Lo /tmp/win32yank-x64.zip https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
unzip /tmp/win32yank-x64.zip -d /tmp/
sudo mv /tmp/win32yank.exe /usr/local/bin/
sudo chmod +x /usr/local/bin/win32yank.exe

# 動作確認
echo "test" | /usr/local/bin/win32yank.exe -i
/usr/local/bin/win32yank.exe -o 
```

Mac用のキーボードをWindowsでも使うため，以下の設定が必要．

1. sharpkeyをインストールし，mykeys.sklをインポートする．

2. powertoysをインストールし，以下画像のようにショートカットを設定する．

![](https://github.com/shirakasu/dotfiles/raw/main/public/powertoys-shortcut.png)


## Debian

## Arch Linux
