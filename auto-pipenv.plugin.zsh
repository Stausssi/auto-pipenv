function _auto_pipenv {
  local pipenv_venv

  # Exit if pipenv is not installed
  command -v pipenv &> /dev/null || return
  pipenv_venv="$(PIPENV_IGNORE_VIRTUALENVS=1 pipenv --venv -q 2> /dev/null)"

  # Activate if:
  # 1. We're in a pipenv project AND
  # 2. There is no or a different virtual environment active

  # Deactivate if:
  # 1. We're not in a pipenv project AND
  # 2. There is a virtual environment active

  if [[ -n "${pipenv_venv}" ]]; then
    if [[ "${VIRTUAL_ENV}" != "${pipenv_venv}" ]]; then
      # shellcheck disable=SC1090
      source "${pipenv_venv}/bin/activate"
    fi
  elif [[ -n "${VIRTUAL_ENV}" && -z "${AUTO_PIPENV_DISABLE_DEACTIVATE}" ]]; then
    deactivate &> /dev/null || unset VIRTUAL_ENV
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _auto_pipenv
