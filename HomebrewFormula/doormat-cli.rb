class DoormatCli < Formula
  desc "Doormat CLI -- Command Line Interface to the Doormat Service"
  homepage "https://github.com/hashicorp/doormat-cli"
  url "git@github.com:hashicorp/doormat-cli.git", :using => :git, :tag => "v3.5.4"
  head "git@github.com:hashicorp/doormat-cli.git", :using => :git, :branch => "master"

  depends_on "go" => :build

  def install
    if build.head?
      v_version = Utils.popen_read("git", "describe", "--tags", "--dirty", "--always").chomp
    else
      v_version = "v#{version}"
    end
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    go_ldflags = "-w -s"
    go_ldflags << " -X 'github.com/hashicorp/doormat-cli/version.Version=#{v_version}'"
    go_ldflags << " -X 'github.com/hashicorp/doormat-cli/version.PackageManager=HomeBrew'"
    system "go", "build", "-trimpath", "-ldflags", go_ldflags, "-o", bin/"doormat"
  end
  def caveats
    <<~EOS
      Fix - Set correct region in session command client.

      See the doormat-cli's documentation for more information:
      https://docs.prod.secops.hashicorp.services/docs/doormat/cli/

      CHANGELOG:
      https://github.com/hashicorp/doormat-cli/blob/master/changelog.md
    EOS
  end
end
