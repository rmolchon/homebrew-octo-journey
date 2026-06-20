# homebrew-octo-journey
## Updating

- Make changes to the code, readme, etc. Commit and push to `main`
- Create tag `git tag -a {versionNumber} -m {versionNumber}` push to main
- Create new release from tag
- Copy tarball link, update Formula
- Fetch SHA-256 using tarball link

`curl -L {tarballLink} | shasum -a 256`

- Update Formula sha256
- Commit all formula changes and push to main
- Update `octo-journey` to latest version

`brew update`

`brew upgrade octo-journey`