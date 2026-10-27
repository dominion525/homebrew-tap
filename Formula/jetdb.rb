class Jetdb < Formula
  desc "Read Microsoft Access databases (.mdb/.accdb) from the command-line"
  homepage "https://github.com/dominion525/jetdb"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/dominion525/jetdb/releases/download/v#{version}/jetdb-aarch64-apple-darwin.tar.gz"
      sha256 "2ac4dda20c61805804490131c369c1cec07f37a14a7b95ef3cd6610b47098123"
    end
    on_intel do
      url "https://github.com/dominion525/jetdb/releases/download/v#{version}/jetdb-x86_64-apple-darwin.tar.gz"
      sha256 "614334b5aaa95d287213a7bc418d77c735e7614136cb100e94f5fa4445bd8a63"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dominion525/jetdb/releases/download/v#{version}/jetdb-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3368296620a2ce7775de8a34920b46b42bd5385e546aa60fccd2fec69b5a911"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "jetdb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jetdb --version")
  end
end
