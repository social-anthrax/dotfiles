#!/usr/bin/env fish

argparse --name="install.sh" poetry pwn_env -- $argv

# Install fisher first
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# If the fish plugins file isn't a symlink then delete it
if not test -L $__fish_config_dir/fish_plugins
    rm $__fish_config_dir/fish_plugins # Remove existing plugins file
end

# Set up the local file for dotter. This one simply installs the default dependencies
if not test -e ./.dotter/local.toml
    set -l local_toml (echo '''includes = []
    packages = ["default"]

    [files]

    [variables]
    ''' | string split \n | string trim -l | string collect)

    echo $local_toml >./.dotter/local.toml
end

# Install configs with dotter
if test (arch) = arm64
    ./dotter.arm
else
    ./dotter
end

fish_add_path ~/.local/bin

fisher update
tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Dark --show_time='24-hour format' --classic_prompt_separators=Vertical --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='Two lines, character' --prompt_connection=Disconnected --powerline_right_prompt_frame=No --prompt_spacing=Sparse --icons='Many icons' --transient=No

# Optionally download pwn-env into ~/envs but don't automatically install it
if set -q _flag_pwn_env
    mkdir ~/envs
    pushd ~/envs
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
