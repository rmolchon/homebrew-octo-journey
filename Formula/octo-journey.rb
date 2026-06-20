
class HomebrewOctoJourney < Formula
  desc "Test for homebrew"
  homepage "https://github.com/rmolchon/homebrew-octo-journey"
  url "https://github.com/rmolchon/homebrew-octo-journey/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "1b704708c53e16664b02c3acdf1f9a6d62576fb9193332f5e3163e0f35735a32"
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
    system "#{bin}/octo-journey", "mvogelgesang"

  end
end
