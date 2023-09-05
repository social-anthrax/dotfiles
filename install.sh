#!/usr/bin/env fish

argparse --name="install.sh" "poetry" "pwn_env" -- $argv

# Install configs with dotter
if test (arch) = "arm64"
    ./dotter.arm
else
    ./dotter
end

# Install fisher, but don't bother only run update as our fish_plugins already lists fisher.
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Lightest --show_time='24-hour format' --classic_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_height='Two lines' --prompt_connection=Disconnected --powerline_prompt_frame='No frame' --prompt_spacing=Sparse --icons='Many icons'

# Download pwn-env into ~/envs but don't automatically install it
if set -q _flag_pwn_env
    mkdir ~/envs; pushd ~/envs
    git clone git@github.com:social-anthrax/pwn-env.git

    # Only install if configured to install
    if set -q _flag_poetry 
        echo "Poetry flag set, attempting to use poetry"
        if command -qs poetry
            if not poetry install
                echo "Failed to install pwn-env"
            else
                echo "Pwn env installed successfully"
            end
        else
            echo "Poetry not installed"
        end
    end

    popd
end
