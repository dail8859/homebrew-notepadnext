cask 'notepadnext' do
  version '0.10'
  sha256 '8e33ecac4a5fcec5426cbd0f8fdca82c0d028b85f84554f9ddc0c191b72ca37d'

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
