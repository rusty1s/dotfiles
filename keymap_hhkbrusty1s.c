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


#ifdef KEYMAP_SECTION_ENABLE
const uint8_t keymaps[][MATRIX_ROWS][MATRIX_COLS] __attribute__ ((section (".keymap.keymaps"))) = {
#else
const uint8_t keymaps[][MATRIX_ROWS][MATRIX_COLS] PROGMEM = {
#endif
    /* Layer 0: Default Layer
     * ,-----------------------------------------------------------.
     * |Esc|  1|  2|  3|  4|  5|  6|  7|  8|  9|  0|  -|  =|  \|  `|
     * |-----------------------------------------------------------|
     * |Tab  |  Q|  W|  E|  R|  T|  Z|  U|  I|  O|  P|  [|  ]|Backs|
     * |-----------------------------------------------------------|
     * |Fn1   |  A|  S|  D|  F|  G|  H|  J|  K|  L|  ;|  '|Enter   |
     * |-----------------------------------------------------------|
     * |Fn2     |  Y|  X|  C|  V|  B|  N|  M|  ,|  .|  /|Shift |Fn0|
     * `-----------------------------------------------------------'
     *       |Alt|Gui  |         Space         |Gui  |Alt|
     *       `-------------------------------------------'
     */
    KEYMAP(ESC, 1,   2,   3,   4,   5,   6,   7,   8,   9,   0,   MINS,EQL, BSLS,GRV,   \
           TAB, Q,   W,   E,   R,   T,   Z,   U,   I,   O,   P,   LBRC,RBRC,BSPC,       \
           FN1, A,   S,   D,   F,   G,   H,   J,   K,   L,   SCLN,QUOT,ENT,             \
           FN2, Y,   X,   C,   V,   B,   N,   M,   COMM,DOT, SLSH,RSFT,FN0,             \
                LALT,LGUI,          SPC,                RGUI,RALT),

    /* Layer 1: HHKB mode (HHKB Fn)
     * ,-----------------------------------------------------------.
     * |Sle| F1| F2| F3| F4| F5| F6| F7| F8| F9|F10|F11|F12|Ins|Del|
     * |-----------------------------------------------------------|
     * |Caps |   |Up |   |   |   |   |   |   |   |   |  Ü|  ß|Backs|
     * |-----------------------------------------------------------|
     * |      |Lef|Dow|Rig|   |   |   |   |   |   |  Ö|  Ä|Enter   |
     * |-----------------------------------------------------------|
     * |Fn2     |Prv|Ply|Nxt|Mut|VoD|VoU|   |   |PgD|pgU|Shift |   |
     * `-----------------------------------------------------------'
     *       |   |     |                       |     |   |
     *       `-------------------------------------------'
     */
    KEYMAP(SLEP, F1,  F2,  F3,  F4,  F5,  F6,  F7,  F8,  F9,  F10, F11, F12, INS, DEL,  \
           CAPS,TRNS,UP,  TRNS,TRNS,TRNS,TRNS,TRNS,TRNS,TRNS,TRNS,FN5 ,FN6 , BSPC,      \
           TRNS,LEFT,DOWN,RGHT,TRNS,TRNS,TRNS,TRNS,TRNS,TRNS,FN4 ,FN3, ENT,             \
           FN2, MPRV,MPLY,MNXT,MUTE,VOLD,VOLU,TRNS,TRNS,PGDN,PGUP,RSFT,TRNS,            \
                TRNS,TRNS,          TRNS,               TRNS,TRNS),
};

/*
 * Macro definiton
 */
enum macro_id {
    MAC_UMLAUT_A_LOWER,
    MAC_UMLAUT_A_UPPER,
    MAC_UMLAUT_O_LOWER,
    MAC_UMLAUT_O_UPPER,
    MAC_UMLAUT_U_LOWER,
    MAC_UMLAUT_U_UPPER,
    MAC_UMLAUT_S,
    PC_UMLAUT_A_LOWER,
    PC_UMLAUT_A_UPPER,
    PC_UMLAUT_O_LOWER,
    PC_UMLAUT_O_UPPER,
    PC_UMLAUT_U_LOWER,
    PC_UMLAUT_U_UPPER,
    PC_UMLAUT_S,
};

const macro_t *action_get_macro(keyrecord_t *record, uint8_t id, uint8_t opt) {
    keyevent_t event = record->event;

    switch(id) {
        case MAC_UMLAUT_A_LOWER:
            return (event.pressed ?
                    MACRO( D(LALT), T(U), U(LALT), T(A), END ) :
                    MACRO( END ));
        case MAC_UMLAUT_A_UPPER:
            return (event.pressed ?
                    MACRO( D(LALT), T(U), U(LALT), D(LSHIFT), T(A), U(LSHIFT), END ) :
                    MACRO( END ));
        case MAC_UMLAUT_O_LOWER:
            return (event.pressed ?
                    MACRO( D(LALT), T(U), U(LALT), T(O), END ) :
                    MACRO( END ));
        case MAC_UMLAUT_O_UPPER:
            return (event.pressed ?
                    MACRO( D(LALT), T(U), U(LALT), D(LSHIFT), T(O), U(LSHIFT), END ) :
                    MACRO( END ));
        case MAC_UMLAUT_U_LOWER:
            return (event.pressed ?
                    MACRO( D(LALT), T(U), U(LALT), T(U), END ) :
                    MACRO( END ));
        case MAC_UMLAUT_U_UPPER:
            return (event.pressed ?
                    MACRO( D(LALT), T(U), U(LALT), D(LSHIFT), T(U), U(LSHIFT), END ) :
                    MACRO( END ));
        case MAC_UMLAUT_S:
            return (event.pressed ?
                    MACRO( D(LALT), T(S), U(LALT), END ) :
                    MACRO( END ));

        case PC_UMLAUT_A_LOWER:
            return (event.pressed ?
                    MACRO( D(LALT), T(0), T(2), T(2), T(8), U(LALT), END ) :
                    MACRO( END ));
        case PC_UMLAUT_A_UPPER:
            return (event.pressed ?
                    MACRO( D(LALT), T(0), T(1), T(9), T(6), U(LALT), END ) :
                    MACRO( END ));
        case PC_UMLAUT_O_LOWER:
            return (event.pressed ?
                    MACRO( D(LALT), T(0), T(2), T(4), T(6), U(LALT), END ) :
                    MACRO( END ));
        case PC_UMLAUT_O_UPPER:
            return (event.pressed ?
                    MACRO( D(LALT), T(0), T(2), T(1), T(4), U(LALT), END ) :
                    MACRO( END ));
        case PC_UMLAUT_U_LOWER:
            return (event.pressed ?
                    MACRO( D(LALT), T(0), T(5), T(2), T(5), U(LALT), END ) :
                    MACRO( END ));
        case PC_UMLAUT_U_UPPER:
            return (event.pressed ?
                    MACRO( D(LALT), T(0), T(2), T(2), T(0), U(LALT), END ) :
                    MACRO( END ));
        case PC_UMLAUT_S:
            return (event.pressed ?
                    MACRO( D(LALT), T(0), T(2), T(2), T(3), U(LALT), END ) :
                    MACRO( END ));
    }
    return MACRO_NONE;
}

/*
 * Fn action definition
 */
#ifdef KEYMAP_SECTION_ENABLE
const action_t fn_actions[] __attribute__ ((section (".keymap.fn_actions"))) = {
    [0] = ACTION_LAYER_MOMENTARY(1),
    [1] = ACTION_MODS_TAP_KEY(MOD_LCTL, KC_ESC),
    [2] = ACTION_MODS_ONESHOT(MOD_LSFT),
    [3] = ACTION_MACRO(MAC_UMLAUT_A_LOWER),
    [4] = ACTION_MACRO(MAC_UMLAUT_O_LOWER),
    [5] = ACTION_MACRO(MAC_UMLAUT_U_LOWER),
    [6] = ACTION_MACRO(MAC_UMLAUT_S),

};
#else
const action_t fn_actions[] PROGMEM = {
    [0]  = ACTION_LAYER_MOMENTARY(1),
};
#endif
