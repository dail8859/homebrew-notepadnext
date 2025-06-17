cask 'notepadnext' do
  version '0.12'
  sha256 'fee630030112da083be81628750c1da3d0b9ac85f070dc2c14b119af19c3822c'

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
