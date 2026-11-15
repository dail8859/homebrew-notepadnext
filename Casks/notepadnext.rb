cask 'notepadnext' do
  arch arm: "arm64", intel: "x64"

  version "0.15"
  sha256 arm:   "b3c950c8f9909014d3ed6479bd477baf1d97ac36efe6a30716580d7df32686e9",
         intel: "406ce68884f80cd79c42fd779a0707401e81980c1614f3e5a572d0507ed644b4"

  url "https://github.com/dail8859/NotepadNext/releases/download/v#{version}/NotepadNext-v#{version}-#{arch}.dmg"
  name 'NotepadNext'
  desc 'A cross-platform, reimplementation of Notepad++.'
  homepage 'https://github.com/dail8859/NotepadNext'

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Notepadnext.app"
  binary "#{appdir}/Notepadnext.app/Contents/MacOS/NotepadNext", target: "notepad-next"

  uninstall quit: "io.github.dail8859.NotepadNext"

  zap trash: [
    "~/.config/NotepadNext",
    "~/Library/Application Support/NotepadNext",
    "~/Library/Saved Application State/io.github.dail8859.NotepadNext.savedState",
  ]
end
