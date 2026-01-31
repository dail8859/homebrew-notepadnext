cask 'notepadnext' do
  version '0.13'
  sha256 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'

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
