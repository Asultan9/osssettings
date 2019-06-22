# Contributing
Thank you for considering contributing to this project. If you don't want to contribute code, you can always [open an issue](https://github.com/castyte/osssettings/issues/new) and share your ideas or report bugs/typos.

## How to contribute
Fork the repository (https://github.com/castyte/osssettings/fork)

Clone your fork
```sh
git clone https://github.com/username/repository
```

Create your feature branch including the category it fits into (categories on preferences page)
```sh
git checkout -b {category}-{feature}/fooBar
```

Write your changes and test they work fully

Commit your changes
```sh
git commit -m "add some foobar"
```

Push to the new branch
```sh
git push origin {category}-{feature}/foobar
```

Create a new pull request using the templates below for the body:  
[Feature addition](https://raw.githubusercontent.com/castyte/osssettings/master/.github/PULL_REQUEST_TEMPLATE/bug.md)  
[Bug fix](https://raw.githubusercontent.com/castyte/osssettings/master/.github/PULL_REQUEST_TEMPLATE/feature.md)  

## Requirements
There are requirements that need to be met before a pull request can be accepted.

- The feature must be tested and confirmed to work
- If the feature causes another feature to not function properly you must make sure only one can be enabled at once and a message about it is included in the preferences.
- Code needs to have documentation where necessary. If we believe the documentation is not clear enough, we will let you know on the pull request.
- Features must not modify App Store applicatons, or include materials which may be deemed illegal in the United States or the United Kingdom
- Maintainers need to review and approve the changes before a pull request can be merged.
- No commits to the master branch should be made. All changes should be made through pull requests.
- If you wish to be included in the credits page you must add yourself to it and include it in your feature addition.

If you have any questions about these requirements, feel free to ask.

## Code of Conduct
This project has a [Code of Conduct](https://github.com/castyte/osssettings/blob/master/CODE_OF_CONDUCT.md) and [LICENSE](https://github.com/castyte/osssettings/blob/master/LICENSE) which all contributors must follow.
