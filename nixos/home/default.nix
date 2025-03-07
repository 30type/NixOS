{
  inputs,
  config,
  pkgs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "l";
  home.homeDirectory = "/home/l";

  # !!! hyprland !!!

  # Optional, hint Electron apps to use Wayland:
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus

      inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors

      # inputs.hyprland-easymotion.packages.${pkgs.system}.hyprland-easymotion
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''

    ###############
    ### PLUGINS ###
    ###############

    plugin {
        dynamic-cursors {

        # enables the plugin
        enabled = true

        # sets the cursor behaviour, supports these values:
        # tilt    - tilt the cursor based on x-velocity
        # rotate  - rotate the cursor based on movement direction
        # stretch - stretch the cursor shape based on direction and velocity
        # none    - do not change the cursors behaviour
        mode = tilt

        # minimum angle difference in degrees after which the shape is changed
        # smaller values are smoother, but more expensive for hw cursors
        threshold = 2

        # override the mode behaviour per shape
        # this is a keyword and can be repeated many times
        # by default, there are no rules added
        # see the dedicated `shape rules` section below!
        # shaperule = <shape-name>, <mode> (optional), <property>: <value>, ...
        # shaperule = <shape-name>, <mode> (optional), <property>: <value>, ...
        # ...

            # for mode = rotate
            rotate {

                # length in px of the simulated stick used to rotate the cursor
                # most realistic if this is your actual cursor size
                length = 24

                # clockwise offset applied to the angle in degrees
                # this will apply to ALL shapes
                offset = 0.0
            }

            # for mode = tilt
            tilt {

                # controls how powerful the tilt is, the lower, the more power
                # this value controls at which speed (px/s) the full tilt is reached
                limit = 2000

                # relationship between speed and tilt, supports these values:
                # linear             - a linear function is used
                # quadratic          - a quadratic function is used (most realistic to actual air drag)
                # negative_quadratic - negative version of the quadratic one, feels more aggressive
                function = negative_quadratic
            }

            # for mode = stretch
            stretch {

                # controls how much the cursor is stretched
                # this value controls at which speed (px/s) the full stretch is reached
                limit = 300

                # relationship between speed and stretch amount, supports these values:
                # linear             - a linear function is used
                # quadratic          - a quadratic function is used
                # negative_quadratic - negative version of the quadratic one, feels more aggressive
                function = quadratic
            }

            # configure shake to find
            # magnifies the cursor if its is being shaken
            shake {
                enabled = false
            }
        }

        hyprbars {
            bar_height = 44
            bar_color = rgb(1e1e1e)
            col.text =  rgb(1e1e1e)
            bar_text_size = 12
            bar_text_font = FiraCode Nerd Font Mono Bold
            bar_button_padding = 12
            bar_padding = 10
            bar_precedence_over_border = false
            hyprbars-button = rgb(1e1e1e), 20, , hyprctl dispatch killactive, rgb(ee5396)
            hyprbars-button = rgb(1e1e1e), 20, , hyprctl dispatch fullscreen 2, rgb(ffe97b)
            hyprbars-button = rgb(1e1e1e), 20, , hyprctl dispatch togglefloating, rgb(33b1ff)
       }

       borders-plus-plus {
            add_borders = 2 # 0 - 9

            # you can add up to 9 borders
            col.border_1 = rgb(393939)
            col.border_2 = rgb(1e1e1e)

            # -1 means "default" as in the one defined in general:border_size
            border_size_1 = 4
            border_size_2 = 4

            # makes outer edges match rounding of the parent. Turn on / off to better understand. Default = on.
            natural_rounding = yes
        }
    }

    ################
    ### MONITORS ###
    ################

    # See https://wiki.hyprland.org/Configuring/Monitors/
    monitor=,preferred,auto,1


    ###################
    ### MY PROGRAMS ###
    ###################

    # See https://wiki.hyprland.org/Configuring/Keywords/

    # Set programs that you use
    $terminal = wezterm
    $fileManager = yazi
    $menu = rofi -show drun
    $window = rofi -show window
    $browser = qutebrowser


    #############################
    ### ENVIRONMENT VARIABLES ###
    #############################

    # See https://wiki.hyprland.org/Configuring/Environment-variables/

    env = XCURSOR_SIZE,24
    env = HYPRCURSOR_SIZE,24

    env = XDG_SESSION_DESKTOP,Hyprland
    env = XDG_SESSION_TYPE,wayland
    env = XDG_CURRENT_DESKTOP,Hyprland

    #####################
    ### LOOK AND FEEL ###
    #####################

    # Refer to https://wiki.hyprland.org/Configuring/Variables/

    # https://wiki.hyprland.org/Configuring/Variables/#general
    general {
        gaps_in = 6
        gaps_out = 12

        border_size = 0

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        col.active_border = rgb(161616)
        col.inactive_border = rgb(161616)

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false

        layout = dwindle
    }

    # https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration {
        rounding = 0

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0
        inactive_opacity = 1.0

        shadow {
            enabled = true
            range = 4
            render_power = 3
            color = rgba(2e3440ee)
        }

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur {
            enabled = false
            size = 3
            passes = 1

            vibrancy = 0.1696
        }
    }

    # https://wiki.hyprland.org/Configuring/Variables/#animations
    animations {
        enabled = no, please :)
    }

    # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
    # "Smart gaps" / "No gaps when only"
    # uncomment all if you wish to use that.
    # workspace = w[tv1], gapsout:0, gapsin:0
    # workspace = f[1], gapsout:0, gapsin:0
    # windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
    # windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
    # windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
    # windowrulev2 = rounding 0, floating:0, onworkspace:f[1]

    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle {
        pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true # You probably want this
    }

    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master {
        new_status = master
    }

    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc {
        force_default_wallpaper = 1 # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
    }

    #############
    ### INPUT ###
    #############

    # https://wiki.hyprland.org/Configuring/Variables/#input
    input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =

        follow_mouse = 1

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

        touchpad {
            natural_scroll = false
        }
    }

    # https://wiki.hyprland.org/Configuring/Variables/#gestures
    gestures {
        workspace_swipe = false
    }

    # Example per-device config
    # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
    device {
        name = epic-mouse-v1
        sensitivity = -0.5
    }


    ###################
    ### KEYBINDINGS ###
    ###################

    # See https://wiki.hyprland.org/Configuring/Keywords/
    $mainMod = SUPER # Sets "Windows" key as main modifier

    bind = SUPER, f, exec, hyprctl dispatch fullscreen

    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    bind = $mainMod, G, exec, $terminal
    bind = $mainMod, Q, killactive,
    bind = $mainMod SHIFT, I, exit,
    # bind = $mainMod, S, exec, $fileManager
    bind = $mainMod, P, togglefloating,
    bind = $mainMod, T, exec, $menu
    bind = $mainMod, space, exec, $window
    # bind = $mainMod, N, exec, $browser

    # Move focus with mainMod + arrow keys
    bind = $mainMod, c, movefocus, l
    bind = $mainMod, e, movefocus, r
    # bind = $mainMod, a, movefocus, d
    # bind = $mainMod, o, movefocus, u

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    # bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    # Example special workspace (scratchpad)
    #
    #
    bindel = $mainMod SHIFT, c, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    bindel = $mainMod SHIFT, a, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    # bind = $mainMod, S, togglespecialworkspace, magic
    # bind = $mainMod SHIFT, S, movetoworkspace, special:magic

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    bind = $mainMod, a, workspace, e+1
    bind = $mainMod, o, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    # Laptop multimedia keys for volume and LCD brightness
    bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
    bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-

    # Requires playerctl
    bindl = , XF86AudioNext, exec, playerctl next
    bindl = , XF86AudioPause, exec, playerctl play-pause
    bindl = , XF86AudioPlay, exec, playerctl play-pause
    bindl = , XF86AudioPrev, exec, playerctl previous

    ##############################
    ### WINDOWS AND WORKSPACES ###
    ##############################

    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
    # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

    # Example windowrule v1
    # windowrule = float, ^(kitty)$

    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

    # Ignore maximize requests from apps. You'll probably like this.
    windowrulev2 = suppressevent maximize, class:.*

    # Fix some dragging issues with XWayland
    windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0



    exec-once = wezterm
    exec-once = qutebrowser
    exec-once = hyprpanel
  '';
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/l/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
