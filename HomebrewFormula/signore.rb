class Signore < Formula
  desc "Signore CLI -- Command Line Interface to the Signore Service"
  homepage "https://github.com/hashicorp/signore"
  url "git@github.com:hashicorp/signore.git", :using => :git, :tag => "v0.1.3"
  head "git@github.com:hashicorp/signore.git", :using => :git, :branch => "main"

  depends_on "go" => :build

  def install
    if build.head?
      v_version = Utils.popen_read("git", "describe", "--tags", "--dirty", "--always").chomp
    else
      v_version = "v#{version}"
    end
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    go_ldflags = "-w -s"
    go_ldflags << " -X 'github.com/hashicorp/signore/version.Version=#{v_version}'"
    go_ldflags << " -X 'github.com/hashicorp/signore/version.PackageManager=HomeBrew'"
    go_ldflags << " -buildid=''"
    system "go", "build", "-trimpath", "-ldflags", go_ldflags, "-o", bin/"signore", "./cmd/signore"
  end
  def caveats
    <<~EOS
      signore client documentation: https://github.com/hashicorp/signore/blob/main/docs/USING_THE_CLIENT.md
      this release: https://github.com/hashicorp/signore/releases/tag/v0.1.3
    EOS
  end
end
