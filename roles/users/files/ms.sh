#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 host1 [host2 host3 ...]" >&2
  exit 1
fi

first="$1"; shift

# Neues Fenster mit erstem Host, Pane-ID exakt ausgeben
pane_id="$(tmux new-window -P -F "#{pane_id}" -n "${first}" "ssh ${first}")"
# Window-ID zu diesem Pane bestimmen
win_id="$(tmux display-message -p -t "${pane_id}" "#{window_id}")"

tmux select-window -t "${win_id}"

# Weitere Hosts in neue Panes splitten
for host in "$@"; do
  tmux split-window -P -t "${win_id}" -F "#{pane_id}" -d "ssh ${host}" >/dev/null
  tmux select-layout -t "${win_id}" tiled >/dev/null
done

# Panes synchronisieren, Layout sauber setzen und ersten Pane fokussieren
tmux set-window-option -t "${win_id}" synchronize-panes on
tmux select-layout -t "${win_id}" tiled >/dev/null

first_pane="$(tmux list-panes -t "${win_id}" -F "#{pane_id}" | head -n1)"
tmux select-pane -t "${first_pane}"
