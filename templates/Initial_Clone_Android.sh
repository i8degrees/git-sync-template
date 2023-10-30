set -e

# ADAPT ME
# the parent directory of where you knowledge-base should be cloned to
cd storage/shared

# ADAPT ME
git clone --depth 3 "git@github.com/i8degrees/test-notes.git"

# ADAPT ME
cd test-notes.git

# On android, we know, that hooks don't work.
# We invoke them directly in the scripts instead.
git config advice.ignoredHook false

git lfs fetch
git lfs pull

# ADAPT ME
git remote add origin "git@github.com/i8degrees/test-notes.git" || true
git push -u origin master
git branch --set-upstream-to=origin/master master 

safe() {
  # ADAPT ME
  git config --global --add safe.directory /storage/emulated/0/Projects/test-notes.git"$1"
}

# For each git repository (including submodules)
# ensure, that termux git doesn't complain
safe ""
# For each submodule (e.g. in the path my/sub/module in your knowledge-base), add this
# safe my/sub/module

git submodule update --init
