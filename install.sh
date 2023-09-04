#!/usr/bin/env fish

if test (arch) = "arm64"
    ./dotter.arm
else
    ./dotter
end

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Lightest --show_time='24-hour format' --classic_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_height='Two lines' --prompt_connection=Disconnected --powerline_prompt_frame='No frame' --prompt_spacing=Sparse --icons='Many icons'