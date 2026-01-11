curl -L https://github.com/douhashi/soba/releases/latest/download/soba_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m | sed 's/x86_64/x86_64/; s/aarch64/arm64/').tar.gz | tar xz -C /tmp && mkdir -p ~/.local/bin &&mv /tmp/soba ~/.local/bin/

# Setup bash environment
cat >> ~/.bashrc << 'EOF'

# Custom settings for devcontainer
export LANG=en_US.UTF-8
export TERM=xterm-256color
alias vim='nvim'
alias claude='claude --dangerously-skip-permissions'
EOF

