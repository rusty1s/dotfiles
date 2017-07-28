#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/defaults.sh


if on_mac; then
  print_header Settings

  computer_name "$COMPUTER_NAME"
  expand_save_panel
  expand_print_panel
  quit_printer_automatically
  disable_open_app_confirm_dialog
  disable_natural_scrolling
  set_faster_keyboard_repeat_rate
  disable_autocorrect
  disable_smart_quotes
  search_current_folder_first
  show_hidden_files
  show_all_file_extensions
  disable_change_file_extension_warning
fi
