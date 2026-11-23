cask "navql" do
  version "0.4.18"
  sha256 "d3ac36b754dfb305508d783b5986071201b96178d37629260d26e01b592be44e"

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
