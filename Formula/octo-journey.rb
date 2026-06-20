
class OctoJourney < Formula
  desc "Test for homebrew"
  homepage "https://github.com/rmolchon/homebrew-octo-journey"
  url "https://github.com/rmolchon/homebrew-octo-journey/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "bfaa6e2b625cc6652552ab6cfa039e56c3d06093c028eeb6705596100528cbfb"
  license ""

  # depends_on "cmake" => :build
  depends_on "jq"
  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    #system "./configure", "--disable-silent-rules", *std_configure_args

    # here we are installing the shell script and giving it an alias of "tiny-sh-example"
    bin.install "src/run.sh" => "octo-journey"
  end

  test do
    # this is a simple test that checks if the script is working as expected
    system "#{bin}/octo-journey", "rmolchon"

  end
end
