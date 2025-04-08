cask 'notepadnext' do
  version '0.11'
  sha256 '96592e8b72abe1b2f61aff31ccc912783961ed663095f44d65870e7cab21c6fa'

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
