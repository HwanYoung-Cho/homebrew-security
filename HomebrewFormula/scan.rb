class Scan < Formula
  desc "Scan CLI -- Command Line Interface to Security Scanner"
  homepage "https://github.com/hashicorp/security-scanner"
  url "git@github.com:hashicorp/security-scanner.git", :using => :git, :tag => "v0.0.1-alpha20"
  head "git@github.com:hashicorp/security-scanner.git", :using => :git, :branch => "main"
       
  depends_on "go" => :build
       
  def install
    if build.head?
      v_version = Utils.popen_read("git", "describe", "--tags", "--dirty", "--always").chomp
    else
      v_version = "v#{version}"
    end
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    go_ldflags = "-w -s"
    go_ldflags << " -X 'main.version=#{v_version}'"
    go_ldflags << " -buildid=''"
    system "go", "build", "-trimpath", "-ldflags", go_ldflags, "-o", bin/"scan", "./cmd/scan"
  end

  def caveats
    <<~EOS
      v0.0.1-alpha20 - Network endpoint scanning, improved secrets scanning, and more!

      configuration documentation: https://github.com/hashicorp/security-scanner/blob/main/CONFIG.md
      this release: https://github.com/hashicorp/security-scanner/releases/tag/v0.0.1-alpha20
    EOS
  end
end