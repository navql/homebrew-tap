cask "navql" do
  version "0.4.13"
  sha256 "db18c64b0a3695c0b2a59358a4bf34d592ca270274df0e89df30a94c4e0b5047"

  url "https://github.com/navql/releases/releases/download/v#{version}/NavQL-#{version}-arm64.dmg",
      verified: "github.com/navql/releases/"
  name "NavQL"
  desc "Database client for PostgreSQL, MySQL, SQL Server, MongoDB, Redis and SQLite"
  homepage "https://navql.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "NavQL.app"

  zap trash: [
    "~/Library/Application Support/NavQL",
    "~/Library/Caches/com.navql.desktop",
    "~/Library/Caches/com.navql.desktop.ShipIt",
    "~/Library/Logs/NavQL",
    "~/Library/Preferences/com.navql.desktop.plist",
    "~/Library/Saved Application State/com.navql.desktop.savedState",
  ]

  caveats <<~EOS
    NavQL is not notarized by Apple yet. The first time, try to open it, then go to
    System Settings → Privacy & Security and click "Open Anyway".
    By installing NavQL you agree to its Terms of Use (https://navql.com/terms.html)
    and Privacy Policy (https://navql.com/privacy.html).
  EOS
end
