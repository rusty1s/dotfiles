#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/defaults.sh


if on_mac; then
  print_header Settings

  computer_name "$COMPUTER_NAME"
  disable_sleep_mode
  system_language_to_en
  expand_save_panel
  expand_print_panel
  quit_printer_automatically
  disable_open_app_confirm_dialog
  disable_natural_scrolling
  show_scrollbars_only_when_scrolling
  set_faster_keyboard_repeat_rate
  disable_autocorrect
  disable_smart_quotes
  disable_hold_for_accents
  disable_automatic_capitalization
  search_current_folder_first
  show_hidden_files
  show_all_file_extensions
  disable_change_file_extension_warning
  avoid_ds_store_on_network
  show_library_folder
  show_volumes_folder
  finder_allow_quitting
  mail_set_copy_format
  mail_show_as_plain_text
  textedit_save_as_plain_text
  textedit_save_as_utf8
  itunes_disable_media_keys
  photos_disable_autostart
  terminal_disable_marks
fi
