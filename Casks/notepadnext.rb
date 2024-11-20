cask 'notepadnext' do
  version '0.9'
  sha256 'b19cc5a04626ea1b61783d4e4ec9203b015122567d40cda606d712d4f5538c73'

  url "https://github.com/dail8859/NotepadNext/releases/download/v#{version}//NotepadNext-v#{version}.dmg"
  name 'NotepadNext'
  desc 'A cross-platform, reimplementation of Notepad++.'
  homepage 'https://github.com/dail8859/NotepadNext'

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Notepadnext.app"
  binary "#{appdir}/Notepadnext.app/Contents/MacOS/NotepadNext", target: "notepad-next"

  uninstall quit: "io.github.dail8859.NotepadNext"

  zap trash: [
    "~/.config/NotepadNext",
    "~/Library/Application Support/NotepadNext",
    "~/Library/Saved Application State/io.github.dail8859.NotepadNext.savedState",
  ]
end
