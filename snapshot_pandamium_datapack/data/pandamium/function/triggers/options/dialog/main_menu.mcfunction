#> Opens the dialog-based main Options menu (replaces the old chat menu opener).
# Built at runtime because some entries are permission-gated:
#   - Gameplay / Privacy / Accessibility: always available
#   - Staff / Server: helper+ only
#   - Alts: only for players with alt accounts
data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog set value \
{ \
    type: "minecraft:multi_action", \
    title: "Pandamium Options", \
    external_title: "Options", \
    body: {type:"minecraft:plain_message",contents:"Select a category.",width:400}, \
    pause: false, \
    after_action: "none", \
    columns: 1, \
    actions: [ \
        { \
            label: "Gameplay...", \
            action: {type:"minecraft:run_command",command:"trigger options set -100001"} \
        }, \
        { \
            label: "Accessibility...", \
            action: {type:"minecraft:run_command",command:"trigger options set -100002"} \
        }, \
         { \
            label: "Privacy...", \
            action: {type:"minecraft:run_command",command:"trigger options set -100003"} \
        } \
    ], \
    "exit_action": {\
						"label": {\
							"translate": "gui.done"\
						},\
						"action": {\
							"type": "minecraft:show_dialog",\
							"dialog": "pandamium:options"\
						}\
					}\
}
execute if predicate pandamium:player/min_staff_perms/helper run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.actions append value {label:{color:"gold",text:"Staff..."},action:{type:"minecraft:run_command",command:"trigger options set 3"}}
execute if predicate pandamium:player/min_staff_perms/helper run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.actions append value {label:{color:"gold",text:"Server..."},action:{type:"minecraft:run_command",command:"trigger options set 4"}}
execute if predicate pandamium:player/min_staff_perms/helper if data storage pandamium.db.players:io selected.entry.data.alts[0] run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.actions append value {label:{color:"gold",text:"Alts..."},action:{type:"minecraft:run_command",command:"trigger options set 5"}}
function pandamium:triggers/options/dialog/show with storage pandamium:local functions."pandamium:triggers/options/*"