class Heisler < Formula
  desc "Heisler -- making some HomeBrew"
  homepage "https://github.com/hashicorp/heisler"
  url "git@github.com:hashicorp/heisler.git", :using => :git, :tag => "v2.1"
  head "git@github.com:hashicorp/heisler.git", :using => :git, :branch => "master"

  depends_on "go" => :build

  def install
    if build.head?
      v_version = Utils.popen_read("git", "describe", "--tags", "--dirty", "--always").chomp
    else
      v_version = "v#{version}"
    end
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    go_ldflags = "-w -s"
    go_ldflags << " -X 'github.com/hashicorp/heisler/version.Version=#{v_version}'"
    go_ldflags << " -X 'github.com/hashicorp/heisler/version.PackageManager=HomeBrew'"
    system "go", "build", "-trimpath", "-ldflags", go_ldflags, "-o", bin/"heisler"
  end
end
