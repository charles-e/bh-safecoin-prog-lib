#
# This file maintains the solana versions for use by CI.
#
# Obtain the environment variables without any automatic updating:
#   $ source ci/safecoin-version.sh
#
# Obtain the environment variables and install update:
#   $ source ci/safecoin-version.sh install

# Then to access the solana version:
#   $ echo "$solana_version"
#

if [[ -n $SAFEANA_VERSION ]]; then
  solana_version="$SAFEANA_VERSION"
else
  solana_version=v1.6.11
fi

export solana_version="$solana_version"
export PATH="$HOME"/.local/share/solana/install/active_release/bin:"$PATH"

if [[ -n $1 ]]; then
  case $1 in
  install)
    sh -c "$(curl -sSfL https://release.solana.com/$solana_version/install)"
    solana --version
    ;;
  *)
    echo "$0: Note: ignoring unknown argument: $1" >&2
    ;;
  esac
fi
