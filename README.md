# Dotfiles Starter Kit

Make your own dotfiles! 

## Installation

Fork this repository by clicking the **Fork** button in the header of this repository.

![](https://github-images.s3.amazonaws.com/help/bootcamp/Bootcamp-Fork.png)

Next, clone it to `~/.dotfiles` directory in your computer.

```bash
$ git clone [clone URL] ~/.dotfiles
```

Last, run `setup.sh` script.

**Note**: This script may overwrite existing `.bash_profile`, `.gitignore` and `.gitconfig` files in your HOME directory. If you already have them, please backup before running.

```bash
$ cd ~/.dotfiles
$ ./setup.sh
```

## File structure
```
├── git/
│   ├── gitconfig
│   └── gitignore
├── lib/
│   └── utils
├── node/
│   └── npm.sh
├── osx/
│   └── homebrew/
│       ├── Brewfile
│       └── Caskfile
├── shell/
│   ├── bash_aliases
│   ├── bash_exports
│   ├── bash_options
│   ├── bash_paths
│   ├── bash_profile
│   └── bash_prompt
├── setup.sh
└── testcolor.sh
```

## Customizing

### Adding dotfiles (like `.zshrc`)

After adding any dotfiles in your favorite directory, don't forget modifying `setup.sh`.

### Node packages installation

Add your favorite packages into `node/npm.sh`. 

### Homebrew formulae installation

Add your favorite formulae into `osx/homebrew/Brewfile`.

### OS X native app installation with [Homebrew cask](http://caskroom.io/)

Add your favorite applications into `osx/homebrew/Caskfile`.

