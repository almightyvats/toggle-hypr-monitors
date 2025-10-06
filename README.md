# toggle-hypr-monitors
A lightweight Bash script to toggle the internal laptop monitor (eDP-1) in Hyprland, designed for clamshell setups (lid mostly closed) with an external monitor (DP-1). Tracks state in lid_state.log (0 for disabled, 1 for enabled) and supports manual toggling via a keybinding.

## Features

- Toggles internal monitor (eDP-1) on/off based on lid_state.log.
- Disables internal monitor when external monitor (DP-1) is connected.

## Requirements

- Hyprland window manager
- External monitor connected (e.g., DP-1)

## Setup
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/hyprland-monitor-toggle.git
   cd hyprland-monitor-toggle
  ```
```

2. Make the Script Executable:
```bash
  chmod +x lid.sh
```

3. Move to Hyprland Config Directory (optional, or keep it elsewhere):
```bash
  mv lid.sh ~/.config/hypr/
```

4. Edit Monitor Names (if needed):

- Open `lid.sh` and check `INTERNAL="eDP-1"` and `EXTERNAL="DP-1"` match your setup.
- Run `hyprctl monitors` to find your monitor names (e.g., `eDP-1`, `HDMI-A-1`).
- Update scaling (default 1.5) if needed.

5. Add to Hyprland Config:Edit `~/.config/hypr/hyprland.conf` and add:
```bash
bind = $mainMod SHIFT, M, exec, ~/.config/hypr/lid.sh
```

In case of `Omarchy`, add the following in `~/.config/hypr/bindings.conf`:
```bash
bindd = SUPER SHIFT, M, Monitor, exec, ~/.config/hypr/lid.sh
```

> See if you need a different binding than `M`.

## Usage

1. Toggle Manually:

- Run the script: 
```bash
~/.config/hypr/lid.sh
```


- Or press `Super + Shift + M` to toggle the internal monitor.


2. Check State:

- Verify monitor state:
```bash
hyprctl monitors
```


- Check `lid_state.log` (in the same directory as `lid.sh`):
```bash
cat ~/.config/hypr/lid_state.log
```

Outputs `0` (internal disabled) or `1` (internal enabled).


## Notes

- Ideal for laptops with the lid closed, using an external monitor.
- If the external monitor is disconnected, the script enables the internal monitor to avoid a blank screen.

## Troubleshooting

- If toggling fails, check hyprctl monitors output.
- Ensure lid.sh is executable and monitor names match.
