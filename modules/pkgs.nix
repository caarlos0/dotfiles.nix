{ pkgs, ... }: {
  home.packages = with pkgs; [
    age
    comma
    cosign
    curl
    fd
    go-task
    htmltest
    htop
    httpstat
    hugo
    hyperfine
    inetutils
    jq
    kubectl
    kubectx
    kubernetes-helm
    moreutils
    nmap
    nodejs
    p7zip
    ripgrep
    sqlite
    sshpass
    stern
    terraform
    timer
    tldr
    vegeta
    wget

    # From NUR
    nur.repos.caarlos0.svu
    nur.repos.caarlos0.fork-cleaner
    nur.repos.caarlos0.jsonfmt
    nur.repos.caarlos0.goreleaser-pro

    # TODO:
    # rar # unfree
    # jsonschema
    # markscribe

    # fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # treesitter, lsps, etc
    cargo
    clang-tools # clangd lsp
    delve
    docker-ls
    gofumpt
    golangci-lint
    golangci-lint-langserver
    gopls
    nil # nix lsp
    nixfmt
    nodePackages.bash-language-server
    nodePackages.yaml-language-server
    rust-analyzer
    rustc
    rustfmt
    shellcheck
    shfmt
    stylua
    sumneko-lua-language-server
    taplo # tomp lsp
    terraform-ls
    tflint
    tree-sitter
    yamllint
  ];
}
