function pwn-env --description "Loads the python virtual env for ctf. Relies on PWN_ENV_SOURCE being set"
    if not set -q PWN_ENV_SOURCE
        printf "PWN_ENV_SOURCE not set. Exiting.\n"
    end

    source $PWN_ENV_SOURCE
end
