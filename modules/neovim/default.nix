{ config, pkgs, lib, ... }:
let
  fromGitHub = owner: repo: ref: hash:
    pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = pkgs.fetchFromGitHub {
        owner = owner;
        repo = repo;
        rev = ref;
        sha256 = hash;
      };
    };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;
    package = pkgs.neovim-nightly;
    plugins = with pkgs.vimPlugins; [
      # ui
      catppuccin-nvim
      nvim-web-devicons
      nvim-tree-lua
      nvim-notify
      bufferline-nvim
      lualine-nvim
      dressing-nvim

      # basics
      indent-blankline-nvim
      gitsigns-nvim
      todo-comments-nvim
      neotest
      neotest-go
      neotest-rust
      neotest-jest
      harpoon
      vim-fugitive
      vim-abolish
      vim-repeat
      vim-eunuch
      vim-sleuth
      vim-speeddating
      auto-session
      telescope-nvim
      telescope-github-nvim
      auto-hlsearch-nvim

      # coding
      nvim-lspconfig
      null-ls-nvim
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-emoji
      cmp-calc
      nvim-autopairs
      nvim-ts-autotag
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      luasnip
      cmp_luasnip
      friendly-snippets
      neodev-nvim
      nvim-surround
      comment-nvim
      treesj
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins:
        with plugins; [
          bash
          cpp
          css
          diff
          dockerfile
          fish
          git_config
          git_rebase
          gitattributes
          gitcommit
          gitignore
          go
          gomod
          gowork
          graphql
          hcl
          html
          http
          javascript
          jq
          json
          lua
          make
          markdown
          markdown_inline
          nix
          python
          query
          regex
          rust
          scss
          sql
          terraform
          toml
          vhs
          vim
          yaml
          zig
        ]))
      nvim-treesitter-textobjects
      nvim-treesitter-context
      nvim-treesitter-endwise
      other-nvim

      # debug
      nvim-dap
      nvim-dap-ui
      nvim-dap-go
      telescope-dap-nvim
      nvim-dap-virtual-text
    ];
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config;
  };
}
