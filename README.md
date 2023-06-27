# auto-pipenv

[Oh-My-ZSH](https://github.com/ohmyzsh/ohmyzsh) plugin to automatically enable and disable Python virtual environments with [pipenv](https://github.com/pypa/pipenv).

This uses the "old-fashioned" `source VENV/bin/activate` approach and **not** `pipenv shell`.

## Usage

1. Install the plugin with `git clone https://github.com/Stausssi/auto-pipenv "${ZSH_CUSTOM}/plugins/auto-pipenv"`
2. Add it to your `plugins` variable inside `.zshrc`, e.g. `plugins=(... auto-pipenv)`
3. Reload or restart your current Terminal session (e.g. `omz reload`).

## Configuration

You can set the variable `AUTO_PIPENV_DISABLE_DEACTIVATE` to **any value** if you want to disable the automatic deactivation of the virtual environment once you leave the project's directory.
