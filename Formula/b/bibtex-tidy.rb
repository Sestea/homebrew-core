class BibtexTidy < Formula
  desc "Cleaner and Formatter for BibTeX files"
  homepage "https://github.com/FlamingTempura/bibtex-tidy"
  url "https://registry.npmjs.org/bibtex-tidy/-/bibtex-tidy-1.5.0.tgz"
  sha256 "8d8d40351193f2b447a22fa04d8490da32bcc285694b3a169a8a8af57e231823"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "3750c55681a8fd87a5c4dcd876ac66c9b88b7b80ca9bc8d2f0deb1c2bed03f8e"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    test_file = testpath/"test.bib"
    test_file.write <<~BIBTEX
      @article{example,
        author = {Author},
        title = {Title},
        year = {2024}
      }
    BIBTEX

    output = shell_output("#{bin}/bibtex-tidy #{test_file}")
    assert_match "Done. Successfully tidied 1 entries.", output
  end
end
