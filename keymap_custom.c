/*
 * HHKB Custom Keyboard Layout
 *
 * American HHKB Layout with following additions:
 * - german umlauts
 * - y and z swapped
 * - next, play/pause and prev media keys
 * - arrow keys on wasd
 * - ctrl layer/esc tap key
 * - shift oneshot modifier
 */
#include "keymap_common.h"


const uint8_t keymaps[][MATRIX_ROWS][MATRIX_COLS] PROGMEM = {
    /* Layer 0: Default Layer
     * ,-----------------------------------------------------------.
     * |Esc|  1|  2|  3|  4|  5|  6|  7|  8|  9|  0|  -|  =|  \|  `|
     * |-----------------------------------------------------------|
     * |Tab  |  Q|  W|  E|  R|  T|  Z|  U|  I|  O|  P|  [|  ]|Backs|
     * |-----------------------------------------------------------|
     * |Fn1   |  A|  S|  D|  F|  G|  H|  J|  K|  L|  ;|  '|Enter   |
     * |-----------------------------------------------------------|
     * |Shift   |  Y|  X|  C|  V|  B|  N|  M|  ,|  .|  /|Shift |Fn0|
     * `-----------------------------------------------------------'
     *       |Alt|Gui  |         Space         |Gui  |Alt|
     *       `-------------------------------------------'
     */
    KEYMAP(ESC, 1,   2,   3,   4,   5,   6,   7,   8,   9,   0,   MINS,EQL, BSLS,GRV,   \
           TAB, Q,   W,   E,   R,   T,   Z,   U,   I,   O,   P,   LBRC,RBRC,BSPC,       \
           FN1, A,   S,   D,   F,   G,   H,   J,   K,   L,   SCLN,QUOT,ENT,             \
           LSFT,Y,   X,   C,   V,   B,   N,   M,   COMM,DOT, SLSH,RSFT,FN0,             \
                LALT,LGUI,          SPC,                RGUI,RALT),

    /* Layer 1: Fn with umlauts
     * ,-----------------------------------------------------------.
     * |Sle| F1| F2| F3| F4| F5| F6| F7| F8| F9|F10|F11|F12|Ins|Del|
     * |-----------------------------------------------------------|
     * |Caps |   |Up |   |   |   |   |   |   |   |   |  ü|  ß|    s|
     * |-----------------------------------------------------------|
     * |      |Lef|Dow|Rig|   |   |   |   |   |   |  ö|  ä|        |
     * |-----------------------------------------------------------|
     * |        |Prv|Ply|Nxt|Mut|VoD|VoU|   |   |PgD|PgU|      |   |
     * `-----------------------------------------------------------'
     *       |   |     |                       |     |   |
     *       `-------------------------------------------'
     */
    KEYMAP(SLEP, F1,  F2,  F3,  F4,  F5,  F6,  F7,  F8,  F9,  F10, F11, F12, INS, DEL,  \
           CAPS,TRNS,UP,  TRNS,TRNS,TRNS,TRNS,TRNS,TRNS,TRNS,TRNS, FN4, FN5, TRNS,      \
           TRNS,LEFT,DOWN,RGHT,TRNS,TRNS,TRNS,TRNS,TRNS,TRNS, FN3, FN2,TRNS,            \
           TRNS,MPRV,MPLY,MNXT,MUTE,VOLD,VOLU,TRNS,TRNS,PGDN,PGUP,TRNS,TRNS,            \
                TRNS,TRNS,          TRNS,               TRNS,TRNS),
};

/*
 * Macro definiton
 */
enum macro_id {
    MAC_UMLAUT_A,
    MAC_UMLAUT_O,
    MAC_UMLAUT_U,
    MAC_UMLAUT_S,
};

const macro_t *action_get_macro(keyrecord_t *record, uint8_t id, uint8_t opt) {
    keyevent_t event = record->event;

    uint8_t hold_shift = 0;
    if (keyboard_report->mods & MOD_BIT(KC_LSFT)) {
	unregister_code(KC_LSFT);
        hold_shift = 1;
    }

    switch(id) {
        case MAC_UMLAUT_A:
            if (hold_shift) {
                return (event.pressed ?
                    MACRO(D(LALT), T(U), U(LALT), D(LSHIFT), T(A), U(LSHIFT), END) :
                    MACRO(END));
            } else {
                return (event.pressed ?
                    MACRO(D(LALT), T(U), U(LALT), T(A), END) :
                    MACRO(END));
	    }
        case MAC_UMLAUT_O:
            if (hold_shift) {
                return (event.pressed ?
                    MACRO(D(LALT), T(U), U(LALT), D(LSHIFT), T(O), U(LSHIFT), END) :
                    MACRO(END));
            } else {
                return (event.pressed ?
                    MACRO(D(LALT), T(U), U(LALT), T(O), END) :
                    MACRO(END));
	    }
        case MAC_UMLAUT_U:
            if (hold_shift) {
                return (event.pressed ?
                    MACRO(D(LALT), T(U), U(LALT), D(LSHIFT), T(U), U(LSHIFT), END) :
                    MACRO(END));
            } else {
                return (event.pressed ?
                    MACRO(D(LALT), T(U), U(LALT), T(U), END) :
                    MACRO(END));
	    }
        case MAC_UMLAUT_S:
            return (event.pressed ?
                MACRO(D(LALT), T(S), U(LALT), END) :
                MACRO(END));
	default:
	    return MACRO_NONE;
    }
}

/*
 * Fn action definition
 */
const action_t fn_actions[] PROGMEM = {
    [0]  = ACTION_LAYER_MOMENTARY(1),
    [1]  = ACTION_MODS_TAP_KEY(MOD_LCTL, KC_ESC),
    [2]  = ACTION_MACRO(MAC_UMLAUT_A),
    [3]  = ACTION_MACRO(MAC_UMLAUT_O),
    [4]  = ACTION_MACRO(MAC_UMLAUT_U),
    [5]  = ACTION_MACRO(MAC_UMLAUT_S),
};
