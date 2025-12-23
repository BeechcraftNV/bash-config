# Quick docker compose project navigation and control
dcp() {
    if [ -z "$1" ]; then
        cd /opt/docker/compose && ls -d */
    else
        cd /opt/docker/compose/"$1" && docker compose up -d
    fi
}

# Git branch in prompt helper
git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Quick project directory jumper
proj() {
    local dirs=(~/projects ~/code /opt/docker/compose)
    if [ -z "$1" ]; then
        echo "Available projects:"
        for dir in "${dirs[@]}"; do
            [ -d "$dir" ] && ls -d "$dir"/*/ 2>/dev/null
        done
    else
        for dir in "${dirs[@]}"; do
            if [ -d "$dir/$1" ]; then
                cd "$dir/$1"
                return 0
            fi
        done
        echo "Project '$1' not found"
        return 1
    fi
}
